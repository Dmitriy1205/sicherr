import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/managers/contacts_manager.dart';
import 'package:sicherr/presentation/screens/contacts/bloc/contacts_bloc.dart';
import 'package:sicherr/presentation/screens/contacts/widgets/contact_card.dart';
import 'package:sicherr/presentation/widgets/loading_indicator.dart';
import 'package:sicherr/presentation/widgets/permission_alert_dialog.dart';
import 'package:sicherr/presentation/widgets/search_phone_field.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactsBloc(ContactsManager()),
      child: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          return state.maybeMap(
              loadInProgress: (_) => const Material(child: LoadingIndicator()),
              orElse: () => const Material(child: LoadingIndicator()),
              loaded: (state) => Column(
                    children: [
                      SearchPhoneField(
                        hintText: 'Search by number',
                        onChanged: (text) {
                          context
                              .read<ContactsBloc>()
                              .add(ContactsEvent.searchByPhone(text));
                        },
                      ),
                      const SizedBox(height: 10),
                      ContactListDisplayed(
                        groupedContacts: state.categorizedContacts,
                        isPermissionDenied: state.isPermissionDenied,
                      )
                    ],
                  ));
        },
      ),
    );
  }
}

class ContactListDisplayed extends StatelessWidget {
  const ContactListDisplayed(
      {Key? key,
      required this.groupedContacts,
      required this.isPermissionDenied})
      : super(key: key);
  final Map<String, List<ContactEntity>> groupedContacts;
  final bool isPermissionDenied;

  @override
  Widget build(BuildContext context) {
    return groupedContacts.isEmpty
        ? Expanded(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'No contacts to display',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              if (isPermissionDenied)
                GestureDetector(
                  onTap: () => showPermissionAlertDialog(
                    context,
                    content: 'Allow access to contacts',
                  ),
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      'Give permission to synchronize your contact list',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ))
        : Expanded(
            child: ListView.builder(
              itemCount: groupedContacts.length,
              itemBuilder: (BuildContext context, int index) {
                String category = groupedContacts.keys.elementAt(index);
                List<ContactEntity> itemsInCategory =
                    groupedContacts[category]!;

                // Return a widget representing the category and its items
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: index != 0 ? 15 : 0, bottom: 5),
                      child: Text(
                        category,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: itemsInCategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = itemsInCategory[index];
                        return ContactCard(contact: item);
                      },
                    ),
                  ],
                );
              },
            ),
          );
  }
}
