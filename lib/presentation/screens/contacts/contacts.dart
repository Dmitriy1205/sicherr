import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/contacts/contacts_bloc.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/emergency_contact/emergency_contact_bloc.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  void initState() {
    context
        .read<EmergencyContactBloc>()
        .add(const EmergencyContactEvent.getAllEmContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        return state.maybeMap(
            loadInProgress: (_) => const Center(child: LoadingIndicator()),
            orElse: () => const Center(child: LoadingIndicator()),
            loaded: (state) => Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 18),
                      child: SearchPhoneField(
                        hintText: AppLocalizations.of(context)!.search,
                        onChanged: (text) {
                          context.read<EmergencyContactBloc>().add(
                              const EmergencyContactEvent.getAllEmContacts());

                          context
                              .read<ContactsBloc>()
                              .add(ContactsEvent.searchContact(text));
                        },
                      ),
                    ),
                    ContactListDisplayed(
                        groupedContacts: state.categorizedContacts)
                  ],
                ));
      },
    );
  }
}

class ContactListDisplayed extends StatelessWidget {
  const ContactListDisplayed({Key? key, required this.groupedContacts})
      : super(key: key);
  final Map<String, List<ContactEntity>> groupedContacts;

  @override
  Widget build(BuildContext context) {
    return groupedContacts.isEmpty
        ? Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.noContacts,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        : GroupedItems(
            groupedContacts: groupedContacts,
            contactFactory: ContactCardFactory(),
          );
  }
}
