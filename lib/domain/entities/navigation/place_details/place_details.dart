import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'place_details.freezed.dart';

part 'place_details.g.dart';

@freezed
abstract class AppPlaceDetails with _$AppPlaceDetails {
  const factory AppPlaceDetails({
    required String address,
    @LatLngConverter() required LatLng latlng,
  }) = _AppPlaceDetails;

  factory AppPlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$AppPlaceDetailsFromJson(json);
}

class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();

  @override
  LatLng fromJson(Map<String, dynamic> json) {
    return LatLng(json['latitude'] as double, json['longitude'] as double);
  }

  @override
  Map<String, dynamic> toJson(LatLng latlng) => {
        'latitude': latlng.latitude,
        'longitude': latlng.longitude,
      };
}
