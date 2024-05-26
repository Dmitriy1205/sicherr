import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';

import '../../core/service_locator/service_locator.dart';
import '../bloc/shared_contacts/sc_bloc.dart';

class SelectableContactCard extends StatelessWidget {
  final bool isSelected;
  final ContactEntity contact;
  final void Function()? onTap;

  const SelectableContactCard({
    super.key,
    required this.contact,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            child: Wrap(
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name.isNotEmpty
                          ? contact.name
                          : sl<PhoneNumberEncryptor>().decrypt(contact.phoneNumber),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                     sl<PhoneNumberEncryptor>().decrypt(contact.phoneNumber) ,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF838383)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          context.watch<ScBloc>().state.sc?.any((element) => element.id == contact.id) ?? false
              ? const SizedBox()
              : isSelected
                  ? GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: 27,
                        width: 27,
                        decoration: const BoxDecoration(
                          color: AppColors.mainAccent,
                          shape: BoxShape.circle,
                        ),
                        // padding: const EdgeInsets.all(6),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: 27,
                        width: 27,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}
