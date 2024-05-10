import 'package:currency_converter_demo_app/components/CurrencySelectorButton.dart';
import 'package:currency_converter_demo_app/utils/CurrencySelectorUtils.dart';
import 'package:flutter/material.dart';

class CurrencySelector<T> extends StatefulWidget {
  const CurrencySelector({
    super.key,
    required this.title,
    required this.options,
    required this.onSelect,
    this.selected,
    this.defaultLabel,
    this.convertToString,
    this.buttonForegroundColor,
  });

  final String title;
  final List<T> options;
  final T? selected;
  final void Function(T) onSelect;
  final String? defaultLabel;
  final String Function(T)? convertToString;

  final Color? buttonForegroundColor;

  @override
  State<CurrencySelector<T>> createState() => _CurrencySelectorState<T>();
}

class _CurrencySelectorState<T> extends State<CurrencySelector<T>> {
  T? selected;

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CurrencySelectorButton(
      label: selected != null
          ? widget.convertToString?.call(selected as T) ?? selected.toString()
          : (widget.defaultLabel ?? "---"),
      foregroundColor: widget.buttonForegroundColor,
      onPressed: () async {
        final result = await showSelectionsSheet<T>(
          context,
          title: widget.title,
          options: widget.options,
          selected: selected,
          getOptionText: widget.convertToString,
        );

        if (result == null) return;
        setState(() => selected = result);
        widget.onSelect(result);
      },
    );
  }
}
