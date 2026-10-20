import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_motion.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';

class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.title,
    this.actions,
    this.onTap,
    this.interactive = false,
    this.animateEnter = false,
    this.enterIndex = 0,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onTap;
  final bool interactive;
  final bool animateEnter;
  final int enterIndex;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _hovered = false;
  bool _pressed = false;

  bool get _canInteract =>
      widget.interactive || widget.onTap != null;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final elevated = _hovered && _canInteract;

    final dy = _pressed ? 1.0 : (elevated ? -2.0 : 0.0);

    Widget card = AnimatedContainer(
      duration: AppMotion.normal,
      curve: AppMotion.curve,
      transform: Matrix4.translationValues(0, dy, 0),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadii.lgAll,
        border: Border.all(
          color: elevated
              ? colors.borderStrong.withValues(alpha: 0.55)
              : colors.border,
        ),
        boxShadow: elevated
            ? AppShadows.elevated(colors.textPrimary)
            : AppShadows.card(colors.textPrimary),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          onHover: _canInteract
              ? (v) => setState(() => _hovered = v)
              : null,
          onHighlightChanged: _canInteract
              ? (v) => setState(() => _pressed = v)
              : null,
          borderRadius: AppRadii.lgAll,
          hoverColor: colors.tableHover.withValues(alpha: 0.35),
          splashColor: colors.primaryMuted.withValues(alpha: 0.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.title != null || widget.actions != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    AppSpacing.md,
                    AppSpacing.md,
                    AppSpacing.sm,
                  ),
                  child: Row(
                    children: [
                      if (widget.title != null)
                        Expanded(
                          child: Text(
                            widget.title!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      if (widget.actions != null) ...widget.actions!,
                    ],
                  ),
                ),
              Padding(
                padding: widget.padding ?? const EdgeInsets.all(AppSpacing.md),
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );

    if (widget.animateEnter) {
      card = card
          .animate()
          .fadeIn(
            duration: AppMotion.slow,
            delay: AppMotion.stagger(widget.enterIndex),
            curve: AppMotion.curve,
          )
          .slideY(
            begin: 0.06,
            end: 0,
            duration: AppMotion.slow,
            delay: AppMotion.stagger(widget.enterIndex),
            curve: AppMotion.curveEmphasized,
          );
    }

    return card;
  }
}
