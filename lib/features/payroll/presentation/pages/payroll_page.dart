import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_motion.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/ui/badges/status_badge.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/data/app_data_table.dart';
import '../../../../core/ui/feedback/app_dialog.dart';
import '../../../../core/ui/feedback/app_toast.dart';
import '../../../../core/ui/layout/app_card.dart';
import '../../../../core/ui/layout/side_sheet.dart';
import '../../../../core/utils/money_formatter.dart';
import '../../../../core/utils/persian_digits.dart';
import '../payroll_providers.dart';

class PayrollPage extends ConsumerStatefulWidget {
  const PayrollPage({super.key});

  @override
  ConsumerState<PayrollPage> createState() => _PayrollPageState();
}

class _PayrollPageState extends ConsumerState<PayrollPage> {
  bool _busy = false;
  List<_Row> _rows = const [];

  Future<void> _reload() async {
    final db = ref.read(databaseProvider);
    final year = ref.read(selectedYearProvider);
    final month = ref.read(selectedMonthProvider);
    final period = await (db.select(db.monthlyPeriods)
          ..where((t) => t.year.equals(year))
          ..where((t) => t.month.equals(month)))
        .getSingleOrNull();
    if (period == null) {
      setState(() => _rows = const []);
      return;
    }
    final results = await (db.select(db.payrollResults)
          ..where((t) => t.periodId.equals(period.id)))
        .get();
    final employees = {
      for (final e in await db.select(db.employees).get()) e.id: e,
    };
    setState(() {
      _rows = [
        for (final r in results)
          if (employees[r.employeeId] != null)
            _Row(employee: employees[r.employeeId]!, result: r),
      ];
    });
  }

  Future<void> _calculate() async {
    setState(() => _busy = true);
    try {
      final year = ref.read(selectedYearProvider);
      final month = ref.read(selectedMonthProvider);
      await ref.read(payrollServiceProvider).calculatePeriod(
            year: year,
            month: month,
          );
      await _reload();
      if (mounted) {
        AppToast.show(
          context,
          message: 'محاسبه انجام شد',
          tone: AppToastTone.success,
        );
      }
    } catch (e) {
      if (mounted) {
        AppToast.show(context, message: '$e', tone: AppToastTone.error);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(_reload);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final year = ref.watch(selectedYearProvider);
    final month = ref.watch(selectedMonthProvider);

    return ColoredBox(
      color: colors.background,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            AppCard(
              animateEnter: true,
              child: Row(
                children: [
                  Text(
                    PersianDigits.toPersian('محاسبه حقوق — $year/$month'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  AppButton(
                    label: 'محاسبه',
                    icon: Icons.play_arrow_rounded,
                    loading: _busy,
                    onPressed: _busy ? null : _calculate,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  AppButton(
                    label: 'قفل ماه',
                    variant: AppButtonVariant.secondary,
                    icon: Icons.lock_outline,
                    onPressed: () async {
                      final ok = await AppDialog.confirm(
                        context,
                        title: 'قفل کردن ماه',
                        body:
                            'پس از قفل، تغییر تنظیمات سال روی این ماه اثر نمی‌گذارد.',
                      );
                      if (ok == true) {
                        await ref.read(payrollServiceProvider).lockPeriod(
                              year,
                              month,
                            );
                        if (context.mounted) {
                          AppToast.show(
                            context,
                            message: 'ماه قفل شد',
                            tone: AppToastTone.success,
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  AppButton(
                    label: 'بازکردن قفل',
                    variant: AppButtonVariant.ghost,
                    onPressed: () async {
                      final ok = await AppDialog.confirm(
                        context,
                        title: 'بازکردن قفل',
                        body: 'این عمل در لاگ ثبت می‌شود.',
                        danger: true,
                      );
                      if (ok == true) {
                        await ref.read(payrollServiceProvider).unlockPeriod(
                              year,
                              month,
                              'درخواست کاربر',
                            );
                        if (context.mounted) {
                          AppToast.show(context, message: 'قفل باز شد');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: AppCard(
                animateEnter: true,
                enterIndex: 1,
                padding: const EdgeInsets.all(AppSpacing.md),
                child: _rows.isEmpty
                    ? const Center(
                        child: Text('هنوز نتیجه‌ای نیست — محاسبه را اجرا کنید.'),
                      )
                    : AppDataTable<_Row>(
                        rows: _rows,
                        rowKey: (r) => '${r.result.id}',
                        onRowTap: (r) => _showBreakdown(context, r),
                        columns: [
                          AppTableColumn(
                            id: 'name',
                            title: 'نام',
                            cellBuilder: (_, r) => Text(
                              '${r.employee.firstName} ${r.employee.lastName}',
                            ),
                          ),
                          AppTableColumn(
                            id: 'gross',
                            title: 'ناخالص',
                            numeric: true,
                            cellBuilder: (_, r) => Text(
                              MoneyFormatter.format(r.result.gross,
                                  showUnit: false),
                              style: AppTypography.money(colors),
                            ),
                          ),
                          AppTableColumn(
                            id: 'ins',
                            title: 'بیمه کارگر',
                            numeric: true,
                            cellBuilder: (_, r) => Text(
                              MoneyFormatter.format(
                                r.result.employeeInsurance,
                                showUnit: false,
                              ),
                              style: AppTypography.money(colors),
                            ),
                          ),
                          AppTableColumn(
                            id: 'tax',
                            title: 'مالیات',
                            numeric: true,
                            cellBuilder: (_, r) => Text(
                              MoneyFormatter.format(r.result.tax,
                                  showUnit: false),
                              style: AppTypography.money(colors),
                            ),
                          ),
                          AppTableColumn(
                            id: 'net',
                            title: 'خالص',
                            numeric: true,
                            cellBuilder: (_, r) => Text(
                              MoneyFormatter.format(r.result.net,
                                  showUnit: false),
                              style: AppTypography.money(colors).copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                          AppTableColumn(
                            id: 'flag',
                            title: '',
                            cellBuilder: (_, r) => r.result.net < 0
                                ? const StatusBadge(
                                    label: 'منفی',
                                    tone: StatusBadgeTone.danger,
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBreakdown(BuildContext context, _Row row) {
    final map =
        jsonDecode(row.result.breakdownJson) as Map<String, dynamic>;
    final lines = (map['lines'] as List<dynamic>).cast<Map<String, dynamic>>();
    final colors = context.colors;

    SideSheet.show<void>(
      context,
      title: AppStrings.showBreakdown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${row.employee.firstName} ${row.employee.lastName}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          ...lines.asMap().entries.map((e) {
            final line = e.value;
            final amount = line['amount'] as int;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                children: [
                  Expanded(child: Text('${line['label']}')),
                  Text(
                    MoneyFormatter.format(amount),
                    style: AppTypography.money(colors).copyWith(
                      color: amount < 0 ? colors.danger : colors.textPrimary,
                    ),
                  ),
                ],
              ),
            )
                .animate()
                .fadeIn(
                  delay: AppMotion.stagger(e.key, stepMs: 30),
                  duration: AppMotion.fast,
                );
          }),
        ],
      ),
    );
  }
}

class _Row {
  const _Row({required this.employee, required this.result});

  final Employee employee;
  final PayrollResult result;
}
