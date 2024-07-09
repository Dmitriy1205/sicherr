part of 'tracking_cubit.dart';

@freezed
class TrackingState with _$TrackingState {
  const factory TrackingState.initial() = _Initial;
  const factory TrackingState.loaded({required List<Tracking> tracking}) = _Loaded;
}
