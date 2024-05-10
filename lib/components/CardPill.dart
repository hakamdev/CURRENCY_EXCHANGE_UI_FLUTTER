import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:flutter/material.dart';

class CardPill extends StatelessWidget {
  const CardPill({
    super.key,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          color: backgroundColor ?? HakamTheme.iconBackground,
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        label,
        style: TextStyle(
          color: foregroundColor ?? HakamTheme.labelDark,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}
