import 'package:flutter/material.dart';

import 'app_colors.dart';

/// مقیاس تایپوگرافی با Vazirmatn — وزن‌ها فقط ۴۰۰ / ۵۰۰ / ۷۰۰.
abstract final class AppTypography {
  static const String fontFamily = 'Vazirmatn';

  static TextTheme textTheme(AppColors colors) {
    TextStyle base(double size, FontWeight weight, {double? height}) =>
        TextStyle(
          fontFamily: fontFamily,
          fontSize: size,
          fontWeight: weight,
          height: height ?? 1.5,
          color: colors.textPrimary,
          letterSpacing: 0,
        );

    return TextTheme(
      displayLarge: base(32, FontWeight.w700, height: 1.3),
      displayMedium: base(28, FontWeight.w700, height: 1.3),
      displaySmall: base(24, FontWeight.w700, height: 1.35),
      headlineLarge: base(22, FontWeight.w700, height: 1.35),
      headlineMedium: base(20, FontWeight.w700, height: 1.4),
      headlineSmall: base(18, FontWeight.w500, height: 1.4),
      titleLarge: base(16, FontWeight.w700, height: 1.4),
      titleMedium: base(15, FontWeight.w500, height: 1.4),
      titleSmall: base(14, FontWeight.w500, height: 1.4),
      bodyLarge: base(15, FontWeight.w400, height: 1.6),
      bodyMedium: base(14, FontWeight.w400, height: 1.55),
      bodySmall: base(13, FontWeight.w400, height: 1.5),
      labelLarge: base(14, FontWeight.w500, height: 1.3),
      labelMedium: base(12, FontWeight.w500, height: 1.3),
      labelSmall: base(11, FontWeight.w500, height: 1.3),
    );
  }

  static TextStyle money(AppColors colors, {double size = 14}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: FontWeight.w500,
        fontFeatures: const [FontFeature.tabularFigures()],
        color: colors.textPrimary,
        height: 1.4,
      );

  static TextStyle caption(AppColors colors) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colors.textMuted,
        height: 1.4,
      );
}
