part of 'timer_bloc.dart';

@freezed
class TimerState with _$TimerState {
  const TimerState._();

  int get seconds => maybeMap(
      pickedTime: (state) => state.seconds,
      timerStarted: (state) => state.seconds,
      ticking: (state) => state.seconds,
      orElse: () => 0);

  bool get started => maybeMap(timerStarted: (_) => true, ticking: (_) => true, orElse: () => false);

  const factory TimerState.initial() = _InitialState;

  const factory TimerState.pickedTime(int seconds) = _PickedTimeState;

  const factory TimerState.timerStarted(int seconds) = _TimerStartedState;

  const factory TimerState.ticking(
      {required DateTime targetSeconds,
      required int seconds,
      required int setSeconds}) = _TickingState;

  const factory TimerState.timerEnded(bool sendSOS) = _TimerEndedState;
}
