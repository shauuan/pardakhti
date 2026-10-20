import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../../core/database/app_database.dart';
import 'excel_reports.dart';
import 'payslip_pdf.dart';

class ReportsService {
  ReportsService(this._db);

  final AppDatabase _db;

  Future<({MonthlyPeriod period, List<PayrollResult> results, Map<int, Employee> employees, CompanyProfileData company})>
      _load(int year, int month) async {
    final period = await (_db.select(_db.monthlyPeriods)
          ..where((t) => t.year.equals(year))
          ..where((t) => t.month.equals(month)))
        .getSingleOrNull();
    if (period == null) {
      throw StateError('برای این ماه محاسبه‌ای وجود ندارد');
    }
    final results = await (_db.select(_db.payrollResults)
          ..where((t) => t.periodId.equals(period.id)))
        .get();
    final employees = {
      for (final e in await _db.select(_db.employees).get()) e.id: e,
    };
    final company = await (_db.select(_db.companyProfile)
          ..where((t) => t.id.equals(1)))
        .getSingle();
    return (
      period: period,
      results: results,
      employees: employees,
      company: company,
    );
  }

  Future<File> exportPayrollExcel(int year, int month) async {
    final data = await _load(year, month);
    final rows = <List<String>>[];
    for (final r in data.results) {
      final e = data.employees[r.employeeId];
      if (e == null) continue;
      rows.add([
        e.personnelCode,
        '${e.firstName} ${e.lastName}',
        '${r.gross}',
        '${r.employeeInsurance}',
        '${r.employerInsurance}',
        '${r.unemploymentInsurance}',
        '${r.tax}',
        '${r.otherDeductions}',
        '${r.net}',
        '${r.employerTotalCost}',
      ]);
    }
    final bytes = ExcelReports.payrollList(
      title: 'لیست حقوق $year/$month',
      rows: rows,
    );
    return ExcelReports.saveBytes(bytes, 'payroll-$year-$month.xlsx');
  }

  Future<File> exportInsuranceExcel(int year, int month) async {
    final data = await _load(year, month);
    final inputs = await (_db.select(_db.monthlyInputs)
          ..where((t) => t.periodId.equals(data.period.id)))
        .get();
    final inputByEmp = {for (final i in inputs) i.employeeId: i};
    final rows = <List<String>>[];
    for (final r in data.results) {
      final e = data.employees[r.employeeId];
      if (e == null) continue;
      final inp = inputByEmp[e.id];
      final days = inp?.workedDays ?? 30;
      final monthlyBase = e.dailyWage * days;
      final subjectBenefits = (r.insuranceBase - monthlyBase).clamp(0, 1 << 62);
      rows.add([
        e.personnelCode,
        '${e.firstName} ${e.lastName}',
        e.insuranceNumber ?? '',
        '$days',
        '${e.dailyWage}',
        '$monthlyBase',
        '$subjectBenefits',
        '${r.insuranceBase}',
        '${r.employeeInsurance}',
        '${r.employerInsurance}',
        '${r.unemploymentInsurance}',
      ]);
    }
    final bytes = ExcelReports.insuranceList(rows: rows);
    return ExcelReports.saveBytes(bytes, 'insurance-$year-$month.xlsx');
  }

  Future<File> exportTaxExcel(int year, int month) async {
    final data = await _load(year, month);
    final rows = <List<String>>[];
    for (final r in data.results) {
      final e = data.employees[r.employeeId];
      if (e == null) continue;
      rows.add([
        e.personnelCode,
        '${e.firstName} ${e.lastName}',
        '${r.taxBase}',
        '${r.tax}',
        '${r.net}',
      ]);
    }
    final bytes = ExcelReports.taxList(rows: rows);
    return ExcelReports.saveBytes(bytes, 'tax-$year-$month.xlsx');
  }

  Future<void> printPayslip({
    required int year,
    required int month,
    required int employeeId,
    bool a5 = false,
  }) async {
    final data = await _load(year, month);
    final e = data.employees[employeeId];
    PayrollResult? r;
    for (final item in data.results) {
      if (item.employeeId == employeeId) {
        r = item;
        break;
      }
    }
    if (e == null || r == null) {
      throw StateError('نتیجه برای این پرسنل یافت نشد');
    }
    final map = jsonDecode(r.breakdownJson) as Map<String, dynamic>;
    final lines = (map['lines'] as List).cast<Map<String, dynamic>>();
    final earnings = <(String, int)>[];
    final deductions = <(String, int)>[];
    for (final l in lines) {
      final amount = l['amount'] as int;
      final label = '${l['label']}';
      if (amount > 0 &&
          l['code'] != 'ins_employer' &&
          l['code'] != 'ins_unemployment') {
        earnings.add((label, amount));
      } else if (amount < 0) {
        deductions.add((label, amount));
      }
    }
    final bytes = await PayslipPdf.build(
      PayslipData(
        companyName: data.company.name.isEmpty ? 'شرکت' : data.company.name,
        employeeName: '${e.firstName} ${e.lastName}',
        personnelCode: e.personnelCode,
        year: year,
        month: month,
        earnings: earnings,
        deductions: deductions,
        gross: r.gross,
        net: r.net,
      ),
      format: a5 ? PdfPageFormat.a5 : PdfPageFormat.a4,
    );
    await Printing.layoutPdf(onLayout: (_) async => bytes);
  }

  Future<void> printAllPayslips(int year, int month, {bool a5 = false}) async {
    final data = await _load(year, month);
    for (final r in data.results) {
      await printPayslip(
        year: year,
        month: month,
        employeeId: r.employeeId,
        a5: a5,
      );
    }
  }

  Future<Uint8List> sampleImportFile() async => ExcelReports.sampleMonthlyInput();
}
