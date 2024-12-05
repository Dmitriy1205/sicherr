import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';

import '../../../domain/entities/contact_entity/contact_entity.dart';
import '../../../domain/repositories/shared_contacts/sc_repository.dart';
import '../auth/auth_bloc.dart';

part 'sc_event.dart';

part 'sc_state.dart';

part 'sc_bloc.freezed.dart';

class ScBloc extends Bloc<ScEvent, ScState> {
  final SCRepository _scRepository;
  final AuthBloc _authBloc;

  ScBloc({
    required SCRepository scRepository,
    required AuthBloc authBloc,
  })  : _scRepository = scRepository,
        _authBloc = authBloc,
        super(const ScState.initial()) {
    on<ScEvent>(_mapToState);
  }

  Future<void> _mapToState(ScEvent event, Emitter<ScState> emit) async =>
      event.map(
        getAllSC: (e) => _getAllSC(e, emit),
        addTag: (e) => _addTag(e, emit),
        addRemoveRating: (e) => _addRemoveRating(e, emit),
      );

  Future<void> _getAllSC(_GetAllSC event, Emitter<ScState> emit) async {
    try {
      emit(const ScState.loading());
      final sharedContacts = await _scRepository.getSCList();
      emit(ScState.loaded(sc: sharedContacts!));
    } on BadRequestException catch (e) {
      emit(ScState.error(error: e.message));
    }
  }

  Future<void> _addTag(_AddTag event, Emitter<ScState> emit) async {
    try {
      emit(const ScState.loading());
      await _scRepository.addTag(
          contactId: event.contactId, tagName: event.taName);
      final sharedContacts = await _scRepository.getSCList();
      emit(ScState.loaded(sc: sharedContacts!));
    } on BadRequestException catch (e) {
      emit(ScState.error(error: e.message));
    }
  }

  Future<void> _addRemoveRating(
      _AddRemoveRating event, Emitter<ScState> emit) async {
    try {
      await _scRepository.rateContact(
          contactId: event.contactId,
          rate: event.rate,
          currentUserPhoneNumber: _authBloc.state.user!.phoneNumber!);
      final sharedContacts = await _scRepository.getSCList();
      emit(ScState.loaded(sc: sharedContacts!));
    } on BadRequestException catch (e) {
      emit(ScState.error(error: e.message));
    }
  }
}
