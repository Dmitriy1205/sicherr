import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository.dart';

import '../../../domain/repositories/identification_contacts/id_contacts_repository.dart';

part 'contact_identification_event.dart';

part 'contact_identification_state.dart';

part 'contact_identification_bloc.freezed.dart';

class ContactIdentificationBloc
    extends Bloc<ContactIdentificationEvent, ContactIdentificationState> {
  final CallerIdRepository _callerIdRepository;
  final ContactsRepository _contactsRepository;

  ContactIdentificationBloc(
      {required CallerIdRepository callerIdRepository,
      required ContactsRepository contactsRepository})
      : _callerIdRepository = callerIdRepository,
        _contactsRepository = contactsRepository,
        super(const ContactIdentificationState.initial()) {
    on<ContactIdentificationEvent>(_mapToState);
  }

  Future<void> _mapToState(ContactIdentificationEvent event,
          Emitter<ContactIdentificationState> emit) async =>
      event.map(identifyContacts: (e) => _identifyContacts(e, emit));

  Future<void> _identifyContacts(
      _IdentifyContacts event, Emitter<ContactIdentificationState> emit) async {
    try {
      final sharedContacts = await _contactsRepository.getAllSharedContacts();
      await _callerIdRepository.updateIdentifiedContacts(
          sharedContacts: sharedContacts);
      emit(const ContactIdentificationState.loaded());
    } on BadRequestException catch (e) {
      emit(ContactIdentificationState.error(error: e.toString()));
    }
  }
}
