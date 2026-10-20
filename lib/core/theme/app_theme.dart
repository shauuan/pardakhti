import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_radii.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData light() => _build(AppColors.light, Brightness.light);
  static ThemeData dark() => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors colors, Brightness brightness) {
    final textTheme = AppTypography.textTheme(colors);
    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: AppTypography.fontFamily,
      textTheme: textTheme,
      scaffoldBackgroundColor: colors.background,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: colors.textOnPrimary,
        secondary: colors.accent,
        onSecondary: colors.textOnPrimary,
        error: colors.danger,
        onError: colors.textOnPrimary,
        surface: colors.surface,
        onSurface: colors.textPrimary,
      ),
      extensions: [colors],
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        systemOverlayStyle: brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadii.lgAll,
          side: BorderSide(color: colors.border),
        ),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: DividerThemeData(
        color: colors.border,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: AppRadii.mdAll,
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadii.mdAll,
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadii.mdAll,
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadii.mdAll,
          borderSide: BorderSide(color: colors.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadii.mdAll,
          borderSide: BorderSide(color: colors.danger, width: 1.5),
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(color: colors.textSecondary),
        hintStyle: textTheme.bodyMedium?.copyWith(color: colors.textMuted),
        errorStyle: textTheme.bodySmall?.copyWith(color: colors.danger),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colors.textPrimary,
          borderRadius: AppRadii.smAll,
        ),
        textStyle: textTheme.labelMedium?.copyWith(color: colors.surface),
        waitDuration: const Duration(milliseconds: 400),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surfaceElevated,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.lgAll),
        titleTextStyle: textTheme.headlineSmall,
        contentTextStyle: textTheme.bodyMedium,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.textPrimary,
        contentTextStyle:
            textTheme.bodyMedium?.copyWith(color: colors.surface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.mdAll),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(8),
        radius: const Radius.circular(8),
        thumbColor: WidgetStateProperty.all(
          colors.textMuted.withValues(alpha: 0.4),
        ),
      ),
      focusColor: colors.focusRing,
      hoverColor: colors.tableHover,
      splashColor: colors.primaryMuted,
      highlightColor: colors.primaryMuted.withValues(alpha: 0.4),
    );
  }
}
