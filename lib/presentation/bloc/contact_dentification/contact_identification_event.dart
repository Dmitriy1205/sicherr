part of 'contact_identification_bloc.dart';

@freezed
class ContactIdentificationEvent with _$ContactIdentificationEvent {
  const factory ContactIdentificationEvent.identifyContacts() = _IdentifyContacts;
}
