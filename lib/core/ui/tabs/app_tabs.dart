import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_motion.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';

class AppTabItem {
  const AppTabItem({required this.label, this.icon});

  final String label;
  final IconData? icon;
}

class AppTabs extends StatelessWidget {
  const AppTabs({
    super.key,
    required this.tabs,
    required this.index,
    required this.onChanged,
  });

  final List<AppTabItem> tabs;
  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: AppRadii.mdAll,
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          for (var i = 0; i < tabs.length; i++)
            Expanded(
              child: _TabChip(
                item: tabs[i],
                selected: i == index,
                onTap: () => onChanged(i),
              ),
            ),
        ],
      ),
    );
  }
}

class _TabChip extends StatefulWidget {
  const _TabChip({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final AppTabItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_TabChip> createState() => _TabChipState();
}

class _TabChipState extends State<_TabChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppMotion.fast,
          curve: AppMotion.curve,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: widget.selected
                ? colors.surface
                : (_hovered ? colors.tableHover : Colors.transparent),
            borderRadius: AppRadii.smAll,
            boxShadow: widget.selected
                ? [
                    BoxShadow(
                      color: colors.textPrimary.withValues(alpha: 0.04),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.item.icon != null) ...[
                Icon(
                  widget.item.icon,
                  size: 16,
                  color: widget.selected
                      ? colors.primary
                      : colors.textSecondary,
                ),
                const SizedBox(width: AppSpacing.xxs),
              ],
              Flexible(
                child: Text(
                  widget.item.label,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: widget.selected
                            ? colors.primary
                            : colors.textSecondary,
                        fontWeight:
                            widget.selected ? FontWeight.w700 : FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
