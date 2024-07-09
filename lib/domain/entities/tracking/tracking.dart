import 'package:freezed_annotation/freezed_annotation.dart';

import '../tracking_polygone/tracking_polygone.dart';

part 'tracking.freezed.dart';
part 'tracking.g.dart';

@freezed
class Tracking with _$Tracking {
  const Tracking._();

  bool get isNavigationType => polygones.isNotEmpty;

  const factory Tracking({
    required String userId,
    required String userName,
    required double lat,
    required double long,
    required String? photoURL,
    @Default([]) List<TrackingPolygone> polygones,
    @Default(false) bool isSosSignal
  }) = _Tracking;

  factory Tracking.fromJson(Map<String, Object?> json)
  => _$TrackingFromJson(json);
}