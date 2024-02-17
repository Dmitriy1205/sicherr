import 'package:flutter/material.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
    required this.contact,
  });

  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF646464)),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: contact.image != null && contact.image!.isNotEmpty
                ? Image.memory(
                    contact.image!,
                    height: 70,
                    width: 70,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    AppImages.userPlaceholder,
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              contact.getMainPhoneNumber,
              style: const TextStyle(fontSize: 16, color: Color(0xFF838383)),
            )
          ],
        )
      ],
    );
  }
}
