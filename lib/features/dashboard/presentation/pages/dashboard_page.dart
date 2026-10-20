import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_motion.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/ui/badges/status_badge.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/layout/app_card.dart';
import '../../../../core/ui/layout/stat_card.dart';
import '../../../../core/utils/money_formatter.dart';
import '../../../../core/utils/persian_digits.dart';
import '../../../payroll/presentation/payroll_providers.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  int _employees = 0;
  int _net = 0;
  int _insurance = 0;
  int _tax = 0;
  int _cost = 0;
  String _status = 'پیش‌نویس';
  List<int> _trend = List.filled(12, 0);

  @override
  void initState() {
    super.initState();
    Future.microtask(_load);
  }

  Future<void> _load() async {
    final db = ref.read(databaseProvider);
    final year = ref.read(selectedYearProvider);
    final month = ref.read(selectedMonthProvider);

    final employees = await (db.select(db.employees)
          ..where((t) => t.active.equals(true)))
        .get();
    final period = await (db.select(db.monthlyPeriods)
          ..where((t) => t.year.equals(year))
          ..where((t) => t.month.equals(month)))
        .getSingleOrNull();

    var net = 0, ins = 0, tax = 0, cost = 0;
    var status = AppStrings.statusDraft;
    if (period != null) {
      status = period.status == 'locked'
          ? AppStrings.statusLocked
          : AppStrings.statusDraft;
      final results = await (db.select(db.payrollResults)
            ..where((t) => t.periodId.equals(period.id)))
          .get();
      for (final r in results) {
        net += r.net;
        ins += r.employeeInsurance + r.employerInsurance + r.unemploymentInsurance;
        tax += r.tax;
        cost += r.employerTotalCost;
      }
    }

    final trend = <int>[];
    for (var m = 1; m <= 12; m++) {
      final p = await (db.select(db.monthlyPeriods)
            ..where((t) => t.year.equals(year))
            ..where((t) => t.month.equals(m)))
          .getSingleOrNull();
      if (p == null) {
        trend.add(0);
        continue;
      }
      final rs = await (db.select(db.payrollResults)
            ..where((t) => t.periodId.equals(p.id)))
          .get();
      trend.add(rs.fold<int>(0, (a, r) => a + r.net));
    }

    if (!mounted) return;
    setState(() {
      _employees = employees.length;
      _net = net;
      _insurance = ins;
      _tax = tax;
      _cost = cost;
      _status = status;
      _trend = trend;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final year = ref.watch(selectedYearProvider);
    final month = ref.watch(selectedMonthProvider);

    return ColoredBox(
      color: colors.background,
      child: RefreshIndicator(
        onRefresh: _load,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LayoutBuilder(
                builder: (context, c) {
                  final cards = [
                    StatCard(
                      title: AppStrings.activeEmployees,
                      value: _employees,
                      icon: Icons.groups_outlined,
                      animationIndex: 0,
                      onTap: () => context.go('/employees'),
                    ),
                    StatCard(
                      title: AppStrings.totalNetPay,
                      value: _net,
                      isMoney: true,
                      icon: Icons.payments_outlined,
                      tone: StatCardTone.accent,
                      animationIndex: 1,
                    ),
                    StatCard(
                      title: AppStrings.totalInsurance,
                      value: _insurance,
                      isMoney: true,
                      icon: Icons.health_and_safety_outlined,
                      tone: StatCardTone.info,
                      animationIndex: 2,
                    ),
                    StatCard(
                      title: AppStrings.totalTax,
                      value: _tax,
                      isMoney: true,
                      icon: Icons.account_balance_outlined,
                      tone: StatCardTone.warning,
                      animationIndex: 3,
                    ),
                    StatCard(
                      title: AppStrings.totalEmployerCost,
                      value: _cost,
                      isMoney: true,
                      icon: Icons.corporate_fare_outlined,
                      tone: StatCardTone.success,
                      animationIndex: 4,
                    ),
                  ];
                  if (c.maxWidth >= 1100) {
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
                          width: (c.maxWidth - AppSpacing.md) / 2,
                          child: card,
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: AppCard(
                      title: AppStrings.trend12Months,
                      animateEnter: true,
                      enterIndex: 2,
                      child: SizedBox(
                        height: 260,
                        child: _TrendChart(values: _trend, colors: colors),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    flex: 2,
                    child: AppCard(
                      title: AppStrings.currentMonthStatus,
                      animateEnter: true,
                      enterIndex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text(
                                PersianDigits.toPersian('$year / $month'),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Spacer(),
                              StatusBadge(
                                label: _status,
                                tone: _status == AppStrings.statusLocked
                                    ? StatusBadgeTone.success
                                    : StatusBadgeTone.info,
                                icon: _status == AppStrings.statusLocked
                                    ? Icons.lock_outline
                                    : Icons.edit_outlined,
                              ),
                            ],
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
                                onPressed: () => context.go('/employees'),
                              ),
                              AppButton(
                                label: AppStrings.actionImport,
                                icon: Icons.table_chart_outlined,
                                variant: AppButtonVariant.secondary,
                                onPressed: () => context.go('/inputs'),
                              ),
                              AppButton(
                                label: AppStrings.actionCalculate,
                                icon: Icons.play_arrow_rounded,
                                onPressed: () => context.go('/payroll'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrendChart extends StatelessWidget {
  const _TrendChart({required this.values, required this.colors});

  final List<int> values;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    final maxY = (values.isEmpty ? 1 : values.reduce((a, b) => a > b ? a : b))
        .clamp(1, 1 << 62)
        .toDouble();

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: maxY * 1.15,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (_) =>
              FlLine(color: colors.border, strokeWidth: 1),
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
              reservedSize: 48,
              getTitlesWidget: (v, meta) {
                if (v <= 0) return const SizedBox.shrink();
                final short = '${(v / 10 / 1000000).round()}م';
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
              getTitlesWidget: (v, meta) {
                final i = v.toInt();
                if (i < 0 || i >= 12) return const SizedBox.shrink();
                return Text(
                  PersianDigits.toPersian('${i + 1}'),
                  style: AppTypography.caption(colors),
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
              getDotPainter: (s, p, b, i) => FlDotCirclePainter(
                radius: 3.5,
                color: colors.surface,
                strokeWidth: 2,
                strokeColor: colors.primary,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colors.primary.withValues(alpha: 0.18),
                  colors.primary.withValues(alpha: 0.02),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: AppMotion.slow);
  }
}
