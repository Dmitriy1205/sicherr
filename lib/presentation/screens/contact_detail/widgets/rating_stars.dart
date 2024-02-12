import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/icons.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.star,
          width: 15,
          height: 14,
        ),
        SvgPicture.asset(
          AppIcons.star,
          width: 15,
          height: 14,
        ),
        SvgPicture.asset(
          AppIcons.star,
          width: 15,
          height: 14,
        ),
        SvgPicture.asset(
          AppIcons.star,
          width: 15,
          height: 14,
        ),
        SvgPicture.asset(
          AppIcons.star,
          width: 15,
          height: 14,
        ),
      ],
    );
  }
}