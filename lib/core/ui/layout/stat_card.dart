import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_motion.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import '../../utils/money_formatter.dart';
import '../../utils/persian_digits.dart';

class StatCard extends StatefulWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.tone = StatCardTone.primary,
    this.isMoney = false,
    this.animationIndex = 0,
    this.onTap,
  });

  final String title;
  final int value;
  final String? subtitle;
  final IconData? icon;
  final StatCardTone tone;
  final bool isMoney;
  final int animationIndex;
  final VoidCallback? onTap;

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (bg, fg) = switch (widget.tone) {
      StatCardTone.primary => (colors.primaryMuted, colors.primary),
      StatCardTone.accent => (colors.accentMuted, colors.accent),
      StatCardTone.success => (colors.successMuted, colors.success),
      StatCardTone.warning => (colors.warningMuted, colors.warning),
      StatCardTone.danger => (colors.dangerMuted, colors.danger),
      StatCardTone.info => (colors.infoMuted, colors.info),
    };

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppMotion.normal,
          curve: AppMotion.curve,
          padding: const EdgeInsets.all(AppSpacing.md),
          transform: Matrix4.translationValues(0, _hovered ? -3 : 0, 0),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: AppRadii.lgAll,
            border: Border.all(
              color: _hovered ? fg.withValues(alpha: 0.28) : colors.border,
            ),
            boxShadow: _hovered
                ? [
                    ...AppShadows.elevated(colors.textPrimary),
                    BoxShadow(
                      color: fg.withValues(alpha: 0.12),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                      spreadRadius: -4,
                    ),
                  ]
                : AppShadows.card(colors.textPrimary),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (widget.icon != null) ...[
                    AnimatedContainer(
                      duration: AppMotion.normal,
                      curve: AppMotion.curve,
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: AppRadii.mdAll,
                        boxShadow: _hovered
                            ? [
                                BoxShadow(
                                  color: fg.withValues(alpha: 0.2),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : null,
                      ),
                      child: Icon(widget.icon, color: fg, size: 20),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                  Expanded(
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: colors.textSecondary,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: Duration(
                  milliseconds: 700 + widget.animationIndex * 70,
                ),
                curve: AppMotion.curveEmphasized,
                builder: (context, t, _) {
                  final animated = (widget.value * t).round();
                  final text = widget.isMoney
                      ? MoneyFormatter.format(animated)
                      : PersianDigits.toPersian('$animated');
                  return Text(
                    text,
                    style: AppTypography.money(colors, size: 22).copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              ),
              if (widget.subtitle != null) ...[
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  widget.subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.textMuted,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
          duration: AppMotion.slow,
          delay: AppMotion.stagger(widget.animationIndex),
        )
        .slideY(
          begin: 0.1,
          end: 0,
          duration: AppMotion.emphasize,
          delay: AppMotion.stagger(widget.animationIndex),
          curve: AppMotion.curveEmphasized,
        )
        .scale(
          begin: const Offset(0.97, 0.97),
          end: const Offset(1, 1),
          duration: AppMotion.emphasize,
          delay: AppMotion.stagger(widget.animationIndex),
          curve: AppMotion.curve,
        );
  }
}

enum StatCardTone { primary, accent, success, warning, danger, info }
