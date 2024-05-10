import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:flutter/cupertino.dart';

class CurrencyIcon extends StatelessWidget {
  const CurrencyIcon({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
  });

  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? HakamTheme.iconBackground,
      ),
      child: Icon(
        icon,
        color: foregroundColor ?? HakamTheme.labelDark,
        size: 32,
      ),
    );
  }
}
