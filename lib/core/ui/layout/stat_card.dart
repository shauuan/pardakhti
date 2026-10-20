import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import '../../utils/money_formatter.dart';
import '../../utils/persian_digits.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.tone = StatCardTone.primary,
    this.isMoney = false,
    this.animationIndex = 0,
  });

  final String title;
  final int value;
  final String? subtitle;
  final IconData? icon;
  final StatCardTone tone;
  final bool isMoney;
  final int animationIndex;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (bg, fg) = switch (tone) {
      StatCardTone.primary => (colors.primaryMuted, colors.primary),
      StatCardTone.accent => (colors.accentMuted, colors.accent),
      StatCardTone.success => (colors.successMuted, colors.success),
      StatCardTone.warning => (colors.warningMuted, colors.warning),
      StatCardTone.danger => (colors.dangerMuted, colors.danger),
      StatCardTone.info => (colors.infoMuted, colors.info),
    };

    final display = isMoney
        ? MoneyFormatter.format(value)
        : PersianDigits.toPersian('$value');

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadii.lgAll,
        border: Border.all(color: colors.border),
        boxShadow: AppShadows.card(colors.textPrimary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: AppRadii.mdAll,
                  ),
                  child: Icon(icon, color: fg, size: 20),
                ),
                const SizedBox(width: AppSpacing.sm),
              ],
              Expanded(
                child: Text(
                  title,
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
            duration: Duration(milliseconds: 600 + animationIndex * 80),
            curve: Curves.easeOutCubic,
            builder: (context, t, _) {
              final animated = (value * t).round();
              final text = isMoney
                  ? MoneyFormatter.format(animated)
                  : PersianDigits.toPersian('$animated');
              return Text(
                text,
                style: AppTypography.money(colors, size: 22).copyWith(
                  fontWeight: FontWeight.w700,
                ),
              );
            },
            child: Text(display),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppSpacing.xxs),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.textMuted,
                  ),
            ),
          ],
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 280.ms, delay: (80 * animationIndex).ms)
        .slideY(
          begin: 0.08,
          end: 0,
          duration: 280.ms,
          delay: (80 * animationIndex).ms,
          curve: Curves.easeOutCubic,
        );
  }
}

enum StatCardTone { primary, accent, success, warning, danger, info }
