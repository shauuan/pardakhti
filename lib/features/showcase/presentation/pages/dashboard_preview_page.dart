import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/ui/badges/status_badge.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/layout/app_card.dart';
import '../../../../core/ui/layout/stat_card.dart';
import '../../../../core/utils/money_formatter.dart';
import '../../../../core/utils/persian_digits.dart';

/// داشبورد نمونه با داده ساختگی — برچسب «نمونه» دارد.
class DashboardPreviewPage extends StatelessWidget {
  const DashboardPreviewPage({super.key});

  static const _netPayTrend = [
    8200000000,
    8350000000,
    8100000000,
    8600000000,
    8700000000,
    8550000000,
    8900000000,
    9000000000,
    9150000000,
    9050000000,
    9200000000,
    9450000000,
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ColoredBox(
      color: colors.background,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SampleBanner(colors: colors),
            const SizedBox(height: AppSpacing.lg),
            LayoutBuilder(
              builder: (context, constraints) {
                final wide = constraints.maxWidth >= 1100;
                final cards = [
                  const StatCard(
                    title: AppStrings.activeEmployees,
                    value: 48,
                    icon: Icons.groups_outlined,
                    tone: StatCardTone.primary,
                    animationIndex: 0,
                  ),
                  const StatCard(
                    title: AppStrings.totalNetPay,
                    value: 9450000000,
                    isMoney: true,
                    icon: Icons.payments_outlined,
                    tone: StatCardTone.accent,
                    animationIndex: 1,
                  ),
                  const StatCard(
                    title: AppStrings.totalInsurance,
                    value: 2100000000,
                    isMoney: true,
                    icon: Icons.health_and_safety_outlined,
                    tone: StatCardTone.info,
                    animationIndex: 2,
                  ),
                  const StatCard(
                    title: AppStrings.totalTax,
                    value: 780000000,
                    isMoney: true,
                    icon: Icons.account_balance_outlined,
                    tone: StatCardTone.warning,
                    animationIndex: 3,
                  ),
                  const StatCard(
                    title: AppStrings.totalEmployerCost,
                    value: 11800000000,
                    isMoney: true,
                    icon: Icons.corporate_fare_outlined,
                    tone: StatCardTone.success,
                    animationIndex: 4,
                  ),
                ];

                if (wide) {
                  return Row(
                    children: [
                      for (var i = 0; i < cards.length; i++) ...[
                        if (i > 0) const SizedBox(width: AppSpacing.md),
                        Expanded(child: cards[i]),
                      ],
                    ],
                  );
                }

                return Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: [
                    for (final card in cards)
                      SizedBox(
                        width: (constraints.maxWidth - AppSpacing.md) / 2,
                        child: card,
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            LayoutBuilder(
              builder: (context, constraints) {
                final wide = constraints.maxWidth >= 1000;
                const chart = AppCard(
                  title: AppStrings.trend12Months,
                  child: SizedBox(
                    height: 260,
                    child: _TrendChart(values: _netPayTrend),
                  ),
                );
                final status = AppCard(
                  title: AppStrings.currentMonthStatus,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            PersianDigits.toPersian('مهر ۱۴۰۵'),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Spacer(),
                          const StatusBadge(
                            label: AppStrings.statusDraft,
                            tone: StatusBadgeTone.info,
                            icon: Icons.edit_outlined,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        '۴۲ نفر محاسبه‌شده · ۶ نفر در انتظار ورودی',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colors.textSecondary,
                            ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        AppStrings.quickActions,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.sm,
                        children: [
                          AppButton(
                            label: AppStrings.actionAddEmployee,
                            icon: Icons.person_add_outlined,
                            variant: AppButtonVariant.secondary,
                            onPressed: () {},
                          ),
                          AppButton(
                            label: AppStrings.actionImport,
                            icon: Icons.upload_file_outlined,
                            variant: AppButtonVariant.secondary,
                            onPressed: () {},
                          ),
                          AppButton(
                            label: AppStrings.actionCalculate,
                            icon: Icons.play_arrow_rounded,
                            onPressed: () {},
                          ),
                          AppButton(
                            label: AppStrings.actionReports,
                            icon: Icons.file_download_outlined,
                            variant: AppButtonVariant.ghost,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                );

                if (wide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 3, child: chart),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(flex: 2, child: status),
                    ],
                  );
                }
                return Column(
                  children: [
                    chart,
                    const SizedBox(height: AppSpacing.md),
                    status,
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SampleBanner extends StatelessWidget {
  const _SampleBanner({required this.colors});

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colors.warningMuted,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.warning.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: colors.warning),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              AppStrings.sampleDisclaimer,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.warning,
                  ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }
}

class _TrendChart extends StatelessWidget {
  const _TrendChart({required this.values});

  final List<int> values;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final maxY = values.reduce((a, b) => a > b ? a : b) * 1.1;

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: maxY,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (_) => FlLine(
            color: colors.border,
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 56,
              getTitlesWidget: (value, meta) {
                if (value == 0 || value == meta.max) {
                  return const SizedBox.shrink();
                }
                final toman = (value / 10).round();
                final short = '${(toman / 1000000).round()}م';
                return Text(
                  PersianDigits.toPersian(short),
                  style: AppTypography.caption(colors),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final i = value.toInt();
                if (i < 0 || i >= 12) return const SizedBox.shrink();
                const months = [
                  'ف',
                  'ا',
                  'خ',
                  'ت',
                  'م',
                  'ش',
                  'مه',
                  'آ',
                  'آذ',
                  'دی',
                  'به',
                  'اس',
                ];
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    months[i],
                    style: AppTypography.caption(colors),
                  ),
                );
              },
            ),
          ),
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => colors.textPrimary,
            getTooltipItems: (spots) => spots
                .map(
                  (s) => LineTooltipItem(
                    MoneyFormatter.format(s.y.round()),
                    TextStyle(
                      color: colors.surface,
                      fontFamily: AppTypography.fontFamily,
                      fontSize: 12,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (var i = 0; i < values.length; i++)
                FlSpot(i.toDouble(), values[i].toDouble()),
            ],
            isCurved: true,
            color: colors.primary,
            barWidth: 3,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(
                radius: 3.5,
                color: colors.surface,
                strokeWidth: 2,
                strokeColor: colors.primary,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              color: colors.primary.withValues(alpha: 0.08),
            ),
          ),
        ],
      ),
    );
  }
}
