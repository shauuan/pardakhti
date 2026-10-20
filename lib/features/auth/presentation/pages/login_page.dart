import 'package:flutter/material.dart';
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
import '../auth_providers.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _password = TextEditingController();
  final _recovery = TextEditingController();
  final _newPass = TextEditingController();
  bool _busy = false;
  bool _recoverMode = false;

  @override
  void dispose() {
    _password.dispose();
    _recovery.dispose();
    _newPass.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() => _busy = true);
    try {
      final ok = await ref.read(authRepositoryProvider).login(_password.text);
      if (!ok) {
        if (mounted) {
          AppToast.show(
            context,
            message: 'رمز عبور نادرست است',
            tone: AppToastTone.error,
          );
        }
        return;
      }
      ref.read(sessionUnlockedProvider.notifier).state = true;
      if (mounted) context.go('/');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _reset() async {
    setState(() => _busy = true);
    try {
      final ok = await ref.read(authRepositoryProvider).resetWithRecovery(
            _recovery.text,
            _newPass.text,
          );
      if (!ok) {
        if (mounted) {
          AppToast.show(
            context,
            message: 'کلید بازیابی نادرست است',
            tone: AppToastTone.error,
          );
        }
        return;
      }
      if (mounted) {
        AppToast.show(
          context,
          message: 'رمز جدید ذخیره شد؛ وارد شوید',
          tone: AppToastTone.success,
        );
        setState(() => _recoverMode = false);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
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
                Container(
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: AppRadii.lgAll,
                    boxShadow: AppShadows.primaryGlow(colors.primary),
                  ),
                  child: Text(
                    'پ',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: colors.textOnPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                )
                    .animate()
                    .fadeIn(duration: AppMotion.slow)
                    .scale(begin: const Offset(0.9, 0.9)),
                const SizedBox(height: AppSpacing.md),
                Text(
                  AppConfig.appName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _recoverMode ? 'بازیابی رمز عبور' : 'ورود به برنامه',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.textSecondary,
                      ),
                ),
                const SizedBox(height: AppSpacing.xl),
                if (!_recoverMode) ...[
                  AppTextField(
                    controller: _password,
                    label: 'رمز عبور',
                    obscureText: true,
                    prefixIcon: Icons.lock_outline,
                    onSubmitted: (_) => _login(),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(
                    label: 'ورود',
                    expanded: true,
                    loading: _busy,
                    onPressed: _busy ? null : _login,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  AppButton(
                    label: 'فراموشی رمز / کلید بازیابی',
                    variant: AppButtonVariant.ghost,
                    onPressed: () => setState(() => _recoverMode = true),
                  ),
                ] else ...[
                  AppTextField(
                    controller: _recovery,
                    label: 'کلید بازیابی',
                    prefixIcon: Icons.vpn_key_outlined,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _newPass,
                    label: 'رمز جدید',
                    obscureText: true,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(
                    label: 'تنظیم رمز جدید',
                    expanded: true,
                    loading: _busy,
                    onPressed: _busy ? null : _reset,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  AppButton(
                    label: 'بازگشت',
                    variant: AppButtonVariant.ghost,
                    onPressed: () => setState(() => _recoverMode = false),
                  ),
                ],
              ],
            ),
          )
              .animate()
              .fadeIn(duration: AppMotion.slow)
              .slideY(begin: 0.04, end: 0, curve: AppMotion.curveEmphasized),
        ),
      ),
    );
  }
}
