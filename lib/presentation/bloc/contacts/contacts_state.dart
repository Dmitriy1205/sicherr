part of 'contacts_bloc.dart';

@freezed
class ContactsState with _$ContactsState {
  const ContactsState._();

  Map<String, List<ContactEntity>>? get categorizedContacts =>
      maybeMap(loaded: (state) => state.categorizedContacts, orElse: () => {});

  List<ContactEntity> get listContacts =>
      maybeMap(loaded: (state) => state.listContacts, orElse: () => []);

  bool get isPermissionDenied => maybeMap(
      loaded: (state) => state.isPermissionDenied, orElse: () => false);

  const factory ContactsState.loadInProgress() = _LoadInProgress;

  const factory ContactsState.loaded({
    required Map<String, List<ContactEntity>> categorizedContacts,
    required bool isPermissionDenied,
  }) = _Loaded;
}