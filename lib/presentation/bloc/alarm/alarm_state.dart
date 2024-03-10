part of 'alarm_bloc.dart';

@freezed
class AlarmState with _$AlarmState {
  const factory AlarmState.loaded({required bool isAlarmPlaying}) = _Loaded;
}
