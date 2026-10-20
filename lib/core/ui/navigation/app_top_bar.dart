import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../config/app_config.dart';
import '../../l10n/app_strings.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../theme/theme_mode_provider.dart';
import '../../utils/persian_digits.dart';

class AppTopBar extends ConsumerWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.onSearch,
  });

  final String title;
  final VoidCallback? onSearch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final themeMode = ref.watch(themeModeProvider);
    final now = Jalali.now();
    final monthLabel = PersianDigits.toPersian(
      '${_monthName(now.month)} ${now.year}',
    );

    return Container(
      height: AppSpacing.topBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(bottom: BorderSide(color: colors.border)),
      ),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(),
          _Pill(
            icon: Icons.calendar_month_outlined,
            label: monthLabel,
            onTap: () {},
          ),
          const SizedBox(width: AppSpacing.sm),
          _Pill(
            icon: Icons.account_balance_outlined,
            label: PersianDigits.toPersian(
              'سال مالی ${AppConfig.defaultFiscalYear}',
            ),
            onTap: () {},
          ),
          const SizedBox(width: AppSpacing.sm),
          Tooltip(
            message: AppStrings.searchHint,
            child: IconButton(
              onPressed: onSearch,
              icon: Icon(Icons.search, color: colors.textSecondary),
            ),
          ),
          IconButton(
            tooltip: AppStrings.toggleTheme,
            onPressed: () => ref.read(themeModeProvider.notifier).toggle(),
            icon: Icon(
              themeMode == ThemeMode.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color: colors.textSecondary,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: AppRadii.mdAll,
              border: Border.all(color: colors.border),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: colors.primaryMuted,
                  child: Text(
                    'ک',
                    style: TextStyle(
                      color: colors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'کاربر نمونه',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Icon(Icons.expand_more, size: 18, color: colors.textMuted),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _monthName(int m) {
    const names = [
      'فروردین',
      'اردیبهشت',
      'خرداد',
      'تیر',
      'مرداد',
      'شهریور',
      'مهر',
      'آبان',
      'آذر',
      'دی',
      'بهمن',
      'اسفند',
    ];
    return names[m - 1];
  }
}

class _Pill extends StatefulWidget {
  const _Pill({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  State<_Pill> createState() => _PillState();
}

class _PillState extends State<_Pill> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: AppRadii.mdAll,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? colors.tableHover : colors.background,
            borderRadius: AppRadii.mdAll,
            border: Border.all(color: colors.border),
          ),
          child: Row(
            children: [
              Icon(widget.icon, size: 16, color: colors.textSecondary),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
