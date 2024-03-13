import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';

import '../../../../domain/entities/emergency_contact/emergency_contact.dart';

class EmContactCard extends StatelessWidget {
  final bool isEmergency;

  const EmContactCard(
      {super.key, required this.contact, required this.isEmergency});

  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmergencyContactBloc, EmergencyContactState>(
      builder: (context, state) {
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
                              : contact.getMainPhoneNumber,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          contact.getMainPhoneNumber,
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
              GestureDetector(
                onTap: () {
                  state.emContacts!
                      .any((element) => element.id == contact.id) ? context
                      .read<EmergencyContactBloc>()
                      .add(EmergencyContactEvent
                      .deleteFromEmContact(
                  contactId:
                  contact.id))
                      : context
                      .read<EmergencyContactBloc>()
                      .add(
                    EmergencyContactEvent
                        .addToEmContact(
                      emContact: EmergencyContact(
                          id: contact.id,
                          name: contact.name,
                          phoneNumber: contact
                              .phones
                              .first),
                    ),
                  );
                },
                child: !state.emContacts!
                        .any((element) => element.id == contact.id)
                    ? Container(
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
                      )
                    : Container(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
