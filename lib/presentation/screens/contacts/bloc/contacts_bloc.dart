import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/managers/contacts_manager.dart';

part 'contacts_state.dart';
part 'contacts_event.dart';
part 'contacts_bloc.freezed.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(this.contactsManager)
      : super(const ContactsState.loadInProgress()) {
    on<ContactsEvent>(_mapEventToState);
    add(const ContactsEvent.initial());
  }

  List<ContactEntity> _contactsList = [];
  List<ContactEntity> _contactsToDisplay = [];

  final ContactsInterface contactsManager;
  bool _isPermissionDenied = true;

  void _mapEventToState(ContactsEvent event, Emitter<ContactsState> emit) =>
      event.map(
        initial: (e) => _initialEvent(e, emit),
        searchByPhone: (e) => _searchByPhone(e, emit),
      );

  Future<void> _initialEvent(
      _InitialEvent event, Emitter<ContactsState> emit) async {
    _contactsList = await contactsManager.getContacts();
    _contactsToDisplay = [..._contactsList];
    _isPermissionDenied = await Permission.contacts.status.isPermanentlyDenied;

    emit(ContactsState.loaded(
      categorizedContacts:
          ContactsManager.categorizeContacts(_contactsToDisplay),
      isPermissionDenied: _isPermissionDenied,
    ));
  }

  void _searchByPhone(_SearchByPhone event, Emitter<ContactsState> emit) {
    emit(const ContactsState.loadInProgress());
    if (event.phoneNumber.isEmpty) {
      _contactsToDisplay = [..._contactsList];
    } else {
      _contactsToDisplay = _contactsList
          .where((contact) => contact.phoneNumber.contains(event.phoneNumber))
          .toList();
    }
    emit(ContactsState.loaded(
      categorizedContacts:
          ContactsManager.categorizeContacts(_contactsToDisplay),
      isPermissionDenied: _isPermissionDenied,
    ));
  }
}
