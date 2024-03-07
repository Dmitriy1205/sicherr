import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/domain/entities/emergency_contact/emergency_contact.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/repositories/emeregency_contacts/em_contacts_repository.dart';
import '../auth/auth_bloc.dart';

part 'emergency_contact_event.dart';

part 'emergency_contact_state.dart';

part 'emergency_contact_bloc.freezed.dart';

class EmergencyContactBloc
    extends Bloc<EmergencyContactEvent, EmergencyContactState> {
  final EmContactsRepository _emContactsRepository;
  final AuthBloc _authBloc;

  late StreamSubscription _emStreamSubscription;

  EmergencyContactBloc({
    required EmContactsRepository emContactsRepository,
    required AuthBloc authBloc,
  })  : _emContactsRepository = emContactsRepository,
        _authBloc = authBloc,
        super(const EmergencyContactState.initial()) {
    on<EmergencyContactEvent>(_mapToState);
  }

  Future<void> _mapToState(EmergencyContactEvent event,
          Emitter<EmergencyContactState> emit) async =>
      event.map(
          getAllEmContacts: (e) => _getAllEmContacts(e, emit),
          addToEmContact: (e) => _addToEmContact(e, emit),
          deleteFromEmContact: (e) => _deleteFromEmContact(e, emit),
          loadEmContacts: (e) =>
              emit(EmergencyContactState.loaded(emContacts: e.emContacts)),
          catchError: (e) =>
              emit(EmergencyContactState.error(error: e.error.toString())));

  Future<void> _getAllEmContacts(
      _GetAllEmContacts event, Emitter<EmergencyContactState> emit) async {
    try {
      _emStreamSubscription = _emContactsRepository
          .getEmContactList(currentUserId: _authBloc.state.user!.uid)
          .listen((emContacts) {
        if (emContacts == null) {
          add(const EmergencyContactEvent.loadEmContacts(emContacts: []));
        } else {
          add(EmergencyContactEvent.loadEmContacts(emContacts: emContacts));
        }
      }, onError: (error) {
        add(EmergencyContactEvent.catchError(error: error));
      });
    } on BadRequestException catch (e) {
      emit(EmergencyContactState.error(error: e.message));
    }
  }

  Future<void> _addToEmContact(
      _AddToEmContact event, Emitter<EmergencyContactState> emit) async {
    try {
      await _emContactsRepository.setEmContact(
          currentUserId: _authBloc.state.user!.uid, emContact: event.emContact);

      _emStreamSubscription = _emContactsRepository
          .getEmContactList(currentUserId: _authBloc.state.user!.uid)
          .listen((emContacts) {
        if (emContacts == null) {
          add(const EmergencyContactEvent.loadEmContacts(emContacts: []));
        } else {
          add(EmergencyContactEvent.loadEmContacts(emContacts: emContacts));
        }
      }, onError: (error) {
        add(EmergencyContactEvent.catchError(error: error));
      });
    } on BadRequestException catch (e) {
      emit(EmergencyContactState.error(error: e.message));
    }
  }

  Future<void> _deleteFromEmContact(
      _DeleteFromEmContact event, Emitter<EmergencyContactState> emit) async {
    try {
      await _emContactsRepository.deleteEmContact(
          currentUserId: _authBloc.state.user!.uid,
          emContactId: event.contactId);

      _emStreamSubscription = _emContactsRepository
          .getEmContactList(currentUserId: _authBloc.state.user!.uid)
          .listen((emContacts) {
        if (emContacts == null) {
          add(const EmergencyContactEvent.loadEmContacts(emContacts: []));
        } else {
          add(EmergencyContactEvent.loadEmContacts(emContacts: emContacts));
        }
      }, onError: (error) {
        add(EmergencyContactEvent.catchError(error: error));
      });
    } on BadRequestException catch (e) {
      emit(EmergencyContactState.error(error: e.message));
    }
  }

  @override
  Future<void> close() {
    _emStreamSubscription.cancel();
    return super.close();
  }
}
