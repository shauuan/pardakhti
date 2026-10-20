import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/fiscal_settings.dart';
import '../domain/payroll_engine.dart';
import '../domain/payroll_models.dart';

class PayrollService {
  PayrollService(this._db);

  final AppDatabase _db;
  final _engine = const PayrollEngine();

  Future<FiscalSettings> settingsForYear(int year) async {
    final row = await (_db.select(_db.fiscalYearSettings)
          ..where((t) => t.year.equals(year)))
        .getSingleOrNull();
    if (row == null) return FiscalSettings.defaults1405();
    return FiscalSettings.fromJson(
      jsonDecode(row.settingsJson) as Map<String, dynamic>,
    );
  }

  Future<MonthlyPeriod> ensurePeriod(int year, int month) async {
    final existing = await (_db.select(_db.monthlyPeriods)
          ..where((t) => t.year.equals(year))
          ..where((t) => t.month.equals(month)))
        .getSingleOrNull();
    if (existing != null) return existing;
    final id = await _db.into(_db.monthlyPeriods).insert(
          MonthlyPeriodsCompanion.insert(year: year, month: month),
        );
    return (await (_db.select(_db.monthlyPeriods)
          ..where((t) => t.id.equals(id)))
        .getSingle());
  }

  Future<List<PayrollEngineResult>> calculatePeriod({
    required int year,
    required int month,
  }) async {
    final period = await ensurePeriod(year, month);
    if (period.status == 'locked') {
      throw StateError('ماه قفل است؛ ابتدا قفل را باز کنید.');
    }
    final settings = await settingsForYear(year);
    final employees = await (_db.select(_db.employees)
          ..where((t) => t.active.equals(true)))
        .get();

    final results = <PayrollEngineResult>[];
    for (final emp in employees) {
      var inputRow = await (_db.select(_db.monthlyInputs)
            ..where((t) => t.periodId.equals(period.id))
            ..where((t) => t.employeeId.equals(emp.id)))
          .getSingleOrNull();

      inputRow ??= await () async {
        final id = await _db.into(_db.monthlyInputs).insert(
              MonthlyInputsCompanion.insert(
                periodId: period.id,
                employeeId: emp.id,
              ),
            );
        return (_db.select(_db.monthlyInputs)..where((t) => t.id.equals(id)))
            .getSingle();
      }();

      final years = DateTime.now().difference(emp.hireDate).inDays ~/ 365;
      final seniority = emp.seniorityBases ?? (years < 1 ? 0 : years);

      final worked = (inputRow.workedDays - inputRow.absenceDays -
              inputRow.unpaidLeaveDays)
          .clamp(0, 31);

      final engineInput = PayrollEngineInput(
        settings: settings,
        year: year,
        month: month,
        dailyWage: emp.dailyWage,
        workedDays: worked,
        seniorityBases: seniority,
        childrenCount: emp.childrenCount,
        childAllowanceEligible: emp.childAllowanceEligible,
        married: emp.married,
        isHardJob: emp.isHardJob,
        jobAllowanceMonthly: emp.jobAllowanceMonthly,
        overtimeHours: inputRow.overtimeHours,
        nightHours: inputRow.nightHours,
        holidayHours: inputRow.holidayHours,
        manualEarnings: const [],
        manualDeductions: const [],
        bonusAmount: inputRow.bonusAmount,
        advanceAmount: inputRow.advanceAmount,
        loanAmount: inputRow.loanAmount,
        penaltyAmount: inputRow.penaltyAmount,
      );

      final result = _engine.calculate(engineInput);
      results.add(result);

      final existingResult = await (_db.select(_db.payrollResults)
            ..where((t) => t.periodId.equals(period.id))
            ..where((t) => t.employeeId.equals(emp.id)))
          .getSingleOrNull();

      final companion = PayrollResultsCompanion.insert(
        periodId: period.id,
        employeeId: emp.id,
        gross: result.gross,
        insuranceBase: result.insuranceBase,
        employeeInsurance: result.employeeInsurance,
        employerInsurance: result.employerInsurance,
        unemploymentInsurance: result.unemploymentInsurance,
        taxBase: result.taxBase,
        tax: result.tax,
        otherDeductions: result.otherDeductions,
        net: result.net,
        employerTotalCost: result.employerTotalCost,
        breakdownJson: jsonEncode(result.toJson()),
      );

      if (existingResult == null) {
        await _db.into(_db.payrollResults).insert(companion);
      } else {
        await (_db.update(_db.payrollResults)
              ..where((t) => t.id.equals(existingResult.id)))
            .write(
          PayrollResultsCompanion(
            gross: Value(result.gross),
            insuranceBase: Value(result.insuranceBase),
            employeeInsurance: Value(result.employeeInsurance),
            employerInsurance: Value(result.employerInsurance),
            unemploymentInsurance: Value(result.unemploymentInsurance),
            taxBase: Value(result.taxBase),
            tax: Value(result.tax),
            otherDeductions: Value(result.otherDeductions),
            net: Value(result.net),
            employerTotalCost: Value(result.employerTotalCost),
            breakdownJson: Value(jsonEncode(result.toJson())),
          ),
        );
      }
    }

    await _db.into(_db.auditLogs).insert(
          AuditLogsCompanion.insert(
            action: 'calculate',
            entityType: 'period',
            entityId: Value('${period.id}'),
            summary: 'محاسبه حقوق $year/$month برای ${employees.length} نفر',
          ),
        );

    return results;
  }

  Future<void> lockPeriod(int year, int month) async {
    final period = await ensurePeriod(year, month);
    final settings = await settingsForYear(year);
    await (_db.update(_db.monthlyPeriods)
          ..where((t) => t.id.equals(period.id)))
        .write(
      MonthlyPeriodsCompanion(
        status: const Value('locked'),
        lockedAt: Value(DateTime.now()),
        settingsSnapshotJson: Value(jsonEncode(settings.toJson())),
      ),
    );
    await _db.into(_db.auditLogs).insert(
          AuditLogsCompanion.insert(
            action: 'lock',
            entityType: 'period',
            entityId: Value('${period.id}'),
            summary: 'قفل ماه $year/$month',
          ),
        );
  }

  Future<void> unlockPeriod(int year, int month, String reason) async {
    final period = await ensurePeriod(year, month);
    await (_db.update(_db.monthlyPeriods)
          ..where((t) => t.id.equals(period.id)))
        .write(
      const MonthlyPeriodsCompanion(
        status: Value('draft'),
        lockedAt: Value(null),
      ),
    );
    await _db.into(_db.auditLogs).insert(
          AuditLogsCompanion.insert(
            action: 'unlock',
            entityType: 'period',
            entityId: Value('${period.id}'),
            summary: 'بازکردن قفل $year/$month',
            reason: Value(reason),
          ),
        );
  }
}
