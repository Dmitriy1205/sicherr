import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/presentation/bloc/auth/auth_bloc.dart';

import '../../../data/remote/client.dart';

part 'send_sos_event.dart';

part 'send_sos_state.dart';

part 'send_sos_bloc.freezed.dart';

class SendSosBloc extends Bloc<SendSosEvent, SendSosState> {
  final AuthBloc _authBloc;
  final HttpClient _httpClient;

  SendSosBloc({required HttpClient httpClient, required AuthBloc authBloc})
      : _httpClient = httpClient,
        _authBloc = authBloc,
        super(const SendSosState.initial()) {
    on<SendSosEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
          SendSosEvent event, Emitter<SendSosState> emit) async =>
      event.map(
        sendSOS: (e) => _sendSos(e, emit),
        openDialog: (e) => _openDialog(e, emit),
        closeDialog: (e) => _closeDialog(e, emit)
      );

  Future<void> _openDialog(_OpenDialog event, Emitter<SendSosState> emit) async{
    emit(const SendSosState.dialogOpened());
  }

  Future<void> _closeDialog(_CloseDialog event, Emitter<SendSosState> emit) async{
    emit(const SendSosState.initial());
  }

  Future<void> _sendSos(_SendSOS event, Emitter<SendSosState> emit) async {
    try {
      emit(const SendSosState.loading());
      final token = await _authBloc.state.user!.getIdToken();

      await _httpClient.sendSos(
          idToken: token!,
          message: event.message,
          currentUserPhone: event.currentUserPhone,
          emContactPhones: event.emContactPhone, lat: event.lat, long: event.long);
      emit(const SendSosState.success());
    } on BadRequestException catch (e) {
      emit(SendSosState.error(message: e.message, code: e.code));
    }
  }

}
