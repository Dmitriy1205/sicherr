import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/presentation/bloc/auth/auth_bloc.dart';
import 'package:telephony/telephony.dart';

import '../../../data/remote/client.dart';

part 'send_sos_event.dart';

part 'send_sos_state.dart';

part 'send_sos_bloc.freezed.dart';

class SendSosBloc extends Bloc<SendSosEvent, SendSosState> {
  final AuthBloc _authBloc;
  final HttpClient _httpClient;
  final Telephony _telephony;

  SendSosBloc({required HttpClient httpClient, required Telephony telephony, required AuthBloc authBloc})
      : _httpClient = httpClient,
        _authBloc = authBloc,
        _telephony = telephony,
        super(const SendSosState.initial()) {
    on<SendSosEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
          SendSosEvent event, Emitter<SendSosState> emit) async =>
      event.map(
          sendSOS: (e) => _sendSos(e, emit),
          openDialog: (e) => _openDialog(e, emit),
          closeDialog: (e) => _closeDialog(e, emit));

  Future<void> _openDialog(
      _OpenDialog event, Emitter<SendSosState> emit) async {
    emit(const SendSosState.dialogOpened());
  }

  Future<void> _closeDialog(
      _CloseDialog event, Emitter<SendSosState> emit) async {
    emit(const SendSosState.initial());
  }

  Future<void> _sendSos(_SendSOS event, Emitter<SendSosState> emit) async {
    try {
      emit(const SendSosState.loading());
      final token = await _authBloc.state.user!.getIdToken();

      final smsMessage = event.message +
          ((event.lat != null && event.long != null)
              ? "\nhttps://www.google.com/maps?q=${event.lat},${event.long}&z=15"
              : "");
      for(var phone in event.emContactPhone){
        await _telephony.sendSms(to: phone, message: smsMessage);
      }
      await _httpClient.sendSos(
          idToken: token!,
          message: event.message,
          currentUserPhone: event.currentUserPhone,
          emContactPhones: event.emContactPhone,
          lat: event.lat,
          long: event.long);
      emit(const SendSosState.success());
    } on BadRequestException catch (e) {
      emit(SendSosState.error(message: e.message, code: e.code));
    }
  }
}
