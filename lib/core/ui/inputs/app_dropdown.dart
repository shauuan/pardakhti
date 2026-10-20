import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.labelBuilder,
    this.label,
    this.hint,
    this.errorText,
    this.enabled = true,
  });

  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String Function(T) labelBuilder;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colors.textSecondary,
                ),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        DropdownButtonFormField<T>(
          // ignore: deprecated_member_use
          value: value,
          hint: hint != null ? Text(hint!) : null,
          items: [
            for (final item in items)
              DropdownMenuItem(
                value: item,
                child: Text(labelBuilder(item)),
              ),
          ],
          onChanged: enabled ? onChanged : null,
          decoration: InputDecoration(errorText: errorText),
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: colors.textMuted),
          borderRadius: BorderRadius.circular(12),
          dropdownColor: colors.surfaceElevated,
        ),
      ],
    );
  }
}
