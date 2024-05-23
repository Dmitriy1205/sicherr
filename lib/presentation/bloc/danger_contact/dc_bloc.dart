import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/contact_entity/contact_entity.dart';
import '../../../domain/repositories/dangerous_contacs/dc_repository.dart';
import '../auth/auth_bloc.dart';

part 'dc_event.dart';

part 'dc_state.dart';

part 'dc_bloc.freezed.dart';

class DcBloc extends Bloc<DcEvent, DcState> {
  final DCRepository _dcRepository;
  final AuthBloc _authBloc;

  DcBloc({
    required DCRepository dcRepository,
    required AuthBloc authBloc,
  })  : _dcRepository = dcRepository,
        _authBloc = authBloc,
        super(const DcState.initial()) {
    on<DcEvent>(_mapToState);
  }

  Future<void> _mapToState(DcEvent event, Emitter<DcState> emit) async =>
      event.map(
        getAllDC: (e) => _getAllDC(e, emit),
        addToDC: (e) => _addToDC(e, emit),
        removeFromDC: (e) => _removeFromDC(e, emit),
      );

  Future<void> _getAllDC(_GetAllDC event, Emitter<DcState> emit) async {
    emit(const DcState.loading());
    final dangerousContacts =
        await _dcRepository.getDCList(currentUserId: _authBloc.state.user!.uid);
    emit(DcState.loaded(dc: dangerousContacts!));
  }

  Future<void> _addToDC(_AddToDC event, Emitter<DcState> emit) async {
    emit(const DcState.loading());
    await _dcRepository.addToDC(
        currentUserId: _authBloc.state.user!.uid, dc: event.dangerContact);

    final dangerousContacts =
        await _dcRepository.getDCList(currentUserId: _authBloc.state.user!.uid);
    emit(DcState.loaded(dc: dangerousContacts!));
  }

  Future<void> _removeFromDC(_RemoveFromDC event, Emitter<DcState> emit) async {
    emit(const DcState.loading());
    await _dcRepository.deleteFromDC(
        currentUserId: _authBloc.state.user!.uid, dctId: event.dcId);
    final dangerousContacts =
        await _dcRepository.getDCList(currentUserId: _authBloc.state.user!.uid);
    emit(DcState.loaded(dc: dangerousContacts!));
  }
}
