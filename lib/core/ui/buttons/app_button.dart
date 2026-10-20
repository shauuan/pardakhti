import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_motion.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';

enum AppButtonVariant { primary, secondary, ghost, danger }

enum AppButtonSize { sm, md, lg }

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.icon,
    this.loading = false,
    this.expanded = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final bool loading;
  final bool expanded;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hovered = false;
  bool _focused = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final enabled = widget.onPressed != null && !widget.loading;
    final padding = switch (widget.size) {
      AppButtonSize.sm =>
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      AppButtonSize.md =>
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      AppButtonSize.lg =>
        const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    };
    final fontSize = switch (widget.size) {
      AppButtonSize.sm => 13.0,
      AppButtonSize.md => 14.0,
      AppButtonSize.lg => 15.0,
    };

    final bg = _background(colors, enabled);
    final fg = _foreground(colors, enabled);
    final border = _border(colors, enabled);

    final child = Row(
      mainAxisSize: widget.expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.loading) ...[
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: fg,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
        ] else if (widget.icon != null) ...[
          Icon(widget.icon, size: fontSize + 4, color: fg),
          const SizedBox(width: AppSpacing.xs),
        ],
        Text(
          widget.label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: fg,
          ),
        ),
      ],
    );

    return FocusableActionDetector(
      onShowHoverHighlight: (v) => setState(() => _hovered = v),
      onShowFocusHighlight: (v) => setState(() => _focused = v),
      mouseCursor:
          enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTapDown: enabled ? (_) => setState(() => _pressed = true) : null,
        onTapUp: enabled ? (_) => setState(() => _pressed = false) : null,
        onTapCancel: () => setState(() => _pressed = false),
        onTap: enabled ? widget.onPressed : null,
        child: AnimatedScale(
          scale: _pressed ? 0.98 : 1.0,
          duration: AppMotion.fast,
          curve: AppMotion.curve,
          child: AnimatedContainer(
            duration: AppMotion.fast,
            curve: AppMotion.curve,
            padding: padding,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: AppRadii.mdAll,
              border: Border.all(color: border),
              boxShadow: _focused
                  ? [
                      BoxShadow(
                        color: colors.focusRing,
                        blurRadius: 0,
                        spreadRadius: 3,
                      ),
                    ]
                  : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Color _background(AppColors colors, bool enabled) {
    if (!enabled) {
      return switch (widget.variant) {
        AppButtonVariant.primary || AppButtonVariant.danger =>
          colors.border,
        _ => Colors.transparent,
      };
    }
    return switch (widget.variant) {
      AppButtonVariant.primary =>
        _hovered ? colors.primaryHover : colors.primary,
      AppButtonVariant.secondary =>
        _hovered ? colors.primaryMuted : colors.surface,
      AppButtonVariant.ghost =>
        _hovered ? colors.tableHover : Colors.transparent,
      AppButtonVariant.danger =>
        _hovered ? colors.danger.withValues(alpha: 0.9) : colors.danger,
    };
  }

  Color _foreground(AppColors colors, bool enabled) {
    if (!enabled) return colors.textMuted;
    return switch (widget.variant) {
      AppButtonVariant.primary || AppButtonVariant.danger =>
        colors.textOnPrimary,
      AppButtonVariant.secondary => colors.primary,
      AppButtonVariant.ghost => colors.textPrimary,
    };
  }

  Color _border(AppColors colors, bool enabled) {
    if (!enabled) return colors.border;
    return switch (widget.variant) {
      AppButtonVariant.secondary => colors.border,
      AppButtonVariant.ghost => Colors.transparent,
      _ => Colors.transparent,
    };
  }
}
