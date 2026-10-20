import '../../../core/utils/persian_digits.dart';

/// تبدیل عدد به حروف فارسی (ساده‌شده برای فیش).
abstract final class ReportNumberMapper {
  static const _ones = [
    '',
    'یک',
    'دو',
    'سه',
    'چهار',
    'پنج',
    'شش',
    'هفت',
    'هشت',
    'نه',
  ];
  static const _tens = [
    '',
    'ده',
    'بیست',
    'سی',
    'چهل',
    'پنجاه',
    'شصت',
    'هفتاد',
    'هشتاد',
    'نود',
  ];
  static const _teens = [
    'ده',
    'یازده',
    'دوازده',
    'سیزده',
    'چهارده',
    'پانزده',
    'شانزده',
    'هفده',
    'هجده',
    'نوزده',
  ];
  static const _hundreds = [
    '',
    'یکصد',
    'دویست',
    'سیصد',
    'چهارصد',
    'پانصد',
    'ششصد',
    'هفتصد',
    'هشتصد',
    'نهصد',
  ];

  static String rialsToWords(int amount) {
    if (amount == 0) return 'صفر ریال';
    final neg = amount < 0;
    var n = amount.abs();
    final parts = <String>[];
    const scales = ['', 'هزار', 'میلیون', 'میلیارد', 'تریلیون'];
    var scale = 0;
    while (n > 0 && scale < scales.length) {
      final chunk = n % 1000;
      if (chunk > 0) {
        final w = _three(chunk);
        final s = scales[scale];
        parts.add(s.isEmpty ? w : '$w $s');
      }
      n ~/= 1000;
      scale++;
    }
    final body = parts.reversed.join(' و ');
    return '${neg ? 'منفی ' : ''}$body ریال';
  }

  static String _three(int n) {
    final h = n ~/ 100;
    final t = (n % 100) ~/ 10;
    final o = n % 10;
    final bits = <String>[];
    if (h > 0) bits.add(_hundreds[h]);
    if (t == 1) {
      bits.add(_teens[o]);
    } else {
      if (t > 0) bits.add(_tens[t]);
      if (o > 0) bits.add(_ones[o]);
    }
    return bits.join(' و ');
  }

  static String faMoney(int rials) =>
      PersianDigits.toPersian(
        rials.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
        ),
      );
}
