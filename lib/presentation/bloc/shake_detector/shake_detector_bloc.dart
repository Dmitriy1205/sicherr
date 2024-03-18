import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';

part 'shake_detector_event.dart';

part 'shake_detector_state.dart';

part 'shake_detector_bloc.freezed.dart';

class ShakeDetectorBloc extends Bloc<ShakeDetectorEvent, ShakeDetectorState> {
  final ProfileBloc _profileBloc;

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  ShakeDetectorBloc({required ProfileBloc profileBloc})
      : _profileBloc = profileBloc,
        super(const ShakeDetectorState.initial()) {
    on<ShakeDetectorEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
          ShakeDetectorEvent event, Emitter<ShakeDetectorState> emit) async =>
      event.map(
          startDetection: (e) => _startDetection(e, emit),
          stopDetection: (e) => _stopDetection(e, emit),
          resetDetection: (e) => emit(const ShakeDetectorState.initial()));

  Future<void> _startDetection(
      _StartDetection event, Emitter<ShakeDetectorState> emit) async {
    emit(const ShakeDetectorState.success());
  }

  Future<void> _stopDetection(
      _StopDetection event, Emitter<ShakeDetectorState> emit) async {
    _accelerometerSubscription!.cancel();
    emit(const ShakeDetectorState.initial());
  }

  @override
  Future<void> close() {
    _accelerometerSubscription!.cancel();
    return super.close();
  }
}
