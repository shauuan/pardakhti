import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_motion.dart';
import '../../theme/app_spacing.dart';

abstract final class SideSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Widget child,
    double width = AppSpacing.sideSheetWidth,
    List<Widget>? actions,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'بستن',
      barrierColor: context.colors.overlay,
      transitionDuration: AppMotion.normal,
      pageBuilder: (ctx, anim, secondary) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: context.colors.surfaceElevated,
            child: SizedBox(
              width: width,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.lg,
                      AppSpacing.lg,
                      AppSpacing.md,
                      AppSpacing.md,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: Theme.of(ctx).textTheme.titleLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          icon: const Icon(Icons.close),
                          tooltip: 'بستن',
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: context.colors.border),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: child,
                    ),
                  ),
                  if (actions != null) ...[
                    Divider(height: 1, color: context.colors.border),
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for (var i = 0; i < actions.length; i++) ...[
                            if (i > 0) const SizedBox(width: AppSpacing.sm),
                            actions[i],
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (ctx, anim, secondary, child) {
        final offset = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: anim, curve: AppMotion.curve));
        return SlideTransition(position: offset, child: child);
      },
    );
  }
}
