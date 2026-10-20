import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_motion.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/ui/buttons/app_button.dart';
import '../../../../core/ui/feedback/app_toast.dart';
import '../../../../core/ui/inputs/app_text_field.dart';
import '../../../../core/ui/stepper/app_stepper.dart';
import '../../../../core/utils/persian_digits.dart';
import '../../../payroll/domain/fiscal_settings.dart';
import '../auth_providers.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  int _step = 0;
  final _company = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  String? _recoveryKey;
  bool _busy = false;

  @override
  void dispose() {
    _company.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    if (_password.text.length < 4) {
      AppToast.show(
        context,
        message: 'رمز حداقل ۴ کاراکتر باشد',
        tone: AppToastTone.error,
      );
      return;
    }
    if (_password.text != _confirm.text) {
      AppToast.show(
        context,
        message: 'تکرار رمز مطابقت ندارد',
        tone: AppToastTone.error,
      );
      return;
    }
    setState(() => _busy = true);
    try {
      final key = await ref.read(authRepositoryProvider).setup(
            password: _password.text,
            companyName:
                _company.text.trim().isEmpty ? 'شرکت من' : _company.text.trim(),
          );
      setState(() {
        _recoveryKey = key;
        _step = 3;
      });
      ref.invalidate(onboardedFutureProvider);
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
    final fiscal = FiscalSettings.defaults1405();

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Container(
            margin: const EdgeInsets.all(AppSpacing.lg),
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: AppRadii.xlAll,
              border: Border.all(color: colors.border),
              boxShadow: AppShadows.elevated(colors.textPrimary),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'راه‌اندازی ${AppConfig.appName}',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppStepper(
                  currentIndex: _step.clamp(0, 3),
                  steps: const ['شرکت', 'سال مالی', 'رمز', 'کلید'],
                ),
                const SizedBox(height: AppSpacing.xl),
                AnimatedSwitcher(
                  duration: AppMotion.normal,
                  child: KeyedSubtree(
                    key: ValueKey(_step),
                    child: _body(fiscal, colors),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                if (_step < 3)
                  Row(
                    children: [
                      if (_step > 0)
                        AppButton(
                          label: 'قبلی',
                          variant: AppButtonVariant.ghost,
                          onPressed: () => setState(() => _step--),
                        ),
                      const Spacer(),
                      AppButton(
                        label: _step == 2 ? 'ایجاد حساب' : 'ادامه',
                        loading: _busy,
                        onPressed: _busy
                            ? null
                            : () {
                                if (_step == 2) {
                                  _finish();
                                } else {
                                  setState(() => _step++);
                                }
                              },
                      ),
                    ],
                  )
                else
                  AppButton(
                    label: 'ورود به برنامه',
                    expanded: true,
                    onPressed: () {
                      ref.read(sessionUnlockedProvider.notifier).state = true;
                      context.go('/');
                    },
                  ),
              ],
            ),
          ).animate().fadeIn(duration: AppMotion.slow),
        ),
      ),
    );
  }

  Widget _body(FiscalSettings fiscal, AppColors colors) {
    return switch (_step) {
      0 => AppTextField(
          controller: _company,
          label: 'نام شرکت',
          hint: 'مثلاً شرکت نمونه',
          prefixIcon: Icons.apartment_outlined,
        ),
      1 => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'سال مالی پیش‌فرض ${PersianDigits.toPersian('${fiscal.year}')}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'حداقل مزد روزانه و جدول مالیات ۱۴۰۵ از قبل بارگذاری شده و در تنظیمات قابل ویرایش است.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.textSecondary,
                  ),
            ),
          ],
        ),
      2 => Column(
          children: [
            AppTextField(
              controller: _password,
              label: 'رمز عبور',
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(
              controller: _confirm,
              label: 'تکرار رمز',
              obscureText: true,
            ),
          ],
        ),
      _ => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'کلید بازیابی را در جای امن ذخیره کنید. این برنامه آفلاین است و ریست ایمیلی ندارد.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.warning,
                  ),
            ),
            const SizedBox(height: AppSpacing.md),
            SelectableText(
              _recoveryKey ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: 'کپی کلید',
              variant: AppButtonVariant.secondary,
              icon: Icons.copy,
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: _recoveryKey ?? ''));
                if (mounted) {
                  AppToast.show(
                    context,
                    message: 'کپی شد',
                    tone: AppToastTone.success,
                  );
                }
              },
            ),
          ],
        ),
    };
  }
}
