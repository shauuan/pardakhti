/// پله مالیات — مبالغ به ریال روی درآمد مشمول.
class TaxBracket {
  const TaxBracket({
    required this.fromAmount,
    this.toAmount,
    required this.ratePercent,
  });

  final int fromAmount;

  /// null = بدون سقف
  final int? toAmount;
  final int ratePercent;
}

enum TaxTableBasis { monthly, annual }
