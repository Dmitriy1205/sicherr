import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/entities/emergency_contact/emergency_contact.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository_impl.dart';
import 'package:sicherr/presentation/bloc/contact_details/contact_details_bloc.dart';
import 'package:sicherr/presentation/screens/contact_detail/add_tag.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/additional_content.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/contact_info.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/emergency_contact/emergency_contact_bloc.dart';

class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen({super.key, required this.contact});

  final ContactEntity contact;

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  bool? isEmergency;

  @override
  void initState() {
    isEmergency = context.read<EmergencyContactBloc>().state.emContacts.isEmpty
        ? false
        : context
            .read<EmergencyContactBloc>()
            .state
            .emContacts
            .any((element) => element.id == widget.contact.id);
    contactBloc = ContactDetailsBloc(
      contactsRepo:
          ContactsRepositoryImpl(firestore: FirebaseFirestore.instance),
    )..add(ContactDetailsEvent.initial(widget.contact));
    super.initState();
  }

  late final ContactDetailsBloc contactBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => contactBloc,
      child: Scaffold(
          appBar: const DefaultAppBar(),
          body: BlocConsumer<ContactDetailsBloc, ContactDetailsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => const Center(child: LoadingIndicator()),
                loaded: (state) => SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ContactInfo(
                              contact: state.detailedContact,
                              isEmergency: isEmergency!,
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ActionTextBotBnt(
                                      icon: const SvgRoundWrapperIcon(
                                          svgPath: AppIcons.phone),
                                      text: AppLocalizations.of(context)!.call,
                                      onTap: () {
                                        ContactsManager.launchCall(
                                            phoneNumber: state
                                                .detailedContact.phoneNumber);
                                      },
                                    ),
                                    const SizedBox(width: 25),
                                    ActionTextBotBnt(
                                      icon: const RoundWrapperIcon(
                                          icon: Icons.person_add_alt_1),
                                      text:
                                          AppLocalizations.of(context)!.addTag,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => BlocProvider.value(
                                              value: contactBloc,
                                              child: const AddTagScreen(),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 25),
                                    ActionTextBotBnt(
                                      icon: const RoundSosIcon(
                                        height: 31,
                                        width: 31,
                                        fontSize: 7.33,
                                      ),
                                      text: context
                                              .read<EmergencyContactBloc>()
                                              .state
                                              .emContacts
                                              .any((element) =>
                                                  element.id ==
                                                  state.detailedContact.id)
                                          ? '- ${AppLocalizations.of(context)!.emergency}'
                                          : '+ ${AppLocalizations.of(context)!.emergency}',
                                      onTap: () {
                                        isEmergency!
                                            ? context
                                                .read<EmergencyContactBloc>()
                                                .add(EmergencyContactEvent
                                                    .deleteFromEmContact(
                                                        contactId: state
                                                            .detailedContact
                                                            .id))
                                            : context
                                                .read<EmergencyContactBloc>()
                                                .add(
                                                  EmergencyContactEvent
                                                      .addToEmContact(
                                                    emContact: EmergencyContact(
                                                        id: state
                                                            .detailedContact.id,
                                                        name: state
                                                            .detailedContact
                                                            .name,
                                                        phoneNumber: state
                                                            .detailedContact
                                                            .phoneNumber),
                                                  ),
                                                );
                                        setState(() {
                                          isEmergency = !isEmergency!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      AdditionalContentBlock(
                        contact: state.detailedContact,
                      ),
                      // const Spacer(),
                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: Text(
                      //     AppLocalizations.of(context)!.subscribeOnly,
                      //     style: const TextStyle(
                      //         fontSize: 16, fontWeight: FontWeight.w500),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 30),
                      //   child: AppElevatedButton(
                      //     text: AppLocalizations.of(context)!.subscribe,
                      //     style: const TextStyle(
                      //         fontSize: 14, fontWeight: FontWeight.w400),
                      //     onPressed: () {
                      //       print('TODO: Subscribe');
                      //     },
                      //   ),
                      // ),
                      // const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
