import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../../utils/persian_digits.dart';
import '../buttons/app_button.dart';

/// انتخابگر تاریخ شمسی ساده و هماهنگ با سیستم طراحی.
class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.errorText,
    this.enabled = true,
  });

  final Jalali? value;
  final ValueChanged<Jalali?> onChanged;
  final String? label;
  final String? errorText;
  final bool enabled;

  String get _display {
    if (value == null) return '';
    final d = value!;
    final text =
        '${d.year.toString().padLeft(4, '0')}/${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}';
    return PersianDigits.toPersian(text);
  }

  Future<void> _openPicker(BuildContext context) async {
    if (!enabled) return;
    final selected = await showDialog<Jalali>(
      context: context,
      builder: (ctx) => _JalaliPickerDialog(initial: value ?? Jalali.now()),
    );
    if (selected != null) onChanged(selected);
  }

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
        InkWell(
          onTap: enabled ? () => _openPicker(context) : null,
          borderRadius: AppRadii.mdAll,
          child: InputDecorator(
            decoration: InputDecoration(
              errorText: errorText,
              suffixIcon: Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: colors.textMuted,
              ),
              enabled: enabled,
            ),
            child: Text(
              _display.isEmpty ? 'انتخاب تاریخ' : _display,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _display.isEmpty
                        ? colors.textMuted
                        : colors.textPrimary,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class _JalaliPickerDialog extends StatefulWidget {
  const _JalaliPickerDialog({required this.initial});

  final Jalali initial;

  @override
  State<_JalaliPickerDialog> createState() => _JalaliPickerDialogState();
}

class _JalaliPickerDialogState extends State<_JalaliPickerDialog> {
  late int _year;
  late int _month;
  late int _day;

  @override
  void initState() {
    super.initState();
    _year = widget.initial.year;
    _month = widget.initial.month;
    _day = widget.initial.day;
  }

  int get _daysInMonth => Jalali(_year, _month, 1).monthLength;

  static const _monthNames = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (_day > _daysInMonth) _day = _daysInMonth;

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'انتخاب تاریخ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: _SpinBox(
                      label: 'سال',
                      value: _year,
                      onChanged: (v) => setState(() => _year = v),
                      min: 1300,
                      max: 1500,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: _MonthDropdown(
                      value: _month,
                      names: _monthNames,
                      onChanged: (v) => setState(() => _month = v),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: _SpinBox(
                      label: 'روز',
                      value: _day,
                      onChanged: (v) => setState(() => _day = v),
                      min: 1,
                      max: _daysInMonth,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    label: 'انصراف',
                    variant: AppButtonVariant.ghost,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  AppButton(
                    label: 'تأیید',
                    onPressed: () =>
                        Navigator.of(context).pop(Jalali(_year, _month, _day)),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(
                    PersianDigits.toPersian('$_year/$_month/$_day'),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colors.textMuted,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpinBox extends StatelessWidget {
  const _SpinBox({
    required this.label,
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            borderRadius: AppRadii.mdAll,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: value > min ? () => onChanged(value - 1) : null,
                icon: const Icon(Icons.remove, size: 16),
                visualDensity: VisualDensity.compact,
              ),
              Expanded(
                child: Text(
                  PersianDigits.toPersian('$value'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              IconButton(
                onPressed: value < max ? () => onChanged(value + 1) : null,
                icon: const Icon(Icons.add, size: 16),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MonthDropdown extends StatelessWidget {
  const _MonthDropdown({
    required this.value,
    required this.names,
    required this.onChanged,
  });

  final int value;
  final List<String> names;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('ماه', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 4),
        DropdownButtonFormField<int>(
          // ignore: deprecated_member_use
          value: value,
          items: [
            for (var i = 0; i < names.length; i++)
              DropdownMenuItem(value: i + 1, child: Text(names[i])),
          ],
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ],
    );
  }
}
