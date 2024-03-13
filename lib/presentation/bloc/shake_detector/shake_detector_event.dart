part of 'shake_detector_bloc.dart';

@freezed
class ShakeDetectorEvent with _$ShakeDetectorEvent {
  const factory ShakeDetectorEvent.startDetection() = _StartDetection;
  const factory ShakeDetectorEvent.resetDetection() = _ResetDetection;
  const factory ShakeDetectorEvent.stopDetection() = _StopDetection;
}
