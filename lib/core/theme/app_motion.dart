import 'package:flutter/animation.dart';

/// مدت و منحنی انیمیشن‌های استاندارد.
abstract final class AppMotion {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 220);
  static const Duration slow = Duration(milliseconds: 300);

  static const Curve curve = Curves.easeOutCubic;
}
