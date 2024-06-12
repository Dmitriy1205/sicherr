// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteDetailsImpl _$$RouteDetailsImplFromJson(Map<String, dynamic> json) =>
    _$RouteDetailsImpl(
      route: (json['route'] as List<dynamic>)
          .map((e) =>
              const LatLngConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      distance: (json['distance'] as num).toDouble(),
      radius: json['radius'] as int,
      etaContacts: (json['etaContacts'] as List<dynamic>)
          .map((e) => ContactEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RouteDetailsImplToJson(_$RouteDetailsImpl instance) =>
    <String, dynamic>{
      'route': instance.route.map(const LatLngConverter().toJson).toList(),
      'distance': instance.distance,
      'radius': instance.radius,
      'etaContacts': instance.etaContacts,
    };
