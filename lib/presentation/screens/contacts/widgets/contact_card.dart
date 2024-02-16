import 'package:flutter/material.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/managers/contacts_manager.dart';
import 'package:sicherr/presentation/screens/contact_detail/contact_detail.dart';
import 'package:sicherr/presentation/widgets/round_wrapper_icon.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});
  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactDetailScreen(
                contact: contact,
              ),
            ));
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipOval(
              child: contact.image != null && contact.image!.isNotEmpty
                  ? Image.memory(
                      contact.image!,
                      height: 42,
                      width: 42,
                    )
                  : Image.asset(
                      AppImages.userPlaceholder,
                      height: 42,
                      width: 42,
                    ),
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: Text(
                contact.name.isNotEmpty
                    ? contact.name
                    : contact.getMainPhoneNumber,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                ContactsManager.launchCall(
                    phoneNumber: contact.getMainPhoneNumber);
              },
              child: const RoundWrapperIcon(svgPath: AppIcons.phone),
            ),
          ],
        ),
      ),
    );
  }
}
