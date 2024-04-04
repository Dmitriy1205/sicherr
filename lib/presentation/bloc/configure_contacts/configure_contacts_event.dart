part of 'configure_contacts_bloc.dart';

@freezed
class ConfigureContactsEvent with _$ConfigureContactsEvent {
  const factory ConfigureContactsEvent.initial() = _InitialEvent;
  const factory ConfigureContactsEvent.searchContact(String text) =
      _SearchContact;
  const factory ConfigureContactsEvent.checkPermission() = _CheckPermission;
  const factory ConfigureContactsEvent.selectContact(ContactEntity contact) = _SelectContact;
}
