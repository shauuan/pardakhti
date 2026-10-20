import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/ui/badges/status_badge.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/data/app_data_table.dart';
import '../../../../core/ui/feedback/app_dialog.dart';
import '../../../../core/ui/feedback/app_toast.dart';
import '../../../../core/ui/feedback/empty_state.dart';
import '../../../../core/ui/inputs/app_dropdown.dart';
import '../../../../core/ui/inputs/app_text_field.dart';
import '../../../../core/ui/inputs/date_field.dart';
import '../../../../core/ui/inputs/money_field.dart';
import '../../../../core/ui/layout/app_card.dart';
import '../../../../core/ui/layout/side_sheet.dart';
import '../../../../core/ui/stepper/app_stepper.dart';
import '../../../../core/ui/tabs/app_tabs.dart';
import '../../../../core/utils/money_formatter.dart';
import '../../../../core/utils/persian_digits.dart';

class _SampleEmployee {
  const _SampleEmployee({
    required this.code,
    required this.name,
    required this.days,
    required this.net,
    required this.insurance,
    required this.tax,
  });

  final String code;
  final String name;
  final int days;
  final int net;
  final int insurance;
  final int tax;
}

class ComponentsShowcasePage extends StatefulWidget {
  const ComponentsShowcasePage({super.key});

  @override
  State<ComponentsShowcasePage> createState() => _ComponentsShowcasePageState();
}

class _ComponentsShowcasePageState extends State<ComponentsShowcasePage> {
  int _tabIndex = 0;
  int? _money;
  Jalali? _hireDate = Jalali(1402, 4, 12);
  String? _department = 'مالی';
  final _selected = <String>{};
  String? _sortCol = 'net';
  bool _sortAsc = false;
  bool _tableLoading = false;

  final _employees = [
    const _SampleEmployee(
      code: '1001',
      name: 'علی رضایی',
      days: 30,
      net: 185000000,
      insurance: 22000000,
      tax: 8500000,
    ),
    const _SampleEmployee(
      code: '1002',
      name: 'مریم احمدی',
      days: 28,
      net: 172000000,
      insurance: 20500000,
      tax: 6200000,
    ),
    const _SampleEmployee(
      code: '1003',
      name: 'حسین کریمی',
      days: 30,
      net: 210000000,
      insurance: 25000000,
      tax: 12000000,
    ),
    const _SampleEmployee(
      code: '1004',
      name: 'زهرا موسوی',
      days: 26,
      net: 156000000,
      insurance: 18800000,
      tax: 4100000,
    ),
  ];

  List<_SampleEmployee> get _sorted {
    final list = [..._employees];
    list.sort((a, b) {
      final cmp = switch (_sortCol) {
        'code' => a.code.compareTo(b.code),
        'name' => a.name.compareTo(b.name),
        'days' => a.days.compareTo(b.days),
        'insurance' => a.insurance.compareTo(b.insurance),
        'tax' => a.tax.compareTo(b.tax),
        _ => a.net.compareTo(b.net),
      };
      return _sortAsc ? cmp : -cmp;
    });
    return list;
  }

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
            _banner(colors),
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              title: 'دکمه‌ها',
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  AppButton(
                    label: 'اصلی',
                    onPressed: () => AppToast.show(
                      context,
                      message: AppStrings.savedSuccessfully,
                      tone: AppToastTone.success,
                    ),
                  ),
                  AppButton(
                    label: 'ثانویه',
                    variant: AppButtonVariant.secondary,
                    onPressed: () {},
                  ),
                  AppButton(
                    label: 'شبح',
                    variant: AppButtonVariant.ghost,
                    onPressed: () {},
                  ),
                  AppButton(
                    label: 'خطر',
                    variant: AppButtonVariant.danger,
                    onPressed: () async {
                      final ok = await AppDialog.confirm(
                        context,
                        title: AppStrings.confirmDeleteTitle,
                        body: AppStrings.confirmDeleteBody,
                        danger: true,
                        confirmLabel: AppStrings.delete,
                      );
                      if (ok == true && context.mounted) {
                        AppToast.show(
                          context,
                          message: 'حذف نمونه انجام شد',
                          tone: AppToastTone.error,
                        );
                      }
                    },
                  ),
                  const AppButton(
                    label: 'در حال ذخیره',
                    loading: true,
                    onPressed: null,
                  ),
                  AppButton(
                    label: 'باز کردن SideSheet',
                    icon: Icons.view_sidebar_outlined,
                    variant: AppButtonVariant.secondary,
                    onPressed: () => SideSheet.show<void>(
                      context,
                      title: AppStrings.details,
                      actions: [
                        AppButton(
                          label: AppStrings.close,
                          variant: AppButtonVariant.ghost,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        AppButton(
                          label: AppStrings.save,
                          onPressed: () {
                            Navigator.of(context).pop();
                            AppToast.show(
                              context,
                              message: AppStrings.savedSuccessfully,
                              tone: AppToastTone.success,
                            );
                          },
                        ),
                      ],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            AppStrings.showBreakdown,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            'این پنل برای جزئیات محاسبه و ویرایش استفاده می‌شود.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: colors.textSecondary),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          const StatusBadge(
                            label: AppStrings.needsReview,
                            tone: StatusBadgeTone.warning,
                            icon: Icons.flag_outlined,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              title: 'نشان‌ها و هشدار مشمولیت',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      StatusBadge(
                        label: AppStrings.statusDraft,
                        tone: StatusBadgeTone.info,
                      ),
                      StatusBadge(
                        label: AppStrings.statusLocked,
                        tone: StatusBadgeTone.success,
                        icon: Icons.lock_outline,
                      ),
                      StatusBadge(
                        label: AppStrings.needsReview,
                        tone: StatusBadgeTone.warning,
                        icon: Icons.warning_amber_outlined,
                      ),
                      StatusBadge(
                        label: 'خطا',
                        tone: StatusBadgeTone.danger,
                      ),
                      StatusBadge(
                        label: 'فعال',
                        tone: StatusBadgeTone.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: colors.warningMuted,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      AppStrings.inclusivityWarning,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colors.warning,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              title: 'فرم نمونه',
              child: Column(
                children: [
                  AppTabs(
                    index: _tabIndex,
                    onChanged: (i) => setState(() => _tabIndex = i),
                    tabs: const [
                      AppTabItem(
                        label: 'مشخصات',
                        icon: Icons.badge_outlined,
                      ),
                      AppTabItem(
                        label: 'استخدام',
                        icon: Icons.work_outline,
                      ),
                      AppTabItem(
                        label: 'حقوق',
                        icon: Icons.payments_outlined,
                      ),
                      AppTabItem(
                        label: 'بانک',
                        icon: Icons.account_balance_outlined,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const AppStepper(
                    currentIndex: 1,
                    steps: ['شرکت', 'سال مالی', 'رمز', 'پایان'],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          label: AppStrings.firstName,
                          hint: 'مثلاً علی',
                          prefixIcon: Icons.person_outline,
                        ),
                      ),
                      SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          label: AppStrings.lastName,
                          hint: 'مثلاً رضایی',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      const Expanded(
                        child: AppTextField(
                          label: AppStrings.nationalId,
                          hint: '۱۰ رقم',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppDropdown<String>(
                          label: AppStrings.department,
                          value: _department,
                          items: const ['مالی', 'فنی', 'اداری', 'فروش'],
                          labelBuilder: (e) => e,
                          onChanged: (v) => setState(() => _department = v),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: MoneyField(
                          label: AppStrings.baseSalary,
                          valueRials: _money ?? 5541850,
                          onChanged: (v) => setState(() => _money = v),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: DateField(
                          label: AppStrings.hireDate,
                          value: _hireDate,
                          onChanged: (v) => setState(() => _hireDate = v),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: 360,
              child: AppCard(
                title: 'جدول داده',
                padding: EdgeInsets.zero,
                actions: [
                  AppButton(
                    label: _tableLoading ? 'بارگذاری...' : 'Skeleton',
                    size: AppButtonSize.sm,
                    variant: AppButtonVariant.ghost,
                    onPressed: () async {
                      setState(() => _tableLoading = true);
                      await Future<void>.delayed(
                        const Duration(milliseconds: 1200),
                      );
                      if (mounted) setState(() => _tableLoading = false);
                    },
                  ),
                  if (_selected.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: StatusBadge(
                        label:
                            '${AppStrings.selectedCount}: ${PersianDigits.toPersian('${_selected.length}')}',
                        tone: StatusBadgeTone.primary,
                      ),
                    ),
                ],
                child: SizedBox(
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.md,
                      0,
                      AppSpacing.md,
                      AppSpacing.md,
                    ),
                    child: AppDataTable<_SampleEmployee>(
                      loading: _tableLoading,
                      rows: _sorted,
                      rowKey: (e) => e.code,
                      selectedKeys: _selected,
                      onSelectionChanged: (s) => setState(() {
                        _selected
                          ..clear()
                          ..addAll(s);
                      }),
                      sortColumnId: _sortCol,
                      sortAscending: _sortAsc,
                      onSort: (id, asc) => setState(() {
                        _sortCol = id;
                        _sortAsc = asc;
                      }),
                      onRowTap: (row) => SideSheet.show<void>(
                        context,
                        title: row.name,
                        child: Text(
                          'خالص: ${MoneyFormatter.format(row.net)}',
                          style: AppTypography.money(colors),
                        ),
                      ),
                      columns: [
                        AppTableColumn(
                          id: 'code',
                          title: AppStrings.colCode,
                          sortable: true,
                          cellBuilder: (_, e) => Text(
                            PersianDigits.toPersian(e.code),
                            style: AppTypography.money(colors),
                          ),
                        ),
                        AppTableColumn(
                          id: 'name',
                          title: AppStrings.colName,
                          sortable: true,
                          cellBuilder: (_, e) => Text(e.name),
                        ),
                        AppTableColumn(
                          id: 'days',
                          title: AppStrings.colDays,
                          sortable: true,
                          numeric: true,
                          cellBuilder: (_, e) => Text(
                            PersianDigits.toPersian('${e.days}'),
                            style: AppTypography.money(colors),
                          ),
                        ),
                        AppTableColumn(
                          id: 'net',
                          title: AppStrings.colNet,
                          sortable: true,
                          numeric: true,
                          cellBuilder: (_, e) => Text(
                            MoneyFormatter.format(e.net, showUnit: false),
                            style: AppTypography.money(colors),
                          ),
                        ),
                        AppTableColumn(
                          id: 'insurance',
                          title: AppStrings.colInsurance,
                          sortable: true,
                          numeric: true,
                          cellBuilder: (_, e) => Text(
                            MoneyFormatter.format(e.insurance, showUnit: false),
                            style: AppTypography.money(colors),
                          ),
                        ),
                        AppTableColumn(
                          id: 'tax',
                          title: AppStrings.colTax,
                          sortable: true,
                          numeric: true,
                          cellBuilder: (_, e) => Text(
                            MoneyFormatter.format(e.tax, showUnit: false),
                            style: AppTypography.money(colors),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              title: 'حالت خالی',
              child: SizedBox(
                height: 220,
                child: EmptyState(
                  title: AppStrings.emptyTitle,
                  subtitle: AppStrings.emptySubtitle,
                  actionLabel: AppStrings.actionAddEmployee,
                  onAction: () => AppToast.show(
                    context,
                    message: 'افزودن نمونه',
                    tone: AppToastTone.info,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _banner(AppColors colors) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colors.infoMuted,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.info.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Icon(Icons.widgets_outlined, color: colors.info),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              'کتابخانه کامپوننت‌های داخلی — برای تأیید ظاهر قبل از منطق کسب‌وکار.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.info,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
