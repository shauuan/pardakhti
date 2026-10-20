import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ExcelReports {
  static Future<File> saveBytes(Uint8List bytes, String fileName) async {
    final dir = await getDownloadsDirectory() ??
        await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, fileName));
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static Uint8List payrollList({
    required String title,
    required List<List<String>> rows,
  }) {
    final excel = Excel.createExcel();
    final sheet = excel['لیست حقوق'];
    excel.delete('Sheet1');
    sheet.appendRow([TextCellValue(title)]);
    sheet.appendRow([
      TextCellValue('کد'),
      TextCellValue('نام'),
      TextCellValue('ناخالص'),
      TextCellValue('بیمه کارگر'),
      TextCellValue('بیمه کارفرما'),
      TextCellValue('بیکاری'),
      TextCellValue('مالیات'),
      TextCellValue('کسور دیگر'),
      TextCellValue('خالص'),
      TextCellValue('هزینه کارفرما'),
    ]);
    for (final r in rows) {
      sheet.appendRow([for (final c in r) TextCellValue(c)]);
    }
    return Uint8List.fromList(excel.encode()!);
  }

  /// لایه export لیست بیمه — تا دریافت مشخصات DSKKAR فقط Excel.
  static Uint8List insuranceList({
    required List<List<String>> rows,
  }) {
    final excel = Excel.createExcel();
    final sheet = excel['لیست بیمه'];
    excel.delete('Sheet1');
    sheet.appendRow([
      TextCellValue('کد پرسنلی'),
      TextCellValue('نام'),
      TextCellValue('شماره بیمه'),
      TextCellValue('روز کارکرد'),
      TextCellValue('دستمزد روزانه'),
      TextCellValue('دستمزد ماهانه'),
      TextCellValue('مزایای مشمول'),
      TextCellValue('جمع مشمول'),
      TextCellValue('سهم کارگر'),
      TextCellValue('سهم کارفرما'),
      TextCellValue('بیمه بیکاری'),
    ]);
    for (final r in rows) {
      sheet.appendRow([for (final c in r) TextCellValue(c)]);
    }
    return Uint8List.fromList(excel.encode()!);
  }

  static Uint8List taxList({required List<List<String>> rows}) {
    final excel = Excel.createExcel();
    final sheet = excel['لیست مالیات'];
    excel.delete('Sheet1');
    sheet.appendRow([
      TextCellValue('کد پرسنلی'),
      TextCellValue('نام'),
      TextCellValue('مشمول مالیات'),
      TextCellValue('مالیات'),
      TextCellValue('خالص'),
    ]);
    for (final r in rows) {
      sheet.appendRow([for (final c in r) TextCellValue(c)]);
    }
    return Uint8List.fromList(excel.encode()!);
  }

  static Uint8List sampleMonthlyInput() {
    final excel = Excel.createExcel();
    final sheet = excel['کارکرد'];
    excel.delete('Sheet1');
    sheet.appendRow([
      TextCellValue('personnel_code'),
      TextCellValue('worked_days'),
      TextCellValue('overtime_hours'),
      TextCellValue('night_hours'),
      TextCellValue('holiday_hours'),
      TextCellValue('bonus'),
      TextCellValue('advance'),
      TextCellValue('loan'),
      TextCellValue('penalty'),
    ]);
    sheet.appendRow([
      TextCellValue('1001'),
      TextCellValue('30'),
      TextCellValue('0'),
      TextCellValue('0'),
      TextCellValue('0'),
      TextCellValue('0'),
      TextCellValue('0'),
      TextCellValue('0'),
      TextCellValue('0'),
    ]);
    return Uint8List.fromList(excel.encode()!);
  }
}
