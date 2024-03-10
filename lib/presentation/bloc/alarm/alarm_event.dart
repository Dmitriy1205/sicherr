part of 'alarm_bloc.dart';

@freezed
class AlarmEvent with _$AlarmEvent {
    const factory AlarmEvent.playAlarm() = _PlayAlarm;
    const factory AlarmEvent.stopAlarm() = _StopAlarm;
    const factory AlarmEvent.playerChangedState() = _PlayerChangedState;
}