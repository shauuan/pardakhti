import 'package:drift/drift.dart' show Value;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/feedback/app_dialog.dart';
import '../../../../core/ui/feedback/app_toast.dart';
import '../../../../core/ui/layout/app_card.dart';
import '../../../../core/utils/persian_digits.dart';
import '../../../payroll/presentation/payroll_providers.dart';
import '../../../reports/data/excel_reports.dart';
import '../../data/import_service.dart';

class MonthlyInputsPage extends ConsumerStatefulWidget {
  const MonthlyInputsPage({super.key});

  @override
  ConsumerState<MonthlyInputsPage> createState() => _MonthlyInputsPageState();
}

class _MonthlyInputsPageState extends ConsumerState<MonthlyInputsPage> {
  List<_EditRow> _rows = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(_load);
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final db = ref.read(databaseProvider);
    final year = ref.read(selectedYearProvider);
    final month = ref.read(selectedMonthProvider);
    final period =
        await ref.read(payrollServiceProvider).ensurePeriod(year, month);
    final employees = await (db.select(db.employees)
          ..where((t) => t.active.equals(true)))
        .get();
    final inputs = await (db.select(db.monthlyInputs)
          ..where((t) => t.periodId.equals(period.id)))
        .get();
    final byEmp = {for (final i in inputs) i.employeeId: i};

    final rows = <_EditRow>[];
    for (final e in employees) {
      var input = byEmp[e.id];
      if (input == null) {
        final id = await db.into(db.monthlyInputs).insert(
              MonthlyInputsCompanion.insert(
                periodId: period.id,
                employeeId: e.id,
              ),
            );
        input = await (db.select(db.monthlyInputs)..where((t) => t.id.equals(id)))
            .getSingle();
      }
      rows.add(_EditRow(employee: e, input: input));
    }
    setState(() {
      _rows = rows;
      _loading = false;
    });
  }

  Future<void> _import() async {
    final pick = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['xlsx', 'xls', 'csv'],
    );
    if (pick == null || pick.files.isEmpty || pick.files.first.path == null) {
      return;
    }
    final path = pick.files.first.path!;
    final year = ref.read(selectedYearProvider);
    final month = ref.read(selectedMonthProvider);
    final importer = ImportService(ref.read(databaseProvider));
    try {
      final preview = await importer.previewFile(path);
      final errors = preview.where((r) => !r.ok).toList();
      final okCount = preview.where((r) => r.ok).length;
      if (!mounted) return;
      final msg = StringBuffer('ردیف معتبر: $okCount');
      if (errors.isNotEmpty) {
        msg.writeln('\nخطاها:');
        for (final e in errors.take(8)) {
          msg.writeln('ردیف ${e.rowIndex}: ${e.error}');
        }
      }
      final go = await AppDialog.confirm(
        context,
        title: 'پیش‌نمایش ایمپورت',
        body: msg.toString(),
        confirmLabel: 'اعمال',
      );
      if (go == true) {
        final n = await importer.apply(
          year: year,
          month: month,
          rows: preview,
        );
        await _load();
        if (mounted) {
          AppToast.show(
            context,
            message: '$n ردیف اعمال شد',
            tone: AppToastTone.success,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        AppToast.show(context, message: '$e', tone: AppToastTone.error);
      }
    }
  }

  Future<void> _save() async {
    final db = ref.read(databaseProvider);
    for (final row in _rows) {
      await (db.update(db.monthlyInputs)
            ..where((t) => t.id.equals(row.input.id)))
          .write(
        MonthlyInputsCompanion(
          workedDays: Value(row.workedDays),
          overtimeHours: Value(row.overtime),
          nightHours: Value(row.night),
          holidayHours: Value(row.holiday),
          bonusAmount: Value(row.bonus),
          advanceAmount: Value(row.advance),
        ),
      );
    }
    if (mounted) {
      AppToast.show(
        context,
        message: 'ورودی‌ها ذخیره شد',
        tone: AppToastTone.success,
      );
    }
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
                    PersianDigits.toPersian('ورودی ماهانه $year/$month'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  AppButton(
                    label: 'نمونه Excel',
                    variant: AppButtonVariant.ghost,
                    icon: Icons.download_outlined,
                    onPressed: () async {
                      final bytes = ExcelReports.sampleMonthlyInput();
                      await FilePicker.platform.saveFile(
                        dialogTitle: 'ذخیره نمونه',
                        fileName: 'sample-monthly-input.xlsx',
                        bytes: bytes,
                      );
                    },
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  AppButton(
                    label: 'ایمپورت',
                    variant: AppButtonVariant.secondary,
                    icon: Icons.upload_file_outlined,
                    onPressed: _import,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  AppButton(
                    label: 'ذخیره (Ctrl+S)',
                    icon: Icons.save_outlined,
                    onPressed: _save,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: AppCard(
                animateEnter: true,
                enterIndex: 1,
                padding: EdgeInsets.zero,
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          child: DataTable(
                            headingRowColor: WidgetStatePropertyAll(
                              colors.background,
                            ),
                            columns: const [
                              DataColumn(label: Text('کد')),
                              DataColumn(label: Text('نام')),
                              DataColumn(label: Text('کارکرد')),
                              DataColumn(label: Text('اضافه‌کار')),
                              DataColumn(label: Text('شب')),
                              DataColumn(label: Text('تعطیل')),
                              DataColumn(label: Text('پاداش')),
                              DataColumn(label: Text('مساعده')),
                            ],
                            rows: [
                              for (final row in _rows)
                                DataRow(
                                  cells: [
                                    DataCell(Text(
                                      PersianDigits.toPersian(
                                        row.employee.personnelCode,
                                      ),
                                      style: AppTypography.money(colors),
                                    )),
                                    DataCell(Text(
                                      '${row.employee.firstName} ${row.employee.lastName}',
                                    )),
                                    DataCell(_numField(
                                      '${row.workedDays}',
                                      (v) => row.workedDays =
                                          int.tryParse(v) ?? row.workedDays,
                                    )),
                                    DataCell(_numField(
                                      '${row.overtime}',
                                      (v) => row.overtime =
                                          double.tryParse(v) ?? row.overtime,
                                    )),
                                    DataCell(_numField(
                                      '${row.night}',
                                      (v) => row.night =
                                          double.tryParse(v) ?? row.night,
                                    )),
                                    DataCell(_numField(
                                      '${row.holiday}',
                                      (v) => row.holiday =
                                          double.tryParse(v) ?? row.holiday,
                                    )),
                                    DataCell(_numField(
                                      '${row.bonus}',
                                      (v) => row.bonus =
                                          int.tryParse(v) ?? row.bonus,
                                    )),
                                    DataCell(_numField(
                                      '${row.advance}',
                                      (v) => row.advance =
                                          int.tryParse(v) ?? row.advance,
                                    )),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _numField(String initial, ValueChanged<String> onChanged) {
    return SizedBox(
      width: 88,
      child: TextField(
        controller: TextEditingController(text: initial),
        keyboardType: TextInputType.number,
        style: AppTypography.money(context.colors, size: 13),
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class _EditRow {
  _EditRow({required this.employee, required this.input})
      : workedDays = input.workedDays,
        overtime = input.overtimeHours,
        night = input.nightHours,
        holiday = input.holidayHours,
        bonus = input.bonusAmount,
        advance = input.advanceAmount;

  final Employee employee;
  final MonthlyInput input;
  int workedDays;
  double overtime;
  double night;
  double holiday;
  int bonus;
  int advance;
}
