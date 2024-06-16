// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppPlaceDetailsImpl _$$AppPlaceDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$AppPlaceDetailsImpl(
      address: json['address'] as String,
      latlng: const LatLngConverter()
          .fromJson(json['latlng'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppPlaceDetailsImplToJson(
        _$AppPlaceDetailsImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'latlng': const LatLngConverter().toJson(instance.latlng),
    };
