import 'package:flutter/material.dart';

class RoundWrapperIcon extends StatelessWidget {
  const RoundWrapperIcon({
    super.key,
    required this.icon,
    this.color,
    this.padding,
    this.size,
  });

  final Color? color;
  final double? padding;
  final double? size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(padding ?? 6),
        child: Icon(
          icon,
          color: Colors.white,
          size: size ?? 20,
        ));
  }
}
