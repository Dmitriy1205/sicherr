import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/presentation/bloc/danger_contact/dc_bloc.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';
import 'package:sicherr/presentation/screens/contact_detail/contact_detail.dart';
import 'package:sicherr/presentation/screens/dangerous_contacts/details_screen/dc_details_screen.dart';
import 'package:sicherr/presentation/widgets/round_sos_icon.dart';
import 'package:sicherr/presentation/widgets/svg_round_wrapper_icon.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/utils/phone_encryptor.dart';
import '../../../bloc/shared_contacts/sc_bloc.dart';


class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});

  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmergencyContactBloc, EmergencyContactState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            final bool isContainInDangerous = context.read<DcBloc>().state.dc!.any((element) => element.id == contact.id);
            if (isContainInDangerous) {

            final ContactEntity dangerContact = context.read<DcBloc>().state.dc!.where((element) => element.id == contact.id).first;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DCDetailScreen(
                      contact: dangerContact,
                    )),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContactDetailScreen(
                      contact: contact,
                    )),
              );
            }

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
                  child: Wrap(
                    spacing: 10,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact.name.isNotEmpty
                                ? contact.name
                                : contact.phoneNumber,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            contact.phoneNumber,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF838383)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      !state.emContacts
                              .any((element) => element.id == contact.id)
                          ? const SizedBox()
                          : const RoundSosIcon(
                              height: 20,
                              width: 20,
                              fontSize: 6.11,
                            ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                context.watch<DcBloc>().state.dc?.any((element) => element.id == contact.id) ?? false ? const SizedBox() :  GestureDetector(
                  onTap: () {
                    ContactsManager.launchCall(
                        phoneNumber: contact.phoneNumber);
                  },
                  child: const SvgRoundWrapperIcon(svgPath: AppIcons.phone),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
