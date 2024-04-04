part of 'configure_contacts_bloc.dart';

@freezed
class ConfigureContactsState with _$ConfigureContactsState {
  const factory ConfigureContactsState.loadInProgress() = _LoadInProgress;
  const factory ConfigureContactsState.loaded({
    required Map<String, List<ContactEntity>> categorizedContacts,
    required bool isPermissionDenied,
    required List<ContactEntity> selectedContacts,
  }) = _Loaded;
}
