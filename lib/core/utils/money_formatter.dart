import 'package:intl/intl.dart';

import 'persian_digits.dart';

/// واحد نمایش — ذخیره همیشه ریال است.
enum DisplayCurrency { rial, toman }

/// قالب‌بندی مبالغ با جداکننده هزارگان و ارقام فارسی.
abstract final class MoneyFormatter {
  static final NumberFormat _group = NumberFormat('#,###', 'en_US');

  /// [amountRials] همیشه به ریال.
  static String format(
    int amountRials, {
    DisplayCurrency unit = DisplayCurrency.rial,
    bool showUnit = true,
    bool persianDigits = true,
  }) {
    final value =
        unit == DisplayCurrency.toman ? amountRials ~/ 10 : amountRials;
    var text = _group.format(value);
    if (persianDigits) {
      text = PersianDigits.toPersian(text);
    }
    if (!showUnit) return text;
    return '$text ${unitLabel(unit)}';
  }

  static String unitLabel(DisplayCurrency unit) =>
      unit == DisplayCurrency.toman ? 'تومان' : 'ریال';

  /// پارس ورودی کاربر (ارقام فارسی/لاتین، جداکننده، تومان/ریال).
  static int? tryParseRials(
    String raw, {
    DisplayCurrency unit = DisplayCurrency.rial,
  }) {
    final cleaned = PersianDigits.toEnglish(raw)
        .replaceAll(RegExp(r'[^\d-]'), '')
        .trim();
    if (cleaned.isEmpty || cleaned == '-') return null;
    final parsed = int.tryParse(cleaned);
    if (parsed == null) return null;
    return unit == DisplayCurrency.toman ? parsed * 10 : parsed;
  }
}
