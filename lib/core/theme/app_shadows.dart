import 'package:flutter/material.dart';

/// سایه‌های بسیار ملایم برای کارت‌ها.
abstract final class AppShadows {
  static List<BoxShadow> card(Color shadowColor) => [
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.03),
          blurRadius: 24,
          offset: const Offset(0, 8),
        ),
      ];

  static List<BoxShadow> elevated(Color shadowColor) => [
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.08),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.04),
          blurRadius: 32,
          offset: const Offset(0, 12),
        ),
      ];
}
