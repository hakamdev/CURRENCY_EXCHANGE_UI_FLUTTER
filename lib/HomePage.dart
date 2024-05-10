import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:currency_converter_demo_app/components/ExchangeCard.dart';
import 'package:currency_converter_demo_app/components/ExchangeInfoCard.dart';
import 'package:currency_converter_demo_app/components/PaymentCard.dart';
import 'package:currency_converter_demo_app/components/ToolbarButton.dart';
import 'package:currency_converter_demo_app/utils/CurrenciesUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _toolbarButtonSpacing = 24;
  String selectedCurrency = currencies[0];
  String selectedExchangeCurrency = currencies[1];

  Widget _toolbarLeadingButton({
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _toolbarButtonSpacing),
      child: ToolbarButton(
        icon: CupertinoIcons.arrow_left,
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HakamTheme.background,
      appBar: AppBar(
        leading: _toolbarLeadingButton(
          onPressed: () {},
        ),
        leadingWidth: 56 + _toolbarButtonSpacing * 2,
        actions: [
          ToolbarButton(
            icon: CupertinoIcons.bell,
            onPressed: () {},
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          IntrinsicHeight(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: PaymentCard(
                        selectedCurrency: selectedCurrency,
                        onCurrencyChanged: (newSelected) {
                          // TODO:
                          // if (selectedExchangeCurrency == newSelected) {
                          //   selectedExchangeCurrency = selectedCurrency;
                          // }
                          setState(
                              () => selectedCurrency = newSelected.toString());
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: ExchangeCard(
                        selectedCurrency: selectedExchangeCurrency,
                        onCurrencyChanged: (newSelected) {
                          // TODO:
                          // if (selectedCurrency == newSelected) {
                          //   selectedCurrency = selectedExchangeCurrency;
                          // }
                          setState(() => selectedExchangeCurrency =
                              newSelected.toString());
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, 0.06),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(
                        color: HakamTheme.background,
                        width: 8,
                      ),
                    ),
                    child: Icon(
                      Icons.sync_rounded,
                      color: HakamTheme.labelLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ExchangeInfoCard(
              amount: 1.24,
              amountConverted: 2.43,
              exchangeRate: 0.34,
              networkFee: 1.23,
              tax: 0.44,
              logistics: 1.4,
              selectedCurrency: selectedCurrency,
              selectedExchangeCurrency: selectedExchangeCurrency,
            ),
          ),
        ],
      ),
    );
  }
}
