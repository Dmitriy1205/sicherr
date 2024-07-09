import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_polygone.freezed.dart';
part 'tracking_polygone.g.dart';

@freezed
class TrackingPolygone with _$TrackingPolygone {
  const factory TrackingPolygone({
    required double lat,
    required double long
  }) = _TrackingPolygone;

  factory TrackingPolygone.fromJson(Map<String, Object?> json)
  => _$TrackingPolygoneFromJson(json);
}