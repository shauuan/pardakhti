import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';

enum AppToastTone { success, error, info, warning }

abstract final class AppToast {
  static void show(
    BuildContext context, {
    required String message,
    AppToastTone tone = AppToastTone.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final colors = context.colors;
    final (bg, icon) = switch (tone) {
      AppToastTone.success => (colors.success, Icons.check_circle_outline),
      AppToastTone.error => (colors.danger, Icons.error_outline),
      AppToastTone.warning => (colors.warning, Icons.warning_amber_outlined),
      AppToastTone.info => (colors.info, Icons.info_outline),
    };

    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(AppSpacing.md),
        content: Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: bg,
            borderRadius: AppRadii.mdAll,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: colors.textOnPrimary, size: 20),
                  const SizedBox(width: AppSpacing.sm),
                  Flexible(
                    child: Text(
                      message,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colors.textOnPrimary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
