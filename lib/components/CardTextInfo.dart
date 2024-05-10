import 'package:currency_converter_demo_app/HakamTheme.dart';
import 'package:flutter/material.dart';

class CardTextInfo extends StatelessWidget {
  const CardTextInfo({
    super.key,
    required this.label,
    required this.info,
    this.extraInfo,
    this.color,
  });

  final String label;
  final String info;
  final String? extraInfo;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color textColor = color ?? HakamTheme.labelDark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: textColor.withAlpha(150),
            ),
          ),
        ),
        //const Spacer(),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                info,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: textColor,
                ),
              ),
              if (extraInfo != null)
                const SizedBox(height: 2),
              if (extraInfo != null)
                Text(
                  extraInfo!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: textColor.withAlpha(150),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
