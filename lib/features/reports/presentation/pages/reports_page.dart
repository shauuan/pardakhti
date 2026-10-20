import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/feedback/app_toast.dart';
import '../../../../core/ui/layout/app_card.dart';
import '../../../../core/utils/persian_digits.dart';
import '../../../payroll/presentation/payroll_providers.dart';
import '../../data/reports_service.dart';

final reportsServiceProvider = Provider<ReportsService>((ref) {
  return ReportsService(ref.watch(databaseProvider));
});

class ReportsPage extends ConsumerStatefulWidget {
  const ReportsPage({super.key});

  @override
  ConsumerState<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends ConsumerState<ReportsPage> {
  bool _busy = false;
  bool _a5 = false;

  Future<void> _run(Future<void> Function() action, String okMsg) async {
    setState(() => _busy = true);
    try {
      await action();
      if (mounted) {
        AppToast.show(context, message: okMsg, tone: AppToastTone.success);
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
  Widget build(BuildContext context) {
    final colors = context.colors;
    final year = ref.watch(selectedYearProvider);
    final month = ref.watch(selectedMonthProvider);
    final svc = ref.watch(reportsServiceProvider);

    return ColoredBox(
      color: colors.background,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          AppCard(
            title: PersianDigits.toPersian('گزارش‌ها — $year/$month'),
            animateEnter: true,
            child: Text(
              'خروجی‌ها در پوشه Downloads ذخیره می‌شوند. فیش با پیش‌نمایش چاپ باز می‌شود.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.textSecondary,
                  ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            title: 'فیش حقوقی PDF',
            animateEnter: true,
            enterIndex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('قالب A5'),
                  value: _a5,
                  onChanged: (v) => setState(() => _a5 = v),
                ),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    AppButton(
                      label: 'فیش همه پرسنل',
                      icon: Icons.picture_as_pdf_outlined,
                      loading: _busy,
                      onPressed: _busy
                          ? null
                          : () => _run(
                                () => svc.printAllPayslips(
                                  year,
                                  month,
                                  a5: _a5,
                                ),
                                'پیش‌نمایش فیش‌ها',
                              ),
                    ),
                    AppButton(
                      label: 'فیش اولین نفر',
                      variant: AppButtonVariant.secondary,
                      onPressed: _busy
                          ? null
                          : () => _run(() async {
                                final db = ref.read(databaseProvider);
                                final period = await (db.select(db.monthlyPeriods)
                                      ..where((t) => t.year.equals(year))
                                      ..where((t) => t.month.equals(month)))
                                    .getSingleOrNull();
                                if (period == null) {
                                  throw StateError('محاسبه‌ای نیست');
                                }
                                final first = await (db.select(db.payrollResults)
                                      ..where((t) => t.periodId.equals(period.id)))
                                    .get();
                                if (first.isEmpty) {
                                  throw StateError('ردیفی نیست');
                                }
                                await svc.printPayslip(
                                  year: year,
                                  month: month,
                                  employeeId: first.first.employeeId,
                                  a5: _a5,
                                );
                              }, 'پیش‌نمایش فیش'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            title: 'خروجی Excel',
            animateEnter: true,
            enterIndex: 2,
            child: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                AppButton(
                  label: 'لیست حقوق',
                  icon: Icons.table_view_outlined,
                  onPressed: _busy
                      ? null
                      : () => _run(() async {
                            final f =
                                await svc.exportPayrollExcel(year, month);
                            if (mounted) {
                              AppToast.show(
                                context,
                                message: 'ذخیره شد: ${f.path}',
                                tone: AppToastTone.success,
                              );
                            }
                          }, 'لیست حقوق آماده شد'),
                ),
                AppButton(
                  label: 'لیست بیمه',
                  variant: AppButtonVariant.secondary,
                  onPressed: _busy
                      ? null
                      : () => _run(() async {
                            final f =
                                await svc.exportInsuranceExcel(year, month);
                            if (mounted) {
                              AppToast.show(
                                context,
                                message: 'ذخیره شد: ${f.path}',
                              );
                            }
                          }, 'لیست بیمه آماده شد'),
                ),
                AppButton(
                  label: 'لیست مالیات',
                  variant: AppButtonVariant.secondary,
                  onPressed: _busy
                      ? null
                      : () => _run(() async {
                            final f = await svc.exportTaxExcel(year, month);
                            if (mounted) {
                              AppToast.show(
                                context,
                                message: 'ذخیره شد: ${f.path}',
                              );
                            }
                          }, 'لیست مالیات آماده شد'),
                ),
                AppButton(
                  label: 'دانلود نمونه ایمپورت',
                  variant: AppButtonVariant.ghost,
                  onPressed: () async {
                    final bytes = await svc.sampleImportFile();
                    final path = await FilePicker.platform.saveFile(
                      dialogTitle: 'ذخیره نمونه',
                      fileName: 'sample-monthly-input.xlsx',
                      bytes: bytes,
                    );
                    if (path != null && mounted) {
                      AppToast.show(
                        context,
                        message: 'نمونه ذخیره شد',
                        tone: AppToastTone.success,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
