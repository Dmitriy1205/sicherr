import 'package:flutter/material.dart';
import 'package:sicherr/core/const/images.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            AppImages.fakeUser,
            width: 70,
            height: 70,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Artem Y.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            //Todo: check if we need formating this number
            Text(
              '+38 066 074 1636',
              style: TextStyle(fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}
