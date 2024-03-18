part of 'send_sos_bloc.dart';

@freezed
class SendSosEvent with _$SendSosEvent {
  const factory SendSosEvent.sendSOS({
    required String? lat,
    required String? long,
    required String message,
    required String currentUserPhone,
    required List<String> emContactPhone,
  }) = _SendSOS;

  const factory SendSosEvent.openDialog() = _OpenDialog;
  const factory SendSosEvent.closeDialog() = _CloseDialog;
  const factory SendSosEvent.triggerQuickBinding() = _TriggerQuickBinding;
}
