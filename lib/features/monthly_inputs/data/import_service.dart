import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:excel/excel.dart';

import '../../../core/database/app_database.dart';

class ImportRowError {
  const ImportRowError({required this.row, required this.message});

  final int row;
  final String message;
}

class ImportPreviewRow {
  const ImportPreviewRow({
    required this.rowIndex,
    required this.personnelCode,
    required this.workedDays,
    required this.overtime,
    required this.night,
    required this.holiday,
    required this.bonus,
    required this.advance,
    required this.loan,
    required this.penalty,
    this.error,
    this.employeeId,
  });

  final int rowIndex;
  final String personnelCode;
  final int workedDays;
  final double overtime;
  final double night;
  final double holiday;
  final int bonus;
  final int advance;
  final int loan;
  final int penalty;
  final String? error;
  final int? employeeId;

  bool get ok => error == null && employeeId != null;
}

class ImportService {
  ImportService(this._db);

  final AppDatabase _db;

  Future<List<ImportPreviewRow>> previewFile(String path) async {
    final lower = path.toLowerCase();
    if (lower.endsWith('.csv')) {
      return _previewCsv(await File(path).readAsString());
    }
    return _previewExcel(await File(path).readAsBytes());
  }

  Future<List<ImportPreviewRow>> _previewCsv(String content) async {
    final rows = const CsvToListConverter().convert(content);
    return _mapRows(rows);
  }

  Future<List<ImportPreviewRow>> _previewExcel(List<int> bytes) async {
    final excel = Excel.decodeBytes(bytes);
    final sheet = excel.tables.values.first;
    final rows = <List<dynamic>>[];
    for (final row in sheet.rows) {
      rows.add([for (final c in row) c?.value]);
    }
    return _mapRows(rows);
  }

  Future<List<ImportPreviewRow>> _mapRows(List<List<dynamic>> rows) async {
    if (rows.isEmpty) return [];
    final header = rows.first.map((e) => '$e'.trim().toLowerCase()).toList();
    int idx(String key) => header.indexWhere((h) => h.contains(key));

    final codeI = idx('personnel');
    final daysI = idx('worked');
    final otI = idx('overtime');
    final nightI = idx('night');
    final holI = idx('holiday');
    final bonusI = idx('bonus');
    final advI = idx('advance');
    final loanI = idx('loan');
    final penI = idx('penalty');

    final employees = await _db.select(_db.employees).get();
    final byCode = {for (final e in employees) e.personnelCode: e};

    final out = <ImportPreviewRow>[];
    for (var i = 1; i < rows.length; i++) {
      final r = rows[i];
      String cell(int i) =>
          (i >= 0 && i < r.length && r[i] != null) ? '${r[i]}'.trim() : '';

      final code = cell(codeI >= 0 ? codeI : 0);
      if (code.isEmpty) continue;
      final emp = byCode[code];
      String? error;
      if (emp == null) error = 'کد پرسنلی یافت نشد';

      int parseInt(String s, int fallback) =>
          int.tryParse(s.replaceAll(',', '')) ?? fallback;
      double parseDouble(String s) =>
          double.tryParse(s.replaceAll(',', '')) ?? 0;

      out.add(
        ImportPreviewRow(
          rowIndex: i + 1,
          personnelCode: code,
          workedDays: parseInt(cell(daysI), 30),
          overtime: parseDouble(cell(otI)),
          night: parseDouble(cell(nightI)),
          holiday: parseDouble(cell(holI)),
          bonus: parseInt(cell(bonusI), 0),
          advance: parseInt(cell(advI), 0),
          loan: parseInt(cell(loanI), 0),
          penalty: parseInt(cell(penI), 0),
          error: error,
          employeeId: emp?.id,
        ),
      );
    }
    return out;
  }

  Future<int> apply({
    required int year,
    required int month,
    required List<ImportPreviewRow> rows,
  }) async {
    final okRows = rows.where((r) => r.ok).toList();
    final period = await (_db.select(_db.monthlyPeriods)
          ..where((t) => t.year.equals(year))
          ..where((t) => t.month.equals(month)))
        .getSingleOrNull();

    late final int periodId;
    if (period == null) {
      periodId = await _db.into(_db.monthlyPeriods).insert(
            MonthlyPeriodsCompanion.insert(year: year, month: month),
          );
    } else {
      if (period.status == 'locked') {
        throw StateError('ماه قفل است');
      }
      periodId = period.id;
    }

    var count = 0;
    for (final row in okRows) {
      final existing = await (_db.select(_db.monthlyInputs)
            ..where((t) => t.periodId.equals(periodId))
            ..where((t) => t.employeeId.equals(row.employeeId!)))
          .getSingleOrNull();

      final companion = MonthlyInputsCompanion(
        workedDays: Value(row.workedDays),
        overtimeHours: Value(row.overtime),
        nightHours: Value(row.night),
        holidayHours: Value(row.holiday),
        bonusAmount: Value(row.bonus),
        advanceAmount: Value(row.advance),
        loanAmount: Value(row.loan),
        penaltyAmount: Value(row.penalty),
      );

      if (existing == null) {
        await _db.into(_db.monthlyInputs).insert(
              MonthlyInputsCompanion.insert(
                periodId: periodId,
                employeeId: row.employeeId!,
                workedDays: Value(row.workedDays),
                overtimeHours: Value(row.overtime),
                nightHours: Value(row.night),
                holidayHours: Value(row.holiday),
                bonusAmount: Value(row.bonus),
                advanceAmount: Value(row.advance),
                loanAmount: Value(row.loan),
                penaltyAmount: Value(row.penalty),
              ),
            );
      } else {
        await (_db.update(_db.monthlyInputs)
              ..where((t) => t.id.equals(existing.id)))
            .write(companion);
      }
      count++;
    }

    await _db.into(_db.auditLogs).insert(
          AuditLogsCompanion.insert(
            action: 'import',
            entityType: 'monthly_input',
            summary: 'ایمپورت $count ردیف برای $year/$month',
            afterJson: Value(jsonEncode({'count': count})),
          ),
        );
    return count;
  }
}
