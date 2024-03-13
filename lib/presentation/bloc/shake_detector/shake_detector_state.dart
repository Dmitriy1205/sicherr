part of 'shake_detector_bloc.dart';

@freezed
class ShakeDetectorState with _$ShakeDetectorState {
  const factory ShakeDetectorState.initial() = _Initial;
  const factory ShakeDetectorState.success() = _Success;
}
