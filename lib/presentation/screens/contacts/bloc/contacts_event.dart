part of 'contacts_bloc.dart';

@freezed
class ContactsEvent with _$ContactsEvent {
  const factory ContactsEvent.initial() = _InitialEvent;
  const factory ContactsEvent.searchByPhone(String phoneNumber) = _SearchByPhone;
  const factory ContactsEvent.checkPermission() = _CheckPermission;
}