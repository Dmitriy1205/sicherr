import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/managers/alarm_manager.dart';

part 'alarm_state.dart';
part 'alarm_event.dart';
part 'alarm_bloc.freezed.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  final SimplePlayer player;
  AlarmBloc({required this.player})
      : super(const AlarmState.loaded(isAlarmPlaying: false)) {
    on(_mapEventToState);
    player.isPlayingChangeStream.listen((isPlaying) {
      if (_isPlaying != isPlaying) {
        _isPlaying = isPlaying;
        add(const AlarmEvent.playerChangedState());
      }
    });
  }

  bool _isPlaying = false;

  void _mapEventToState(AlarmEvent event, Emitter<AlarmState> emit) =>
      event.map(
        playAlarm: (e) => _playAlarm(e, emit),
        stopAlarm: (e) => _stopAlarm(e, emit),
        playerChangedState: (e) =>
            emit(AlarmState.loaded(isAlarmPlaying: _isPlaying)),
      );

  Future<void> _playAlarm(_PlayAlarm event, Emitter<AlarmState> emit) async {
    await player.play();
  }

  Future<void> _stopAlarm(_StopAlarm event, Emitter<AlarmState> emit) async {
    await player.stop();
  }
}
