import 'package:flutter/material.dart';

import '../../core/const/colors.dart';

class AppTransparentButton extends StatelessWidget {
  final String text;
  final Color? mainColor;
  final VoidCallback? onPressed;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const AppTransparentButton({
    super.key,
    required this.text,
    this.mainColor,
    this.onPressed,
    this.height, this.padding, this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor:mainColor?.withOpacity(0.2) ?? AppColors.mainAccent.withOpacity(0.1),
      highlightColor:mainColor?.withOpacity(0.2) ?? AppColors.mainAccent.withOpacity(0.1),
      borderRadius: BorderRadius.circular(32),
      child: Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            border: Border.all(color: mainColor ?? AppColors.mainAccent)),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style:textStyle ?? Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: mainColor ?? AppColors.mainAccent),
          ),
        ),
      ),
    );
  }
}
