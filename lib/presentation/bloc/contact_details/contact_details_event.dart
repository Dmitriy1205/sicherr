part of 'contact_details_bloc.dart';

@freezed
class ContactDetailsEvent with _$ContactDetailsEvent {
    const factory ContactDetailsEvent.initial(ContactEntity contact) = _InitialEvent;
    const factory ContactDetailsEvent.addTag({required String contactId,required String text}) = _AddTagEvent;
    const factory ContactDetailsEvent.rateContact(double rating) = _RateContactEvent;
}