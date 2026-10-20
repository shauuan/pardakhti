import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/theme_mode_provider.dart';
import '../../../../core/ui/badges/status_badge.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/feedback/app_toast.dart';
import '../../../../core/ui/layout/app_card.dart';
import '../../../../core/utils/persian_digits.dart';
import '../../../payroll/domain/fiscal_settings.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final themeMode = ref.watch(themeModeProvider);
    final fiscal = FiscalSettings.defaults1405();

    return ColoredBox(
      color: colors.background,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          AppCard(
            title: 'ظاهر',
            animateEnter: true,
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
                  icon: themeMode == ThemeMode.dark
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  onPressed: () =>
                      ref.read(themeModeProvider.notifier).toggle(),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            title: 'سال مالی ${PersianDigits.toPersian('${fiscal.year}')}',
            animateEnter: true,
            enterIndex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'حداقل مزد روزانه: ${PersianDigits.toPersian('${fiscal.minDailyWage}')} ریال',
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'سقف بیمه: ${PersianDigits.toPersian('${fiscal.insuranceCeiling}')} ریال',
                ),
                const SizedBox(height: AppSpacing.sm),
                const StatusBadge(
                  label: AppStrings.inclusivityWarning,
                  tone: StatusBadgeTone.warning,
                ),
                const SizedBox(height: AppSpacing.sm),
                const StatusBadge(
                  label: 'حق مسکن / حق تاهل / حق اولاد — نیازمند تأیید',
                  tone: StatusBadgeTone.warning,
                  icon: Icons.flag_outlined,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            title: 'بکاپ',
            animateEnter: true,
            enterIndex: 2,
            child: Row(
              children: [
                const Expanded(
                  child: Text('کپی فایل دیتابیس در پوشه Documents'),
                ),
                AppButton(
                  label: 'بکاپ اکنون',
                  icon: Icons.backup_outlined,
                  onPressed: () async {
                    try {
                      final support = await getApplicationSupportDirectory();
                      final dbFile =
                          File(p.join(support.path, 'pardakhti.sqlite'));
                      final docs = await getApplicationDocumentsDirectory();
                      final backupDir =
                          Directory(p.join(docs.path, 'PardakhtiBackups'));
                      await backupDir.create(recursive: true);
                      final stamp = DateTime.now()
                          .toIso8601String()
                          .replaceAll(':', '-');
                      final dest = p.join(
                        backupDir.path,
                        'pardakhti-$stamp.sqlite',
                      );
                      if (await dbFile.exists()) {
                        await dbFile.copy(dest);
                      }
                      // نگه‌داشتن ۱۰ نسخه آخر
                      final files = backupDir
                          .listSync()
                          .whereType<File>()
                          .toList()
                        ..sort(
                          (a, b) => b.path.compareTo(a.path),
                        );
                      for (var i = 10; i < files.length; i++) {
                        await files[i].delete();
                      }
                      if (context.mounted) {
                        AppToast.show(
                          context,
                          message: 'بکاپ ذخیره شد',
                          tone: AppToastTone.success,
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
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
          AppCard(
            title: 'درباره',
            animateEnter: true,
            enterIndex: 3,
            child: Text(
              '${AppConfig.appName} نسخه ${AppConfig.version}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
