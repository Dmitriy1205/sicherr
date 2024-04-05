import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository.dart';

part 'contacts_state.dart';
part 'contacts_event.dart';
part 'contacts_bloc.freezed.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(this.contactsRepository)
      : super(const ContactsState.loadInProgress()) {
    on<ContactsEvent>(_mapEventToState);
    try {
      contactsRepository
          .getSharedContactsStream(
              currentUserId: FirebaseAuth.instance.currentUser!.uid)
          .listen((contacts) {
        if (contacts == null) {
          add(const ContactsEvent.loadContacts());
        } else {
          _contactsList = contacts;
          _contactsToDisplay = [..._contactsList];

          add(const ContactsEvent.loadContacts());
        }
      }, onError: (error) {});
    } on BadRequestException catch (_) {
      add(const ContactsEvent.loadContacts());
    }
  }
  final ContactsRepository contactsRepository;
  late StreamSubscription _contactsStreamSub;
  List<ContactEntity> _contactsList = [];
  List<ContactEntity> _contactsToDisplay = [];

  void _mapEventToState(ContactsEvent event, Emitter<ContactsState> emit) =>
      event.map(
        searchContact: (e) => _searchContact(e, emit),
        loadContacts: (e) => _loadContacts(e, emit),
      );


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

  void _loadContacts(_LoadContacts event, Emitter<ContactsState> emit) {
    emit(ContactsState.loaded(
      categorizedContacts:
          ContactsManager.categorizeContacts(_contactsToDisplay),
    ));
  }

  @override
  Future<void> close() {
    _contactsStreamSub.cancel();
    return super.close();
  }
}
