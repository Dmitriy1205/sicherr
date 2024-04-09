part of 'contacts_bloc.dart';

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState.loadInProgress() = _LoadInProgress;
  const factory ContactsState.openFoundedContact({required ContactEntity contact}) = _OpenFoundedContact;
  const factory ContactsState.notFoundContact() = _NotFoundContact;
  const factory ContactsState.loaded({
    required Map<String, List<ContactEntity>> categorizedContacts,
  }) = _Loaded;
}