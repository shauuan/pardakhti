import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../utils/persian_digits.dart';

class AppStepper extends StatelessWidget {
  const AppStepper({
    super.key,
    required this.steps,
    required this.currentIndex,
  });

  final List<String> steps;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          if (i > 0)
            Expanded(
              child: Container(
                height: 2,
                margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                color: i <= currentIndex ? colors.primary : colors.border,
              ),
            ),
          _StepDot(
            index: i,
            label: steps[i],
            active: i == currentIndex,
            done: i < currentIndex,
          ),
        ],
      ],
    );
  }
}

class _StepDot extends StatelessWidget {
  const _StepDot({
    required this.index,
    required this.label,
    required this.active,
    required this.done,
  });

  final int index;
  final String label;
  final bool active;
  final bool done;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bg = done || active ? colors.primary : colors.background;
    final fg = done || active ? colors.textOnPrimary : colors.textMuted;

    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            border: Border.all(
              color: done || active ? colors.primary : colors.borderStrong,
            ),
          ),
          child: done
              ? Icon(Icons.check, size: 14, color: fg)
              : Text(
                  PersianDigits.toPersian('${index + 1}'),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: fg,
                        fontWeight: FontWeight.w700,
                      ),
                ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: active ? colors.primary : colors.textSecondary,
                fontWeight: active ? FontWeight.w700 : FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
