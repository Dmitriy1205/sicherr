import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository.dart';

part 'configure_contacts_state.dart';
part 'configure_contacts_event.dart';
part 'configure_contacts_bloc.freezed.dart';

class ConfigureContactsBloc
    extends Bloc<ConfigureContactsEvent, ConfigureContactsState> {
  ConfigureContactsBloc(this.contactsRepository)
      : super(const ConfigureContactsState.loadInProgress()) {
    on<ConfigureContactsEvent>(_mapEventToState);
    add(const ConfigureContactsEvent.initial());
  }

  List<ContactEntity> _contactsList = [];
  List<ContactEntity> _contactsToDisplay = [];
  List<ContactEntity> _selectedContacts = [];

  final ContactsRepository contactsRepository;

  PermissionStatus _permissionStatus = PermissionStatus.denied;
  bool get _isPermissionDenied =>
      _permissionStatus == PermissionStatus.denied ||
      _permissionStatus == PermissionStatus.permanentlyDenied;

  void _mapEventToState(
          ConfigureContactsEvent event, Emitter<ConfigureContactsState> emit) =>
      event.map(
        initial: (e) => _initialEvent(e, emit),
        searchContact: (e) => _searchContact(e, emit),
        checkPermission: (e) => _checkPermission(e, emit),
        selectContact: (e) => _selectContact(e, emit),
        assignContacts: (e) => _assignContacts(e, emit),
      );

  Future<void> _initialEvent(
      _InitialEvent event, Emitter<ConfigureContactsState> emit) async {
    _contactsList = await contactsRepository.getLocalContacts();
    _selectedContacts = await contactsRepository.getUserContacts(
            currentUserId: FirebaseAuth.instance.currentUser!.uid) ??
        [];
    _contactsToDisplay = [..._contactsList];
    _permissionStatus = await Permission.contacts.status;

    _emitLoadedState(emit);
  }

  void _searchContact(
      _SearchContact event, Emitter<ConfigureContactsState> emit) {
    emit(const ConfigureContactsState.loadInProgress());
    if (event.text.isEmpty) {
      _contactsToDisplay = [..._contactsList];
    } else {
      _contactsToDisplay =
          ContactsManager.searchContacts(event.text, _contactsList);
    }
    _emitLoadedState(emit);
  }

  Future<void> _checkPermission(
      _CheckPermission event, Emitter<ConfigureContactsState> emit) async {
    if (await Permission.contacts.status == PermissionStatus.granted) {
      add(const ConfigureContactsEvent.initial());
    }
  }

  Future<void> _selectContact(
      _SelectContact event, Emitter<ConfigureContactsState> emit) async {
    emit(const ConfigureContactsState.loadInProgress());
    if (_selectedContacts.any((e) => e.id == event.contact.id)) {
      _selectedContacts.removeWhere((e) => e.id == event.contact.id);
    } else {
      _selectedContacts.add(event.contact);
    }

    _emitLoadedState(emit);
  }

  Future<void> _assignContacts(
      _AssignContacts event, Emitter<ConfigureContactsState> emit) async {
    emit(const ConfigureContactsState.loadInProgress());
    contactsRepository.setUpdateContacts(
      currentUserId: FirebaseAuth.instance.currentUser!.uid,
      sharedContacts: _selectedContacts,
    );
    emit(const ConfigureContactsState.assignedContacts());
  }

  void _emitLoadedState(Emitter<ConfigureContactsState> emit) {
    emit(ConfigureContactsState.loaded(
      categorizedContacts:
          ContactsManager.categorizeContacts(_contactsToDisplay),
      isPermissionDenied: _isPermissionDenied,
      selectedContacts: _selectedContacts,
    ));
  }
}
