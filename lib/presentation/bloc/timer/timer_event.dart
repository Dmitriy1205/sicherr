part of 'timer_bloc.dart';

@freezed
class TimerEvent with _$TimerEvent {
  const factory TimerEvent.pickTime(int seconds) = _PickTime;

  const factory TimerEvent.startTimer(
      {required List<String> emergencyPhones,
      required String warningTitle,
      required String warningMessage,
      required String triggerTitle,
      required String triggerMessage,
        required String sosMessage,
      required String phone}) = _StartTimer;

  const factory TimerEvent.fetchStatus() = _FetchStatus;

  const factory TimerEvent.tick() = _Tick;

  const factory TimerEvent.stopTimer({required bool sendSOS}) = _StopTimer;
}
