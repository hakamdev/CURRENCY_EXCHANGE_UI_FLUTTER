import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:flutter/material.dart';

class ToolbarButton extends StatelessWidget {
  const ToolbarButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  });

  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      icon: Icon(icon),
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor ?? HakamTheme.iconBackground,
        foregroundColor: foregroundColor ?? HakamTheme.labelDark,
        padding: const EdgeInsets.all(16),
      ),
      onPressed: onPressed,
    );
  }
}
