import 'package:currency_converter_demo_app/components/CurrencySelectorList.dart';
import 'package:flutter/material.dart';

Future<T1?> showSelectionsSheet<T1>(
  BuildContext context, {
  required String title,
  required List<T1> options,
  String Function(T1)? getOptionText,
  T1? selected,
  double? safeAreaTop,
}) async {
  return showModalBottomSheet<T1>(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        margin: EdgeInsets.only(top: safeAreaTop ?? 0),
        child: CurrencySelectorList(
          title: title,
          options: options,
          getOptionText: getOptionText,
          selected: selected,
        ),
      );
    },
  );
}
