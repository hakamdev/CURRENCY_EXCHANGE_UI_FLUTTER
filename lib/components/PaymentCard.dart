import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:currency_converter_demo_app/components/CardPill.dart';
import 'package:currency_converter_demo_app/components/CurrencyIcon.dart';
import 'package:currency_converter_demo_app/components/CurrencySelector.dart';
import 'package:currency_converter_demo_app/utils/CurrenciesUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.onCurrencyChanged,
    this.selectedCurrency,
  });

  final String? selectedCurrency;
  final void Function(String) onCurrencyChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HakamTheme.primary,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TODO: SECTION 1
            Row(
              children: [
                Text(
                  "You pay",
                  style: TextStyle(
                    color: HakamTheme.labelDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const CardPill(label: "Half"),
                const SizedBox(width: 8),
                const CardPill(label: "Max"),
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
                ),
                const Spacer(),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "780.00",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: HakamTheme.labelDark,
                      ),
                    ),
                    const TextSpan(text: " "),
                    TextSpan(
                      text: selectedCurrency ?? "---",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: HakamTheme.labelDark.withAlpha(100),
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
                  color: HakamTheme.labelDark.withAlpha(150),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
