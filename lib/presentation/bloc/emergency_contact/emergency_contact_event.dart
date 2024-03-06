part of 'emergency_contact_bloc.dart';

@freezed
class EmergencyContactEvent with _$EmergencyContactEvent {
  const factory EmergencyContactEvent.getAllEmContacts() = _GetAllEmContacts;

  const factory EmergencyContactEvent.addToEmContact(
      {required EmergencyContact emContact}) = _AddToEmContact;

  const factory EmergencyContactEvent.deleteFromEmContact(
      {required String contactId}) = _DeleteFromEmContact;

  const factory EmergencyContactEvent.loadEmContacts(
      {required List<EmergencyContact> emContacts}) = _LoadEmContacts;

  const factory EmergencyContactEvent.catchError({required String error}) =
      _CatchError;
}
