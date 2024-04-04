import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';

part 'contacts_state.dart';
part 'contacts_event.dart';
part 'contacts_bloc.freezed.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(const ContactsState.loadInProgress()) {
    on<ContactsEvent>(_mapEventToState);
    add(const ContactsEvent.initial());
  }

  List<ContactEntity> _contactsList = [];
  List<ContactEntity> _contactsToDisplay = [];

  void _mapEventToState(ContactsEvent event, Emitter<ContactsState> emit) =>
      event.map(
        initial: (e) => _initialEvent(e, emit),
        searchContact: (e) => _searchContact(e, emit),
      );

  Future<void> _initialEvent(
      _InitialEvent event, Emitter<ContactsState> emit) async {
    _contactsList = [];
    _contactsToDisplay = [..._contactsList];

    emit(ContactsState.loaded(
      categorizedContacts:
          ContactsManager.categorizeContacts(_contactsToDisplay),
    ));
  }

  void _searchContact(_SearchContact event, Emitter<ContactsState> emit) {
    emit(const ContactsState.loadInProgress());
    if (event.text.isEmpty) {
      _contactsToDisplay = [..._contactsList];
    } else {
      _contactsToDisplay =
          ContactsManager.searchContacts(event.text, _contactsList);
    }
    emit(ContactsState.loaded(
      categorizedContacts:
          ContactsManager.categorizeContacts(_contactsToDisplay),
    ));
  }
}
