import 'package:contacts_service/contacts_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/utils/phone_formatter.dart';

part 'contact_entity.freezed.dart';
part 'contact_entity.g.dart';

@freezed
class ContactEntity with _$ContactEntity {
  factory ContactEntity({
    required String id,
    required String name,
    required String phoneNumber,
    double? rate,
    List<String>? tags,
    String? image,
  }) = _ContactEntity;

  factory ContactEntity.fromJson(Map<String, dynamic> json) =>
      _$ContactEntityFromJson(json);

  factory ContactEntity.fromLocalContact(Contact contact) {
    return ContactEntity(
      id: contact.identifier ?? '',
      name: contact.displayName ?? '',
      phoneNumber: () {
        if (contact.phones != null && contact.phones!.isNotEmpty) {
          final phoneNumber = contact.phones!.first.value ?? '';
          return PhoneFormatter.formatPhone(phoneNumber);
        } else {
          return '';
        }
      }(),
    );
  }
}
