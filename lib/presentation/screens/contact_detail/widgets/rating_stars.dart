import 'package:flutter/material.dart';
import 'package:sicherr/core/const/colors.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    // Calculate the number of full stars and the fraction part
    final int fullStars = rating.floor();
    final double fraction = rating - fullStars;

    return Row(
      children: [
        // Display full stars
        for (int i = 0; i < fullStars; i++)
          const Icon(
            Icons.star,
            color: AppColors.yellow,
            size: 16,
          ),
        // Display half star if necessary
        if (fraction >= 0.5)
          const Icon(
            Icons.star_half,
            color: AppColors.yellow,
            size: 16,
          ),
      ],
    );
  }
}

// Example usage:
// RatingStars(rating: 3.5),
