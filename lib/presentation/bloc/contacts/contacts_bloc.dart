import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/core/utils/phone_formatter.dart';
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

  PermissionStatus _permissionStatus = PermissionStatus.denied;
  bool get _isPermissionDenied =>
      _permissionStatus == PermissionStatus.denied ||
      _permissionStatus == PermissionStatus.permanentlyDenied;

  void _mapEventToState(ContactsEvent event, Emitter<ContactsState> emit) =>
      event.map(
        initial: (e) => _initialEvent(e, emit),
        searchContact: (e) => _searchContact(e, emit),
        checkPermission: (e) => _checkPermission(e, emit),
      );

  Future<void> _initialEvent(
      _InitialEvent event, Emitter<ContactsState> emit) async {
    _contactsList = await contactsManager.getContacts();
    _contactsToDisplay = [..._contactsList];
    _permissionStatus = await Permission.contacts.status;

    emit(ContactsState.loaded(
      categorizedContacts:
          ContactsManager.categorizeContacts(_contactsToDisplay),
      isPermissionDenied: _isPermissionDenied,
    ));
  }

  void _searchContact(_SearchContact event, Emitter<ContactsState> emit) {
    emit(const ContactsState.loadInProgress());
    if (event.text.isEmpty) {
      _contactsToDisplay = [..._contactsList];
    } else {
      _contactsToDisplay = _contactsList.where((contact) {
        final name = contact.name.toLowerCase().replaceAll(RegExp(r'\s'), '');
        final phone = PhoneFormatter.formatPhone(contact.getMainPhoneNumber);
        final input = event.text.toLowerCase().replaceAll(RegExp(r'\s'), '');

        return name.contains(input) || phone.contains(input);
      }).toList();
    }
    emit(ContactsState.loaded(
      categorizedContacts:
          ContactsManager.categorizeContacts(_contactsToDisplay),
      isPermissionDenied: _isPermissionDenied,
    ));
  }

  Future<void> _checkPermission(
      _CheckPermission event, Emitter<ContactsState> emit) async {
    if (await Permission.contacts.status == PermissionStatus.granted) {
      add(const ContactsEvent.initial());
    }
  }
}
