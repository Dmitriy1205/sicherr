import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/entities/emergency_contact/emergency_contact.dart';
import 'package:sicherr/domain/managers/contacts_manager.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/additional_content.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/contact_info.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../widgets/round_sos_icon.dart';

class ContactDetailScreen extends StatefulWidget {
  ContactDetailScreen({super.key, required this.contact});

  final ContactEntity contact;

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
   bool? isEmergency;

  @override
  void initState() {
    isEmergency = context.read<EmergencyContactBloc>().state.emContacts == null
        ? false
        : context
            .read<EmergencyContactBloc>()
            .state
            .emContacts!
            .any((element) => element.id == widget.contact.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightGrey,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
              },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContactInfo(
                      contact: widget.contact,
                      isEmergency: isEmergency!,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {
                          ContactsManager.launchCall(
                              phoneNumber: widget.contact.getMainPhoneNumber);
                        },
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                children: [
                                  const RoundWrapperIcon(
                                      svgPath: AppIcons.phone),
                                  const SizedBox(height: 10),
                                  Text(
                                    AppLocalizations.of(context)!.call,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      isEmergency!
                                          // context
                                          //     .read<EmergencyContactBloc>()
                                          //     .state
                                          //     .emContacts == null|| context
                                          //     .read<EmergencyContactBloc>()
                                          //     .state
                                          //     .emContacts!.any((element) => element.id == widget.contact.id)
                                          ? context
                                              .read<EmergencyContactBloc>()
                                              .add(EmergencyContactEvent
                                                  .deleteFromEmContact(
                                                      contactId:
                                                          widget.contact.id))
                                          : context
                                              .read<EmergencyContactBloc>()
                                              .add(
                                                EmergencyContactEvent
                                                    .addToEmContact(
                                                  emContact: EmergencyContact(
                                                      id: widget.contact.id,
                                                      name: widget.contact.name,
                                                      phoneNumber: widget
                                                          .contact
                                                          .phones
                                                          .first),
                                                ),
                                              );
                                      setState(() {
                                        isEmergency = !isEmergency!;
                                      });
                                    },
                                    child: const RoundSosIcon(
                                      height: 31,
                                      width: 31,
                                      fontSize: 7.33,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    context
                                                    .read<
                                                        EmergencyContactBloc>()
                                                    .state
                                                    .emContacts ==
                                                null ||
                                            context
                                                .read<EmergencyContactBloc>()
                                                .state
                                                .emContacts!
                                                .any((element) =>
                                                    element.id ==
                                                    widget.contact.id)
                                        ? '- ${AppLocalizations.of(context)!.emergency}'
                                        : '+ ${AppLocalizations.of(context)!.emergency}',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              const AdditionalContentBlock(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context)!.subscribeOnly,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppElevatedButton(
                  text: AppLocalizations.of(context)!.subscribe,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  onPressed: () {
                    print('TODO: Subscribe');
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
