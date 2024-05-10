import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:currency_converter_demo_app/components/CardPill.dart';
import 'package:currency_converter_demo_app/components/CurrencyIcon.dart';
import 'package:currency_converter_demo_app/components/CurrencySelector.dart';
import 'package:currency_converter_demo_app/utils/CurrenciesUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  const ExchangeCard({
    super.key,
    required this.onCurrencyChanged,
    this.selectedCurrency,
  });

  final String? selectedCurrency;
  final void Function(String) onCurrencyChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HakamTheme.secondary,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TODO: SECTION 1
            Row(
              children: [
                Text(
                  "You receive",
                  style: TextStyle(
                    color: HakamTheme.labelLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const CardPill(label: "Overview"),
              ],
            ),
            const SizedBox(height: 16),
            // TODO: SECTION 2
            Row(
              children: [
                CurrencyIcon(
                  icon: selectedCurrency != null
                      ? (currencyIcons[selectedCurrency] ??
                          CupertinoIcons.money_dollar)
                      : CupertinoIcons.money_dollar,
                ),
                CurrencySelector<String>(
                  title: "Currencies",
                  selected: selectedCurrency,
                  options: currencies,
                  onSelect: onCurrencyChanged,
                  buttonForegroundColor: HakamTheme.labelLight,
                ),
                const Spacer(),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "780.00",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: HakamTheme.labelLight,
                      ),
                    ),
                    const TextSpan(text: " "),
                    TextSpan(
                      text: selectedCurrency ?? "---",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: HakamTheme.labelLight.withAlpha(100),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // TODO: SECTION 3
            SizedBox(
              width: double.infinity,
              child: Text(
                "BALANCE 104 343.00 ${selectedCurrency}",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: HakamTheme.labelLight.withAlpha(150),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
