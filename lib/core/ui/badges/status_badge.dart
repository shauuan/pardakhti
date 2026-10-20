import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';

enum StatusBadgeTone { neutral, success, warning, danger, info, primary }

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    this.tone = StatusBadgeTone.neutral,
    this.icon,
  });

  final String label;
  final StatusBadgeTone tone;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (bg, fg) = switch (tone) {
      StatusBadgeTone.neutral => (colors.background, colors.textSecondary),
      StatusBadgeTone.success => (colors.successMuted, colors.success),
      StatusBadgeTone.warning => (colors.warningMuted, colors.warning),
      StatusBadgeTone.danger => (colors.dangerMuted, colors.danger),
      StatusBadgeTone.info => (colors.infoMuted, colors.info),
      StatusBadgeTone.primary => (colors.primaryMuted, colors.primary),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadii.smAll,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: fg),
            const SizedBox(width: AppSpacing.xxs),
          ],
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
