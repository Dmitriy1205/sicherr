import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgRoundWrapperIcon extends StatelessWidget {
  const SvgRoundWrapperIcon({
    super.key,
    required this.svgPath,
    this.color,
    this.padding,
    this.width,
    this.height,
  });

  final Color? color;
  final double? padding;
  final double? width;
  final double? height;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(padding ?? 6),
      child: SvgPicture.asset(
        svgPath,
        color: Colors.white,
        height: height ?? 20,
        width: width ?? 20,
      ),
    );
  }
}


