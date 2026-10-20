import 'package:flutter_test/flutter_test.dart';
import 'package:pardakhti/core/utils/money_formatter.dart';
import 'package:pardakhti/core/utils/persian_digits.dart';

void main() {
  test('money formatter uses persian digits', () {
    final text = MoneyFormatter.format(1234567, showUnit: true);
    expect(text.contains(PersianDigits.toPersian('1')), isTrue);
    expect(text.contains('ریال'), isTrue);
  });
}
