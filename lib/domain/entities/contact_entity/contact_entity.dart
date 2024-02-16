import 'dart:typed_data';

import 'package:contacts_service/contacts_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/utils/phone_formatter.dart';

part 'contact_entity.freezed.dart';

@freezed
class ContactEntity with _$ContactEntity {
  factory ContactEntity({
    required String id,
    required String name,
    required List<String> phones,
    double? rate,
    List<String>? tags,
    Uint8List? image,
  }) = _ContactEntity;

  ContactEntity._();

  String get getMainPhoneNumber => phones.isNotEmpty ? phones.first : '';

  factory ContactEntity.fromLocalContact(Contact contact) {
    return ContactEntity(
      id: contact.identifier ?? '',
      name: contact.displayName ?? '',
      phones: _parsePhoneNumbers(contact.phones),
      image: contact.avatar,
    );
  }

  static List<String> _parsePhoneNumbers(List<Item>? phones) {
    if (phones != null && phones.isNotEmpty) {
      final formattedNumbers = <String>[];
      for (var element in phones) {
        if (element.value != null) {
          formattedNumbers.add(
            PhoneFormatter.formatPhone(element.value!),
          );
        }
      }
      return formattedNumbers;
    } else {
      return [];
    }
  }
}
