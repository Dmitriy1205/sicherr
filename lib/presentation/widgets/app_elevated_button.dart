import 'package:flutter/material.dart';
import 'package:sicherr/core/theme/theme.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final bool showArrow;
  final bool showPrefix;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final double? borderRadius;
  final Widget? widget;
  final Color? color;
  final Color? borderColor;

  const AppElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.style,
    this.showArrow = false,
    this.showPrefix = false,
    this.borderRadius,
    this.widget,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.white,
          backgroundColor: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
              borderRadius: borderRadius == null
                  ? BorderRadius.circular(17)
                  : BorderRadius.circular(borderRadius!)),
        ),
        child: widget ??
            Text(
              text,
              style: style ?? AppTheme.themeData.textTheme.labelMedium,
            ),
      ),
    );
  }
}
