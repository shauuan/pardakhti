import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_spacing.dart';
import '../../utils/money_formatter.dart';
import 'app_text_field.dart';

/// ورود مبلغ با جداکننده زنده — مقدار داخلی همیشه ریال (int).
class MoneyField extends StatefulWidget {
  const MoneyField({
    super.key,
    required this.valueRials,
    required this.onChanged,
    this.label,
    this.errorText,
    this.unit = DisplayCurrency.rial,
    this.enabled = true,
  });

  final int? valueRials;
  final ValueChanged<int?> onChanged;
  final String? label;
  final String? errorText;
  final DisplayCurrency unit;
  final bool enabled;

  @override
  State<MoneyField> createState() => _MoneyFieldState();
}

class _MoneyFieldState extends State<MoneyField> {
  late final TextEditingController _controller;
  bool _editing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _display(widget.valueRials));
  }

  @override
  void didUpdateWidget(covariant MoneyField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_editing &&
        (oldWidget.valueRials != widget.valueRials ||
            oldWidget.unit != widget.unit)) {
      _controller.text = _display(widget.valueRials);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _display(int? rials) {
    if (rials == null) return '';
    return MoneyFormatter.format(
      rials,
      unit: widget.unit,
      showUnit: false,
    );
  }

  void _onChanged(String raw) {
    _editing = true;
    final rials = MoneyFormatter.tryParseRials(raw, unit: widget.unit);
    if (rials != null) {
      final formatted = MoneyFormatter.format(
        rials,
        unit: widget.unit,
        showUnit: false,
      );
      if (_controller.text != formatted) {
        final selectionIndex = formatted.length;
        _controller.value = TextEditingValue(
          text: formatted,
          selection: TextSelection.collapsed(offset: selectionIndex),
        );
      }
    }
    widget.onChanged(rials);
    _editing = false;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: _controller,
      label: widget.label,
      errorText: widget.errorText,
      enabled: widget.enabled,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.left,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\d۰-۹,]')),
      ],
      onChanged: _onChanged,
      suffix: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.xs),
        child: Text(
          MoneyFormatter.unitLabel(widget.unit),
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
