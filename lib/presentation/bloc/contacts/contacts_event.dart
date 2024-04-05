part of 'contacts_bloc.dart';

@freezed
class ContactsEvent with _$ContactsEvent {
  const factory ContactsEvent.loadContacts() = _LoadContacts;
  const factory ContactsEvent.searchContact(String text) = _SearchContact;
}
