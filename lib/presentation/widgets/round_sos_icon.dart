import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';

class RoundSosIcon extends StatelessWidget {
  final double height;
  final double width;
  final double fontSize;

  const RoundSosIcon({
    super.key,
    required this.height,
    required this.width, required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          'SOS',
          style: AppTheme.themeData.textTheme.headlineMedium!
              .copyWith(fontSize: fontSize, color: Colors.white),
        ),
      ),
    );
  }
}