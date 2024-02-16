import 'dart:developer';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';

abstract interface class ContactsInterface {
  Future<List<ContactEntity>> getContacts();
}

class ContactsManager implements ContactsInterface {
  @override
  Future<List<ContactEntity>> getContacts() async {
    final List<ContactEntity> contacts = [];

    final permission = await Permission.contacts.request();
    if (permission.isGranted) {
      final localContacts = await ContactsService.getContacts();

      for (var element in localContacts) {
        final contact = ContactEntity.fromLocalContact(element);
        if (contact.phoneNumber.isNotEmpty) {
          contacts.add(contact);
        }
      }
    } else if (permission.isPermanentlyDenied) {
      log('Contacts Permission Denied');
    }

    return contacts;
  }

  static Map<String, List<ContactEntity>> categorizeContacts(
      List<ContactEntity> contacts) {
    // Sort the contacts alphabetically
    contacts.sort((a, b) => a.name.compareTo(b.name));

    Map<String, List<ContactEntity>> categorizedContacts = {};

    // Iterate over the sorted contacts list
    for (ContactEntity contact in contacts) {
      // Get the first character of the contact name
      String firstCharacter =
          contact.name.isNotEmpty ? contact.name[0].toUpperCase() : '#';

      // If it's a letter, digit, or Cyrillic character, add it to its corresponding category
      if (firstCharacter.contains(RegExp(r'\p{L}', unicode: true))) {
        categorizedContacts[firstCharacter] ??= [];
        categorizedContacts[firstCharacter]!.add(contact);
      } else {
        // If it's not a letter, digit, or Cyrillic character, add it to the '#' category
        categorizedContacts['#'] ??= [];
        categorizedContacts['#']!.add(contact);
      }
    }

    if (categorizedContacts.isNotEmpty &&
        categorizedContacts.entries.first.key == '#') {
      final firstEntry = categorizedContacts.entries.first;
      categorizedContacts.remove(firstEntry.key);
      categorizedContacts[firstEntry.key] = firstEntry.value;
    }

    return categorizedContacts;
  }

  static Future<void> launchCall({required String phoneNumber}) async {
    try {
      FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } catch (e) {
      log('launchCall: Can not make phone call');
    }
  }
}
