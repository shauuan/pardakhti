import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_motion.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/ui/badges/status_badge.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/data/app_data_table.dart';
import '../../../../core/ui/feedback/app_toast.dart';
import '../../../../core/ui/feedback/empty_state.dart';
import '../../../../core/ui/inputs/app_text_field.dart';
import '../../../../core/ui/inputs/date_field.dart';
import '../../../../core/ui/inputs/money_field.dart';
import '../../../../core/ui/layout/app_card.dart';
import '../../../../core/ui/layout/side_sheet.dart';
import '../../../../core/ui/tabs/app_tabs.dart';
import '../../../../core/utils/money_formatter.dart';
import '../../../../core/utils/persian_digits.dart';
import '../employees_providers.dart';

class EmployeesPage extends ConsumerWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final async = ref.watch(employeesStreamProvider);

    return ColoredBox(
      color: colors.background,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    hint: 'جستجو: نام، کد پرسنلی، کد ملی...',
                    prefixIcon: Icons.search,
                    onChanged: (v) =>
                        ref.read(employeeSearchProvider.notifier).state = v,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                AppButton(
                  label: AppStrings.actionAddEmployee,
                  icon: Icons.person_add_outlined,
                  onPressed: () => _openForm(context, ref),
                ),
              ],
            )
                .animate()
                .fadeIn(duration: AppMotion.normal)
                .slideY(begin: -0.05, end: 0, curve: AppMotion.curve),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: AppCard(
                animateEnter: true,
                padding: const EdgeInsets.all(AppSpacing.md),
                child: async.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('$e')),
                  data: (rows) {
                    if (rows.isEmpty) {
                      return EmptyState(
                        title: 'هنوز پرسنلی ثبت نشده',
                        subtitle: 'اولین همکار را اضافه کنید تا محاسبه حقوق شروع شود.',
                        actionLabel: AppStrings.actionAddEmployee,
                        onAction: () => _openForm(context, ref),
                      );
                    }
                    return AppDataTable<Employee>(
                      rows: rows,
                      rowKey: (e) => '${e.id}',
                      onRowTap: (e) => _openForm(context, ref, existing: e),
                      columns: [
                        AppTableColumn(
                          id: 'code',
                          title: 'کد',
                          cellBuilder: (_, e) => Text(
                            PersianDigits.toPersian(e.personnelCode),
                            style: AppTypography.money(colors),
                          ),
                        ),
                        AppTableColumn(
                          id: 'name',
                          title: 'نام',
                          cellBuilder: (_, e) => Text('${e.firstName} ${e.lastName}'),
                        ),
                        AppTableColumn(
                          id: 'dept',
                          title: 'واحد',
                          cellBuilder: (_, e) => Text(e.department ?? '—'),
                        ),
                        AppTableColumn(
                          id: 'wage',
                          title: 'مزد روزانه',
                          numeric: true,
                          cellBuilder: (_, e) => Text(
                            MoneyFormatter.format(e.dailyWage, showUnit: false),
                            style: AppTypography.money(colors),
                          ),
                        ),
                        AppTableColumn(
                          id: 'status',
                          title: 'وضعیت',
                          cellBuilder: (_, e) => StatusBadge(
                            label: e.active ? 'فعال' : 'غیرفعال',
                            tone: e.active
                                ? StatusBadgeTone.success
                                : StatusBadgeTone.neutral,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openForm(
    BuildContext context,
    WidgetRef ref, {
    Employee? existing,
  }) {
    return SideSheet.show<void>(
      context,
      title: existing == null ? 'افزودن پرسنل' : 'ویرایش پرسنل',
      width: 520,
      child: _EmployeeForm(existing: existing),
    );
  }
}

class _EmployeeForm extends ConsumerStatefulWidget {
  const _EmployeeForm({this.existing});

  final Employee? existing;

  @override
  ConsumerState<_EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends ConsumerState<_EmployeeForm> {
  int _tab = 0;
  late final TextEditingController _code;
  late final TextEditingController _nid;
  late final TextEditingController _first;
  late final TextEditingController _last;
  late final TextEditingController _dept;
  late final TextEditingController _job;
  late final TextEditingController _sheba;
  late final TextEditingController _ins;
  int? _dailyWage;
  int _children = 0;
  bool _married = false;
  bool _childEligible = true;
  Jalali? _hireDate;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _code = TextEditingController(text: e?.personnelCode ?? '');
    _nid = TextEditingController(text: e?.nationalId ?? '');
    _first = TextEditingController(text: e?.firstName ?? '');
    _last = TextEditingController(text: e?.lastName ?? '');
    _dept = TextEditingController(text: e?.department ?? '');
    _job = TextEditingController(text: e?.jobTitle ?? '');
    _sheba = TextEditingController(text: e?.sheba ?? '');
    _ins = TextEditingController(text: e?.insuranceNumber ?? '');
    _dailyWage = e?.dailyWage ?? 5541850;
    _children = e?.childrenCount ?? 0;
    _married = e?.married ?? false;
    _childEligible = e?.childAllowanceEligible ?? true;
    if (e != null) {
      final g = e.hireDate;
      _hireDate = Jalali.fromDateTime(g);
    } else {
      _hireDate = Jalali.now();
    }
  }

  @override
  void dispose() {
    _code.dispose();
    _nid.dispose();
    _first.dispose();
    _last.dispose();
    _dept.dispose();
    _job.dispose();
    _sheba.dispose();
    _ins.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      final repo = ref.read(employeeRepositoryProvider);
      final companion = EmployeesCompanion.insert(
        personnelCode: _code.text.trim(),
        nationalId: _nid.text.trim(),
        insuranceNumber: Value(
          _ins.text.trim().isEmpty ? null : _ins.text.trim(),
        ),
        firstName: _first.text.trim(),
        lastName: _last.text.trim(),
        married: Value(_married),
        childrenCount: Value(_children),
        childAllowanceEligible: Value(_childEligible),
        hireDate: (_hireDate ?? Jalali.now()).toDateTime(),
        department: Value(_dept.text.trim().isEmpty ? null : _dept.text.trim()),
        jobTitle: Value(_job.text.trim().isEmpty ? null : _job.text.trim()),
        sheba: Value(_sheba.text.trim().isEmpty ? null : _sheba.text.trim()),
        dailyWage: _dailyWage ?? 0,
      );
      await repo.upsert(companion, id: widget.existing?.id);
      await repo.log(
        widget.existing == null ? 'create' : 'update',
        '${_first.text} ${_last.text}',
      );
      if (mounted) {
        Navigator.of(context).pop();
        AppToast.show(
          context,
          message: AppStrings.savedSuccessfully,
          tone: AppToastTone.success,
        );
      }
    } catch (e) {
      if (mounted) {
        AppToast.show(
          context,
          message: '$e',
          tone: AppToastTone.error,
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTabs(
          index: _tab,
          onChanged: (i) => setState(() => _tab = i),
          tabs: const [
            AppTabItem(label: 'مشخصات', icon: Icons.badge_outlined),
            AppTabItem(label: 'استخدام', icon: Icons.work_outline),
            AppTabItem(label: 'حقوق', icon: Icons.payments_outlined),
            AppTabItem(label: 'بانک', icon: Icons.account_balance_outlined),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        AnimatedSwitcher(
          duration: AppMotion.normal,
          switchInCurve: AppMotion.curve,
          child: KeyedSubtree(
            key: ValueKey(_tab),
            child: _tabBody(),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            Expanded(
              child: AppButton(
                label: AppStrings.save,
                loading: _saving,
                expanded: true,
                onPressed: _saving ? null : _save,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _tabBody() {
    return switch (_tab) {
      0 => Column(
          children: [
            AppTextField(controller: _code, label: AppStrings.personnelCode),
            const SizedBox(height: AppSpacing.md),
            AppTextField(controller: _nid, label: AppStrings.nationalId),
            const SizedBox(height: AppSpacing.md),
            AppTextField(controller: _first, label: AppStrings.firstName),
            const SizedBox(height: AppSpacing.md),
            AppTextField(controller: _last, label: AppStrings.lastName),
            const SizedBox(height: AppSpacing.md),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('متأهل'),
              value: _married,
              onChanged: (v) => setState(() => _married = v),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('واجد شرایط حق اولاد (۷۲۰ روز)'),
              value: _childEligible,
              onChanged: (v) => setState(() => _childEligible = v),
            ),
            Row(
              children: [
                const Text('تعداد فرزند'),
                const Spacer(),
                IconButton(
                  onPressed: _children > 0
                      ? () => setState(() => _children--)
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(PersianDigits.toPersian('$_children')),
                IconButton(
                  onPressed: () => setState(() => _children++),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
      1 => Column(
          children: [
            DateField(
              label: AppStrings.hireDate,
              value: _hireDate,
              onChanged: (v) => setState(() => _hireDate = v),
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(controller: _dept, label: AppStrings.department),
            const SizedBox(height: AppSpacing.md),
            AppTextField(controller: _job, label: 'عنوان شغلی'),
          ],
        ),
      2 => Column(
          children: [
            MoneyField(
              label: AppStrings.baseSalary,
              valueRials: _dailyWage,
              onChanged: (v) => setState(() => _dailyWage = v),
            ),
            const SizedBox(height: AppSpacing.sm),
            const StatusBadge(
              label: AppStrings.needsReview,
              tone: StatusBadgeTone.warning,
              icon: Icons.flag_outlined,
            ),
          ],
        ),
      _ => Column(
          children: [
            AppTextField(controller: _ins, label: 'شماره بیمه'),
            const SizedBox(height: AppSpacing.md),
            AppTextField(controller: _sheba, label: 'شبا'),
          ],
        ),
    };
  }
}
