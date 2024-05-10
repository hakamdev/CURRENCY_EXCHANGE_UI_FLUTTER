import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:currency_converter_demo_app/components/CardTextInfo.dart';
import 'package:flutter/material.dart';

class ExchangeInfoCard extends StatelessWidget {
  const ExchangeInfoCard({
    super.key,
    required this.amount,
    required this.amountConverted,
    required this.exchangeRate,
    required this.networkFee,
    required this.tax,
    required this.logistics,
    required this.selectedCurrency,
    required this.selectedExchangeCurrency,
  });

  final double amount;
  final double amountConverted;
  final double exchangeRate;
  final double networkFee;
  // final double networkFeeConverted;
  final double tax;
  // final double taxConverted;
  final double logistics;
  // final double logisticsConverted;
  final String selectedCurrency;
  final String selectedExchangeCurrency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HakamTheme.background,
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: HakamTheme.labelDark.withAlpha(100),
          width: 1,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CardTextInfo(
              label: "Exchange Rate",
              info: "1 $selectedCurrency = 0.34 $selectedExchangeCurrency",
            ),
            const SizedBox(height: 16),
            CardTextInfo(
              label: "Network Fee",
              info: "0.048 $selectedExchangeCurrency",
              extraInfo: "+ 10 $selectedCurrency",
            ),
            const SizedBox(height: 16),
            CardTextInfo(
              label: "Tax",
              info: "0.048 $selectedExchangeCurrency",
              extraInfo: "+ 10 $selectedCurrency",
            ),
            const SizedBox(height: 16),
            CardTextInfo(
              label: "Logistics",
              info: "0.048 $selectedExchangeCurrency",
              extraInfo: "+ 10 $selectedCurrency",
            ),
            const SizedBox(height: 16),
            Divider(
              color: HakamTheme.labelDark.withAlpha(100),
              thickness: 2,
              height: 2,
            ),
            const SizedBox(height: 16),
            CardTextInfo(
              label: "Total",
              info: "1.43 $selectedExchangeCurrency",
            ),
          ],
        ),
      ),
    );
  }
}
