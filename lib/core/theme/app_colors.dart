import 'package:flutter/material.dart';

/// پالت رنگ — فقط از ThemeExtension / AppTheme استفاده شود؛ hardcode در ویجت‌ها ممنوع.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primary,
    required this.primaryHover,
    required this.primaryMuted,
    required this.accent,
    required this.accentMuted,
    required this.success,
    required this.successMuted,
    required this.warning,
    required this.warningMuted,
    required this.danger,
    required this.dangerMuted,
    required this.info,
    required this.infoMuted,
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.sidebar,
    required this.border,
    required this.borderStrong,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textOnPrimary,
    required this.overlay,
    required this.focusRing,
    required this.skeletonBase,
    required this.skeletonHighlight,
    required this.tableHover,
    required this.sidebarActive,
  });

  final Color primary;
  final Color primaryHover;
  final Color primaryMuted;
  final Color accent;
  final Color accentMuted;
  final Color success;
  final Color successMuted;
  final Color warning;
  final Color warningMuted;
  final Color danger;
  final Color dangerMuted;
  final Color info;
  final Color infoMuted;
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color sidebar;
  final Color border;
  final Color borderStrong;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textOnPrimary;
  final Color overlay;
  final Color focusRing;
  final Color skeletonBase;
  final Color skeletonHighlight;
  final Color tableHover;
  final Color sidebarActive;

  /// تم روشن — نیلی عمیق + فیروزه‌ای ملایم
  static const light = AppColors(
    primary: Color(0xFF3F3FBF),
    primaryHover: Color(0xFF3333A8),
    primaryMuted: Color(0xFFE8E8F8),
    accent: Color(0xFF2A9D8F),
    accentMuted: Color(0xFFE0F5F2),
    success: Color(0xFF2F9E6F),
    successMuted: Color(0xFFE3F6ED),
    warning: Color(0xFFC9851A),
    warningMuted: Color(0xFFFFF4E0),
    danger: Color(0xFFD64545),
    dangerMuted: Color(0xFFFCE8E8),
    info: Color(0xFF3B82B6),
    infoMuted: Color(0xFFE5F1FA),
    background: Color(0xFFF5F6FA),
    surface: Color(0xFFFFFFFF),
    surfaceElevated: Color(0xFFFFFFFF),
    sidebar: Color(0xFFFBFBFE),
    border: Color(0xFFE4E6EF),
    borderStrong: Color(0xFFC9CDD9),
    textPrimary: Color(0xFF1A1C2E),
    textSecondary: Color(0xFF5A5F78),
    textMuted: Color(0xFF8B90A5),
    textOnPrimary: Color(0xFFFFFFFF),
    overlay: Color(0x661A1C2E),
    focusRing: Color(0x663F3FBF),
    skeletonBase: Color(0xFFE8EAF0),
    skeletonHighlight: Color(0xFFF4F5F9),
    tableHover: Color(0xFFF3F4FA),
    sidebarActive: Color(0xFFE8E8F8),
  );

  /// تم تیره
  static const dark = AppColors(
    primary: Color(0xFF7B7BE8),
    primaryHover: Color(0xFF9292F0),
    primaryMuted: Color(0xFF2A2A55),
    accent: Color(0xFF4DB6A9),
    accentMuted: Color(0xFF1A3A36),
    success: Color(0xFF4CBF8A),
    successMuted: Color(0xFF1A3A2C),
    warning: Color(0xFFE0A84A),
    warningMuted: Color(0xFF3A2E18),
    danger: Color(0xFFE86B6B),
    dangerMuted: Color(0xFF3A2020),
    info: Color(0xFF6BA8D4),
    infoMuted: Color(0xFF1C2E3A),
    background: Color(0xFF12131A),
    surface: Color(0xFF1C1E28),
    surfaceElevated: Color(0xFF242733),
    sidebar: Color(0xFF161822),
    border: Color(0xFF2E3140),
    borderStrong: Color(0xFF45495C),
    textPrimary: Color(0xFFF0F1F6),
    textSecondary: Color(0xFFB0B4C6),
    textMuted: Color(0xFF7A7F96),
    textOnPrimary: Color(0xFFFFFFFF),
    overlay: Color(0x99000000),
    focusRing: Color(0x667B7BE8),
    skeletonBase: Color(0xFF2A2D3A),
    skeletonHighlight: Color(0xFF353848),
    tableHover: Color(0xFF262938),
    sidebarActive: Color(0xFF2A2A55),
  );

  @override
  AppColors copyWith({
    Color? primary,
    Color? primaryHover,
    Color? primaryMuted,
    Color? accent,
    Color? accentMuted,
    Color? success,
    Color? successMuted,
    Color? warning,
    Color? warningMuted,
    Color? danger,
    Color? dangerMuted,
    Color? info,
    Color? infoMuted,
    Color? background,
    Color? surface,
    Color? surfaceElevated,
    Color? sidebar,
    Color? border,
    Color? borderStrong,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? textOnPrimary,
    Color? overlay,
    Color? focusRing,
    Color? skeletonBase,
    Color? skeletonHighlight,
    Color? tableHover,
    Color? sidebarActive,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryMuted: primaryMuted ?? this.primaryMuted,
      accent: accent ?? this.accent,
      accentMuted: accentMuted ?? this.accentMuted,
      success: success ?? this.success,
      successMuted: successMuted ?? this.successMuted,
      warning: warning ?? this.warning,
      warningMuted: warningMuted ?? this.warningMuted,
      danger: danger ?? this.danger,
      dangerMuted: dangerMuted ?? this.dangerMuted,
      info: info ?? this.info,
      infoMuted: infoMuted ?? this.infoMuted,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      sidebar: sidebar ?? this.sidebar,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      overlay: overlay ?? this.overlay,
      focusRing: focusRing ?? this.focusRing,
      skeletonBase: skeletonBase ?? this.skeletonBase,
      skeletonHighlight: skeletonHighlight ?? this.skeletonHighlight,
      tableHover: tableHover ?? this.tableHover,
      sidebarActive: sidebarActive ?? this.sidebarActive,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      primaryMuted: Color.lerp(primaryMuted, other.primaryMuted, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentMuted: Color.lerp(accentMuted, other.accentMuted, t)!,
      success: Color.lerp(success, other.success, t)!,
      successMuted: Color.lerp(successMuted, other.successMuted, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningMuted: Color.lerp(warningMuted, other.warningMuted, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerMuted: Color.lerp(dangerMuted, other.dangerMuted, t)!,
      info: Color.lerp(info, other.info, t)!,
      infoMuted: Color.lerp(infoMuted, other.infoMuted, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      sidebar: Color.lerp(sidebar, other.sidebar, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      overlay: Color.lerp(overlay, other.overlay, t)!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
      skeletonBase: Color.lerp(skeletonBase, other.skeletonBase, t)!,
      skeletonHighlight:
          Color.lerp(skeletonHighlight, other.skeletonHighlight, t)!,
      tableHover: Color.lerp(tableHover, other.tableHover, t)!,
      sidebarActive: Color.lerp(sidebarActive, other.sidebarActive, t)!,
    );
  }
}

extension AppColorsX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
