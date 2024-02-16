part of 'contacts_bloc.dart';

@freezed
class ContactsEvent with _$ContactsEvent {
  const factory ContactsEvent.initial() = _InitialEvent;
  const factory ContactsEvent.searchContact(String text) = _SearchContact;
  const factory ContactsEvent.checkPermission() = _CheckPermission;
}