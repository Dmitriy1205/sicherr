// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_codes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryCodesImpl _$$CountryCodesImplFromJson(Map<String, dynamic> json) =>
    _$CountryCodesImpl(
      code: json['code'] as String,
      label: json['label'] as String,
      phone: json['phone'] as String,
      phoneLength: json['phoneLength'] as int,
    );

Map<String, dynamic> _$$CountryCodesImplToJson(_$CountryCodesImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'phone': instance.phone,
      'phoneLength': instance.phoneLength,
    };
