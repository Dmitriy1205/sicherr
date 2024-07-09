import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/domain/repositories/timer/timer_repository_contract.dart';

import '../../../data/remote/client.dart';

part 'timer_event.dart';

part 'timer_state.dart';

part 'timer_bloc.freezed.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  StreamSubscription? _streamSubscription;
  final TimerRepository _timerRepository;
  final HttpClient _httpClient;

  TimerBloc({required HttpClient httpClient, required TimerRepository timerRepository})
      : _timerRepository = timerRepository,
        _httpClient = httpClient,
        super(const TimerState.initial()) {
    on<TimerEvent>(_mapEventToState);
  }

  void _mapEventToState(TimerEvent event, Emitter<TimerState> emit) =>
      event.map(
          fetchStatus: (e) => _fetchStatus(e, emit),
          pickTime: (e) => _pickTime(e, emit),
          startTimer: (e) => _startTimer(e, emit),
          stopTimer: (e) => _stopTimer(e, emit),
          tick: (e) => _tick(e, emit));

  void _pickTime(_PickTime event, Emitter<TimerState> emit) {
    emit(TimerState.pickedTime(event.seconds));
  }

  void _fetchStatus(_FetchStatus event, Emitter<TimerState> emit) async{
    final timer = await _timerRepository.fetchTimerDate();
    if(timer == null) return;
    _streamSubscription = Stream.periodic(const Duration(seconds: 1)).listen((event) {
      add(const TimerEvent.tick());
    });
    final secondsLeft = timer.date.difference(DateTime.now()).inSeconds;
    emit(TimerState.ticking(
      targetSeconds: timer.date,
      seconds: secondsLeft,
      setSeconds: timer.seconds,));
  }

  void _startTimer(_StartTimer event, Emitter<TimerState> emit) async{
    _streamSubscription = Stream.periodic(const Duration(seconds: 1)).listen((event) {
      add(const TimerEvent.tick());
    });
    final startTime = DateTime.now();
    final targetTime = startTime.add(Duration(seconds: state.seconds));
    emit(TimerState.timerStarted(state.seconds));
    await _httpClient.startTimer(
        sosMessage: event.sosMessage,
        executionDate: targetTime,
        seconds: state.seconds,
        phones: event.emergencyPhones,
        warningTitle: event.warningTitle,
        warningMessage: event.warningMessage,
        triggerTitle: event.triggerTitle,
        triggerMessage: event.triggerMessage,
        phone: event.phone);
    emit(TimerState.ticking(
        targetSeconds: targetTime,
        seconds: state.seconds,
        setSeconds: state.seconds,));
  }

  void _tick(_Tick event, Emitter<TimerState> emit) {
    state.maybeMap(
        ticking: (state) {
          final now = DateTime.now();
          final seconds = state.targetSeconds.difference(now).inSeconds;
          if (seconds <= 0) {
            add(const TimerEvent.stopTimer(sendSOS: true));
          } else {
            emit(TimerState.ticking(
                targetSeconds: state.targetSeconds,
                seconds: seconds,
                setSeconds: state.setSeconds,
            ));
          }
        },
        orElse: () {});
  }

  void _stopTimer(_StopTimer event, Emitter<TimerState> emit) async{
    _streamSubscription?.cancel();
    await _httpClient.stopTimer();
    emit(TimerState.timerEnded(event.sendSOS));
    emit(const TimerState.initial());
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
