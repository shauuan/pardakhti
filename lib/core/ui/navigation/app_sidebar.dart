import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../l10n/app_strings.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_motion.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../badges/status_badge.dart';

class SidebarItem {
  const SidebarItem({
    required this.id,
    required this.label,
    required this.icon,
    this.route,
    this.enabled = true,
  });

  final String id;
  final String label;
  final IconData icon;
  final String? route;
  final bool enabled;
}

class AppSidebar extends StatelessWidget {
  const AppSidebar({
    super.key,
    required this.collapsed,
    required this.onToggle,
    required this.selectedId,
    required this.onSelect,
    required this.items,
  });

  final bool collapsed;
  final VoidCallback onToggle;
  final String selectedId;
  final ValueChanged<String> onSelect;
  final List<SidebarItem> items;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width =
        collapsed ? AppSpacing.sidebarCollapsed : AppSpacing.sidebarExpanded;

    return AnimatedContainer(
      duration: AppMotion.normal,
      curve: AppMotion.curve,
      width: width,
      decoration: BoxDecoration(
        color: colors.sidebar,
        border: Border(
          // لبه داخلی سایدبار (سمت محتوا)
          left: BorderSide(color: colors.border),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: AppRadii.mdAll,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'پ',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: colors.textOnPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                if (!collapsed) ...[
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConfig.appName,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'حقوق و دستمزد',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: colors.textMuted,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
                IconButton(
                  onPressed: onToggle,
                  tooltip: collapsed ? 'گسترش منو' : 'جمع کردن منو',
                  icon: Icon(
                    collapsed ? Icons.chevron_left : Icons.chevron_right,
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: collapsed
                ? const SizedBox.shrink()
                : const Align(
                    alignment: Alignment.centerRight,
                    child: StatusBadge(
                      label: AppStrings.sampleBadge,
                      tone: StatusBadgeTone.warning,
                      icon: Icons.science_outlined,
                    ),
                  ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
              children: [
                for (final item in items)
                  _SidebarTile(
                    item: item,
                    collapsed: collapsed,
                    selected: item.id == selectedId,
                    onTap: item.enabled ? () => onSelect(item.id) : null,
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text(
              collapsed ? '' : 'نسخه ${AppConfig.version}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colors.textMuted,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatefulWidget {
  const _SidebarTile({
    required this.item,
    required this.collapsed,
    required this.selected,
    required this.onTap,
  });

  final SidebarItem item;
  final bool collapsed;
  final bool selected;
  final VoidCallback? onTap;

  @override
  State<_SidebarTile> createState() => _SidebarTileState();
}

class _SidebarTileState extends State<_SidebarTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final enabled = widget.onTap != null;
    final bg = widget.selected
        ? colors.sidebarActive
        : (_hovered && enabled ? colors.tableHover : Colors.transparent);
    final fg = !enabled
        ? colors.textMuted
        : (widget.selected ? colors.primary : colors.textSecondary);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Tooltip(
        message: widget.collapsed ? widget.item.label : '',
        waitDuration: const Duration(milliseconds: 400),
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: AppRadii.mdAll,
            child: AnimatedContainer(
              duration: AppMotion.fast,
              curve: AppMotion.curve,
              padding: EdgeInsets.symmetric(
                horizontal: widget.collapsed ? 12 : AppSpacing.sm,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: AppRadii.mdAll,
              ),
              child: Row(
                children: [
                  Icon(widget.item.icon, size: 20, color: fg),
                  if (!widget.collapsed) ...[
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        widget.item.label,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: fg,
                              fontWeight: widget.selected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (!widget.item.enabled)
                      const StatusBadge(
                        label: AppStrings.comingSoon,
                        tone: StatusBadgeTone.neutral,
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
