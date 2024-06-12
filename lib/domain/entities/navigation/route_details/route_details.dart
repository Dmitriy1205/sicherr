import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../contact_entity/contact_entity.dart';

part 'route_details.freezed.dart';

part 'route_details.g.dart';

@freezed
abstract class RouteDetails with _$RouteDetails {
  const factory RouteDetails({
    @LatLngConverter() required List<LatLng> route,
    required double distance,
    required int radius,
    required List<ContactEntity> etaContacts,
  }) = _RouteDetails;

  factory RouteDetails.fromJson(Map<String, dynamic> json) =>
      _$RouteDetailsFromJson(json);
}

class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();

  @override
  LatLng fromJson(Map<String, dynamic> json) {
    return latLngFromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LatLng latLng) => latLngToJson(latLng);
}

LatLng latLngFromJson(Map<String, dynamic> json) {
  return LatLng(json['latitude'] as double, json['longitude'] as double);
}

Map<String, dynamic> latLngToJson(LatLng instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
