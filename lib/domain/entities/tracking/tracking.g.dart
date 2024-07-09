// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackingImpl _$$TrackingImplFromJson(Map<String, dynamic> json) =>
    _$TrackingImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      photoURL: json['photoURL'] as String?,
      polygones: (json['polygones'] as List<dynamic>?)
              ?.map((e) => TrackingPolygone.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isSosSignal: json['isSosSignal'] as bool? ?? false,
    );

Map<String, dynamic> _$$TrackingImplToJson(_$TrackingImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'lat': instance.lat,
      'long': instance.long,
      'photoURL': instance.photoURL,
      'polygones': instance.polygones.map((e) => e.toJson()).toList(),
      'isSosSignal': instance.isSosSignal,
    };
