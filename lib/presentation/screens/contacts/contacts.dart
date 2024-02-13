import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/managers/contacts_manager.dart';
import 'package:sicherr/presentation/screens/contacts/bloc/contacts_bloc.dart';
import 'package:sicherr/presentation/screens/contacts/widgets/contact_card.dart';
import 'package:sicherr/presentation/widgets/loading_indicator.dart';
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
                        onChanged: (text) {},
                      ),
                      const SizedBox(height: 10),
                      ContactListDisplayed(
                          groupedContacts: state.categorizedContacts)
                    ],
                  ));
        },
      ),
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
        ? const Expanded(child: Center(child: Text('No contacts to display')))
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
                        String itemName = itemsInCategory[index].name;
                        // Return a widget representing the item
                        return ContactCard(title: itemName);
                      },
                    ),
                  ],
                );
              },
            ),
          );
  }
}

// final contacts1 = [
//   'Artem B.',
//   'Artem A.',
//   'Bob',
//   'Bad',
//   'Some Long Name With A lot of words',
//   'QWERTY',
//   'ZZZZ'
// ];
// final contacts = [
//   ContactEntity(
//     id: 'TestID_1',
//     name: 'Artem B.',
//     phoneNumber: '+380660741636',
//   ),
//   ContactEntity(
//     id: 'TestID_2',
//     name: 'Bob.',
//     phoneNumber: '+380660741637',
//   ),
//   ContactEntity(
//     id: 'TestID_3',
//     name: 'Artem A.',
//     phoneNumber: '+380660741638',
//   ),
//   ContactEntity(
//     id: 'TestID_4',
//     name: 'Bad',
//     phoneNumber: '+380660741639',
//   ),
//   ContactEntity(
//     id: 'TestID_5',
//     name: 'Some Long Name With A lot of words',
//     phoneNumber: '+380660741640',
//   ),
//   ContactEntity(
//     id: 'TestID_6',
//     name: 'QWERTY',
//     phoneNumber: '+380660741641',
//   ),
// ];


