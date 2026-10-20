import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../domain/report_exporter_mapper.dart';

class PayslipData {
  const PayslipData({
    required this.companyName,
    required this.employeeName,
    required this.personnelCode,
    required this.year,
    required this.month,
    required this.earnings,
    required this.deductions,
    required this.gross,
    required this.net,
  });

  final String companyName;
  final String employeeName;
  final String personnelCode;
  final int year;
  final int month;
  final List<(String, int)> earnings;
  final List<(String, int)> deductions;
  final int gross;
  final int net;
}

class PayslipPdf {
  static Future<Uint8List> build(
    PayslipData data, {
    PdfPageFormat format = PdfPageFormat.a4,
  }) async {
    final fontData =
        await rootBundle.load('assets/fonts/Vazirmatn-Regular.ttf');
    final boldData = await rootBundle.load('assets/fonts/Vazirmatn-Bold.ttf');
    final font = pw.Font.ttf(fontData);
    final bold = pw.Font.ttf(boldData);

    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(28),
        theme: pw.ThemeData.withFont(base: font, bold: bold),
        textDirection: pw.TextDirection.rtl,
        build: (ctx) {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
              children: [
                pw.Text(
                  data.companyName,
                  style: pw.TextStyle(font: bold, fontSize: 16),
                  textAlign: pw.TextAlign.center,
                ),
                pw.SizedBox(height: 6),
                pw.Text(
                  'فیش حقوقی',
                  style: pw.TextStyle(font: bold, fontSize: 14),
                  textAlign: pw.TextAlign.center,
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  'دوره ${data.year}/${data.month} — ${data.employeeName} (${data.personnelCode})',
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 10),
                ),
                pw.SizedBox(height: 16),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      child: _col('مزایا', data.earnings, font, bold),
                    ),
                    pw.SizedBox(width: 12),
                    pw.Expanded(
                      child: _col('کسورات', data.deductions, font, bold),
                    ),
                  ],
                ),
                pw.SizedBox(height: 16),
                pw.Divider(),
                _kv('جمع ناخالص', ReportNumberMapper.faMoney(data.gross), bold),
                _kv('خالص پرداختی', ReportNumberMapper.faMoney(data.net), bold),
                pw.SizedBox(height: 8),
                pw.Text(
                  'به حروف: ${ReportNumberMapper.rialsToWords(data.net)}',
                  style: const pw.TextStyle(fontSize: 9),
                ),
                pw.Spacer(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    _sign('امضای کارمند', font),
                    _sign('امضای کارفرما', font),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
    return doc.save();
  }

  static pw.Widget _col(
    String title,
    List<(String, int)> rows,
    pw.Font font,
    pw.Font bold,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.Text(title, style: pw.TextStyle(font: bold, fontSize: 11)),
        pw.SizedBox(height: 6),
        ...rows.map(
          (r) => pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 4),
            child: pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Text(r.$1, style: const pw.TextStyle(fontSize: 9)),
                ),
                pw.Text(
                  ReportNumberMapper.faMoney(r.$2.abs()),
                  style: const pw.TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static pw.Widget _kv(String k, String v, pw.Font bold) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.Row(
        children: [
          pw.Expanded(child: pw.Text(k, style: pw.TextStyle(font: bold))),
          pw.Text(v, style: pw.TextStyle(font: bold)),
        ],
      ),
    );
  }

  static pw.Widget _sign(String label, pw.Font font) {
    return pw.Column(
      children: [
        pw.SizedBox(height: 40),
        pw.Container(
          width: 120,
          decoration: const pw.BoxDecoration(
            border: pw.Border(top: pw.BorderSide()),
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(label, style: const pw.TextStyle(fontSize: 9)),
      ],
    );
  }
}
