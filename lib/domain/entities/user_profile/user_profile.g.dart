// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      enabledSosQB: json['enabledSosQB'] as bool,
      sosMessage: json['sosMessage'] as String,
      sendSosGeolocation: json['sendSosGeolocation'] as bool,
      alarmToneQB: json['alarmToneQB'] as bool,
      id: json['id'] as String,
      phone: json['phone'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'enabledSosQB': instance.enabledSosQB,
      'sosMessage': instance.sosMessage,
      'sendSosGeolocation': instance.sendSosGeolocation,
      'alarmToneQB': instance.alarmToneQB,
      'id': instance.id,
      'phone': instance.phone,
      'createdAt': instance.createdAt,
    };
