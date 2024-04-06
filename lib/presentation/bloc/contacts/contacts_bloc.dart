import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository.dart';

import '../profile/profile_bloc.dart';

part 'contacts_state.dart';

part 'contacts_event.dart';

part 'contacts_bloc.freezed.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {

  final ProfileBloc _profileBloc;
  final ContactsInterface contactsManager;
  late StreamSubscription _contactStreamSubscription;

  ContactsBloc(
      {required this.contactsManager, required ProfileBloc profileBloc})
      : _profileBloc = profileBloc,
        super(const ContactsState.loadInProgress()) {
    on<ContactsEvent>(_mapEventToState);
    _contactStreamSubscription = _profileBloc.stream.listen((event) {
      event.maybeMap(
          loaded: (_) => add(const ContactsEvent.initial()), orElse: () {});
    });
  }


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


  PermissionStatus _permissionStatus = PermissionStatus.denied;

  bool get _isPermissionDenied =>
      _permissionStatus == PermissionStatus.denied ||
      _permissionStatus == PermissionStatus.permanentlyDenied;


  void _mapEventToState(ContactsEvent event, Emitter<ContactsState> emit) =>
      event.map(
        searchContact: (e) => _searchContact(e, emit),
        loadContacts: (e) => _loadContacts(e, emit),
      );


  Future<void> _initialEvent(
      _InitialEvent event, Emitter<ContactsState> emit) async {
    _contactsList = await contactsManager.getContacts();
    final contactsToDisplay = [..._contactsList];
    _permissionStatus = await Permission.contacts.status;

    emit(ContactsState.loaded(
      categorizedContacts:
          ContactsManager.categorizeContacts(contactsToDisplay),
      isPermissionDenied: _isPermissionDenied,
    ));
  }



  Future<void> _searchContact(
      _SearchContact event, Emitter<ContactsState> emit) async {
    List<ContactEntity> filteredContacts = [];

    if (event.text.isEmpty) {
      filteredContacts = [..._contactsList];
    } else {

      filteredContacts = _contactsList.where((contact) {
        final name = contact.name.toLowerCase().replaceAll(RegExp(r'\s'), '');
        final phone = PhoneFormatter.formatPhone(contact.getMainPhoneNumber);
        final input = event.text.toLowerCase().replaceAll(RegExp(r'\s'), '');

        return name.contains(input) || phone.contains(input);
      }).toList();
    }
    emit(ContactsState.loaded(
      categorizedContacts: ContactsManager.categorizeContacts(filteredContacts),
      isPermissionDenied: _isPermissionDenied,

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

  @override
  Future<void> close() async {
    _contactStreamSubscription.cancel();
    super.close();
  }
}
