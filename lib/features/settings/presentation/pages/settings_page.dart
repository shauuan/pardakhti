import 'dart:convert';

import 'package:drift/drift.dart' show OrderingTerm, Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/theme_mode_provider.dart';
import '../../../../core/ui/badges/status_badge.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/feedback/app_toast.dart';
import '../../../../core/ui/inputs/app_text_field.dart';
import '../../../../core/ui/layout/app_card.dart';
import '../../../../core/utils/persian_digits.dart';
import '../../../auth/presentation/auth_providers.dart';
import '../../../backup/backup_helper.dart';
import '../../../payroll/domain/fiscal_settings.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final _company = TextEditingController();
  final _curPass = TextEditingController();
  final _newPass = TextEditingController();
  FiscalSettings _fiscal = FiscalSettings.defaults1405();
  List<(String, bool, bool, bool)> _payItems = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(_load);
  }

  Future<void> _load() async {
    final db = ref.read(databaseProvider);
    final company = await (db.select(db.companyProfile)
          ..where((t) => t.id.equals(1)))
        .getSingleOrNull();
    if (company != null) _company.text = company.name;

    final fy = await (db.select(db.fiscalYearSettings)
          ..where((t) => t.year.equals(1405)))
        .getSingleOrNull();
    if (fy != null) {
      _fiscal = FiscalSettings.fromJson(
        jsonDecode(fy.settingsJson) as Map<String, dynamic>,
      );
    }

    final items = await (db.select(db.payItemDefinitions)
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .get();
    if (!mounted) return;
    setState(() {
      _payItems = [
        for (final i in items)
          (i.name, i.subjectToInsurance, i.subjectToTax, i.needsReview),
      ];
    });
  }

  @override
  void dispose() {
    _company.dispose();
    _curPass.dispose();
    _newPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final themeMode = ref.watch(themeModeProvider);

    return ColoredBox(
      color: colors.background,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          AppCard(
            title: 'شرکت',
            animateEnter: true,
            child: Column(
              children: [
                AppTextField(controller: _company, label: 'نام شرکت'),
                const SizedBox(height: AppSpacing.md),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppButton(
                    label: AppStrings.save,
                    onPressed: () async {
                      final db = ref.read(databaseProvider);
                      await (db.update(db.companyProfile)
                            ..where((t) => t.id.equals(1)))
                          .write(
                        CompanyProfileCompanion(
                          name: Value(_company.text.trim()),
                        ),
                      );
                      if (mounted) {
                        AppToast.show(
                          context,
                          message: AppStrings.savedSuccessfully,
                          tone: AppToastTone.success,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            title: 'ظاهر',
            animateEnter: true,
            enterIndex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    themeMode == ThemeMode.dark
                        ? AppStrings.darkTheme
                        : AppStrings.lightTheme,
                  ),
                ),
                AppButton(
                  label: AppStrings.toggleTheme,
                  variant: AppButtonVariant.secondary,
                  onPressed: () =>
                      ref.read(themeModeProvider.notifier).toggle(),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            title: 'سال مالی ${PersianDigits.toPersian('${_fiscal.year}')}',
            animateEnter: true,
            enterIndex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'حداقل مزد روزانه: ${PersianDigits.toPersian('${_fiscal.minDailyWage}')}',
                ),
                Text(
                  'حداقل ماهانه: ${PersianDigits.toPersian('${_fiscal.minMonthlyWage}')}',
                ),
                Text(
                  'حق مسکن: ${PersianDigits.toPersian('${_fiscal.housingAllowance}')}',
                ),
                Text(
                  'بن: ${PersianDigits.toPersian('${_fiscal.foodAllowance}')}',
                ),
                Text(
                  'بیمه: ${_fiscal.employeeInsurancePercent}% / ${_fiscal.employerInsurancePercent}% / بیکاری ${_fiscal.unemploymentInsurancePercent}%',
                ),
                Text('تعداد پله مالیات: ${_fiscal.taxBrackets.length}'),
                const SizedBox(height: AppSpacing.sm),
                const StatusBadge(
                  label: AppStrings.inclusivityWarning,
                  tone: StatusBadgeTone.warning,
                ),
                const SizedBox(height: AppSpacing.md),
                AppButton(
                  label: 'کپی تنظیمات به سال بعد',
                  variant: AppButtonVariant.secondary,
                  onPressed: () async {
                    final db = ref.read(databaseProvider);
                    final nextYear = _fiscal.year + 1;
                    final exists = await (db.select(db.fiscalYearSettings)
                          ..where((t) => t.year.equals(nextYear)))
                        .getSingleOrNull();
                    if (exists != null) {
                      if (mounted) {
                        AppToast.show(
                          context,
                          message: 'سال $nextYear از قبل وجود دارد',
                          tone: AppToastTone.warning,
                        );
                      }
                      return;
                    }
                    final json = Map<String, dynamic>.from(_fiscal.toJson());
                    json['year'] = nextYear;
                    await db.into(db.fiscalYearSettings).insert(
                          FiscalYearSettingsCompanion.insert(
                            year: nextYear,
                            settingsJson: jsonEncode(json),
                          ),
                        );
                    if (mounted) {
                      AppToast.show(
                        context,
                        message: 'سال $nextYear ایجاد شد',
                        tone: AppToastTone.success,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            title: 'اقلام حقوقی و مشمولیت',
            animateEnter: true,
            enterIndex: 3,
            child: Column(
              children: [
                for (final item in _payItems)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(item.$1),
                    subtitle: Text(
                      'بیمه: ${item.$2 ? 'بله' : 'خیر'} · مالیات: ${item.$3 ? 'بله' : 'خیر'}',
                    ),
                    trailing: item.$4
                        ? const StatusBadge(
                            label: AppStrings.needsReview,
                            tone: StatusBadgeTone.warning,
                          )
                        : null,
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            title: 'رمز عبور',
            animateEnter: true,
            enterIndex: 4,
            child: Column(
              children: [
                AppTextField(
                  controller: _curPass,
                  label: 'رمز فعلی',
                  obscureText: true,
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  controller: _newPass,
                  label: 'رمز جدید',
                  obscureText: true,
                ),
                const SizedBox(height: AppSpacing.md),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppButton(
                    label: 'تغییر رمز',
                    onPressed: () async {
                      try {
                        await ref.read(authRepositoryProvider).changePassword(
                              currentPassword: _curPass.text,
                              nextPassword: _newPass.text,
                            );
                        if (mounted) {
                          AppToast.show(
                            context,
                            message: 'رمز تغییر کرد',
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
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            title: 'بکاپ',
            animateEnter: true,
            enterIndex: 5,
            child: Row(
              children: [
                const Expanded(
                  child: Text('کپی دیتابیس در Documents/PardakhtiBackups'),
                ),
                AppButton(
                  label: 'بکاپ اکنون',
                  icon: Icons.backup_outlined,
                  onPressed: () async {
                    try {
                      await BackupHelper.createBackup();
                      if (mounted) {
                        AppToast.show(
                          context,
                          message: 'بکاپ ذخیره شد',
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
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const AppCard(
            title: AppStrings.keyboardShortcuts,
            animateEnter: true,
            enterIndex: 6,
            child: Text(
              'Ctrl+S ذخیره · Ctrl+K جستجو · Ctrl+N پرسنل جدید · Esc بستن',
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const AppCard(
            title: 'درباره',
            animateEnter: true,
            enterIndex: 7,
            child: Text('${AppConfig.appName} نسخه ${AppConfig.version}'),
          ),
        ],
      ),
    );
  }
}
