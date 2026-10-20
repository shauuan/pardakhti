/// قاعده گرد کردن مبالغ ریالی.
enum RoundingMode {
  nearestRial,
  nearestTen,
  nearestHundred,
}

abstract final class MoneyRounding {
  static int apply(int amount, RoundingMode mode) {
    if (amount == 0) return 0;
    final negative = amount < 0;
    var a = amount.abs();
    switch (mode) {
      case RoundingMode.nearestRial:
        break;
      case RoundingMode.nearestTen:
        a = ((a + 5) ~/ 10) * 10;
      case RoundingMode.nearestHundred:
        a = ((a + 50) ~/ 100) * 100;
    }
    return negative ? -a : a;
  }
}
