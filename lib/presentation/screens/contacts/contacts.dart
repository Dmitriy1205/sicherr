import 'package:flutter/material.dart';
import 'package:sicherr/presentation/screens/contacts/widgets/contact_card.dart';
import 'package:sicherr/presentation/widgets/search_phone_field.dart';

final contacts = [
  'Artem B.',
  'Artem A.',
  'Bob',
  'Bad',
  'Some Long Name With A lot of words',
  'QWERTY',
  'ZZZZ'
];

Map<String, List<String>> categorizeContacts(List<String> contacts) {
  // Sort the contacts alphabetically
  contacts.sort();

  Map<String, List<String>> categorizedContacts = {};

  // Iterate over the sorted contacts list
  for (String contact in contacts) {
    // Get the first letter of the contact name
    String firstLetter = contact.substring(0, 1).toUpperCase();

    // Create a new list if the category doesn't exist
    categorizedContacts[firstLetter] ??= [];

    // Add the contact to its corresponding category
    categorizedContacts[firstLetter]!.add(contact);
  }

  return categorizedContacts;
}

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchPhoneField(
          hintText: 'Search by number',
          onChanged: (text) {},
        ),
        const SizedBox(height: 10),
        ContactListDisplayed()
      ],
    );
  }
}

class ContactListDisplayed extends StatelessWidget {
  ContactListDisplayed({Key? key}) : super(key: key);
  final groupedContacts = categorizeContacts(contacts);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: groupedContacts.length,
        itemBuilder: (BuildContext context, int index) {
          String category = groupedContacts.keys.elementAt(index);
          List<String> itemsInCategory = groupedContacts[category]!;
      
          // Return a widget representing the category and its items
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: index != 0 ? 15 : 0, bottom: 5),
                child: Text(
                  category,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: itemsInCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  String itemName = itemsInCategory[index];
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

