import 'dart:convert';
import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/core/utils/phone_formatter.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/entities/country_codes/country_codes.dart';

abstract interface class ContactsInterface {
  Future<List<ContactEntity>> getLocalContacts();
}

class ContactsManager implements ContactsInterface {
  final String contactsCollection = 'contacts';
  static late List<CountryCodes> countryCodes;

  ContactsManager() {
    _initCountryCodes();
  }

  _initCountryCodes() async {
    final countryCodesJson =
        await rootBundle.loadString('assets/country_codes/country_codes.json');
    final data = await json.decode(countryCodesJson);
    countryCodes = (data as List).map((e) => CountryCodes.fromJson(e)).toList();
  }

  @override
  Future<List<ContactEntity>> getLocalContacts() async {
    final List<ContactEntity> contacts = [];

    final permission = await Permission.contacts.request();
    if (permission.isGranted) {
      final localContacts =
          await ContactsService.getContacts(photoHighResolution: false);

      for (var element in localContacts) {
        try {
          final contact = ContactEntity.fromLocalContact(element);
          if (contact.phoneNumber.isNotEmpty) {
            contacts.add(contact);
          }
        } catch (_) {}
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

  static List<ContactEntity> searchContacts(
      String query, List<ContactEntity> contacts) {
    final contactsToDisplay = contacts.where((contact) {
      final name = contact.name.toLowerCase().replaceAll(RegExp(r'\s'), '');
      final phone = PhoneFormatter.formatPhone(contact.phoneNumber);
      final input = query.toLowerCase().replaceAll(RegExp(r'\s'), '');

      return name.contains(input) || phone.contains(input);
    }).toList();
    return contactsToDisplay;
  }

  static Future<void> launchCall({required String phoneNumber}) async {
    try {
      FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } catch (e) {
      log('launchCall: Can not make phone call');
    }
  }

  static CountryCodes? separateDialCode(String number) {
    final userNumber = number.replaceAll(RegExp(r"\D"), "");
    final countryCode = countryCodes.firstWhereOrNull((country) {
      final dialCode = country.phone.replaceAll(RegExp(r"\D"), "");
      try {
        final userDialCode = userNumber.substring(0, dialCode.length);
        final isMatchedDialCodes = userDialCode == dialCode;
        final isMatchedPhoneLength =
            userNumber.substring(dialCode.length).length == country.phoneLength;
        return isMatchedDialCodes && isMatchedPhoneLength;
      } on RangeError {
        return false;
      } catch (e) {
        return false;
      }
    });

    return countryCode;
  }

  static String combineDialCodeAndPhone(
      {required CountryCodes countryCode, required String phone}) {
    try {
      if (phone.length > countryCode.phoneLength &&
          countryCode.phone.split('').last == phone.split('').first) {
        return countryCode.phone + phone.substring(1);
      } else {
        return countryCode.phone + phone;
      }
    } catch (e) {
      return phone;
    }
  }
}
