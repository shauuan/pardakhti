import 'package:flutter/animation.dart';

/// مدت و منحنی انیمیشن‌های استاندارد — نرم و سریع.
abstract final class AppMotion {
  static const Duration instant = Duration(milliseconds: 90);
  static const Duration fast = Duration(milliseconds: 160);
  static const Duration normal = Duration(milliseconds: 260);
  static const Duration slow = Duration(milliseconds: 380);
  static const Duration emphasize = Duration(milliseconds: 480);

  static const Curve curve = Curves.easeOutCubic;
  static const Curve curveIn = Curves.easeInCubic;
  static const Curve curveEmphasized = Curves.easeOutQuint;
  static const Curve curveSpring = Curves.easeOutBack;

  static Duration stagger(int index, {int stepMs = 55}) =>
      Duration(milliseconds: stepMs * index);
}
