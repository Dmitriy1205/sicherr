import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:url_launcher/url_launcher.dart';

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
      contacts.addAll(
          localContacts.map((e) => ContactEntity.fromLocalContact(e)).toList());
    } else if (permission.isPermanentlyDenied) {
      print('Contacts Permission Denied');
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
      // Get the first letter of the contact name
      String firstLetter = contact.name.isNotEmpty
          ? contact.name.substring(0, 1).toUpperCase()
          : '';
      // Create a new list if the category doesn't exist
      categorizedContacts[firstLetter] ??= [];
      // Add the contact to its corresponding category
      categorizedContacts[firstLetter]!.add(contact);
    }

    if (categorizedContacts.isNotEmpty &&
        categorizedContacts.entries.first.key == '') {
      final firstEntry =
          categorizedContacts.remove(categorizedContacts.keys.first);
      categorizedContacts[''] = firstEntry ?? [];
    }

    return categorizedContacts;
  }

  static Future<void> launchCall({required String phoneNumber}) async {
    final url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Can not make phone call');
    }
  }
}
