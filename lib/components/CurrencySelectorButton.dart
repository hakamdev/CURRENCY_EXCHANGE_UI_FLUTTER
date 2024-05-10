import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:flutter/material.dart';

class CurrencySelectorButton extends StatelessWidget {
  const CurrencySelectorButton({
    super.key,
    required this.label,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.splashColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: splashColor ?? HakamTheme.iconBackground.withAlpha(100),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: foregroundColor ?? HakamTheme.labelDark,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: foregroundColor ?? HakamTheme.labelDark,
            ),
          ],
        ),
      ),
    );
  }
}
