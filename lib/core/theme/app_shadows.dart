import 'package:flutter/material.dart';

/// لایه‌های سایه — عمق واقعی بدون شلوغی.
abstract final class AppShadows {
  static List<BoxShadow> soft(Color ink) => [
        BoxShadow(
          color: ink.withValues(alpha: 0.035),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: ink.withValues(alpha: 0.05),
          blurRadius: 12,
          offset: const Offset(0, 4),
          spreadRadius: -2,
        ),
      ];

  static List<BoxShadow> card(Color ink) => [
        BoxShadow(
          color: ink.withValues(alpha: 0.04),
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: ink.withValues(alpha: 0.06),
          blurRadius: 16,
          offset: const Offset(0, 6),
          spreadRadius: -4,
        ),
        BoxShadow(
          color: ink.withValues(alpha: 0.03),
          blurRadius: 32,
          offset: const Offset(0, 14),
          spreadRadius: -8,
        ),
      ];

  static List<BoxShadow> elevated(Color ink) => [
        BoxShadow(
          color: ink.withValues(alpha: 0.06),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: ink.withValues(alpha: 0.1),
          blurRadius: 24,
          offset: const Offset(0, 10),
          spreadRadius: -4,
        ),
        BoxShadow(
          color: ink.withValues(alpha: 0.05),
          blurRadius: 48,
          offset: const Offset(0, 20),
          spreadRadius: -12,
        ),
      ];

  static List<BoxShadow> float(Color ink) => [
        BoxShadow(
          color: ink.withValues(alpha: 0.08),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: ink.withValues(alpha: 0.12),
          blurRadius: 40,
          offset: const Offset(0, 16),
          spreadRadius: -6,
        ),
      ];

  static List<BoxShadow> primaryGlow(Color primary) => [
        BoxShadow(
          color: primary.withValues(alpha: 0.22),
          blurRadius: 16,
          offset: const Offset(0, 6),
          spreadRadius: -2,
        ),
      ];
}
