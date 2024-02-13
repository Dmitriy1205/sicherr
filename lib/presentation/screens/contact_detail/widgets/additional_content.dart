import 'package:flutter/material.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/rating_stars.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/show_tags.dart';

class AdditionalContentBlock extends StatelessWidget {
  const AdditionalContentBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Column(
          children: [
            const ShowTags(),
            const Divider(height: 1),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Rate this contact',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  RatingStars(rating: 0),
                ],
              ),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.75)),
          height: 150,
        ),
      ],
    );
  }
}