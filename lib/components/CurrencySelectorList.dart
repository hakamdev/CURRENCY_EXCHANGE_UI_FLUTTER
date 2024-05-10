import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:flutter/material.dart';

class CurrencySelectorList<T> extends StatefulWidget {
  const CurrencySelectorList(
      {super.key,
      required this.title,
      required this.options,
      this.getOptionText,
      this.selected});

  final String title;
  final List<T> options;
  final String Function(T)? getOptionText;
  final T? selected;

  @override
  State<CurrencySelectorList<T>> createState() =>
      _CurrencySelectorListState<T>();
}

class _CurrencySelectorListState<T> extends State<CurrencySelectorList<T>> {
  List<T> filteredOptions = [];

  // String? searchQuery;

  void updateOptionsOnSearch(String query) {
    filteredOptions = widget.options.where((op) {
      final optionToText = widget.getOptionText?.call(op) ?? op.toString();
      return optionToText.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  void initState() {
    filteredOptions = widget.options;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 600,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.title,
              style: TextStyle(
                color: HakamTheme.labelDark,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              style: TextStyle(
                color: HakamTheme.labelDark,
              ),
              onChanged: (val) {
                updateOptionsOnSearch(val);
                setState(() {});
              },
              decoration: InputDecoration(hintText: "Search"),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop<T>(context, filteredOptions[index]);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: widget.selected == filteredOptions[index]
                          ? HakamTheme.primary
                          : null,
                      child: Text(
                        widget.getOptionText?.call(filteredOptions[index]) ??
                            filteredOptions[index].toString(),
                        style: TextStyle(color: HakamTheme.labelDark),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: filteredOptions.length),
          ),
        ],
      ),
    );
  }
}
