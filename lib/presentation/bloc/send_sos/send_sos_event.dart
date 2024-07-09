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

  const factory SendSosEvent.stopStreaming() = _StopStreaming;

  const factory SendSosEvent.pushTracking(
      {required Tracking tracking}) = _PushTracking;
  const factory SendSosEvent.triggerQuickBinding() = _TriggerQuickBinding;
}
