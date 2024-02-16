// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactEntityImpl _$$ContactEntityImplFromJson(Map<String, dynamic> json) =>
    _$ContactEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phones:
          (json['phones'] as List<dynamic>).map((e) => e as String).toList(),
      rate: (json['rate'] as num?)?.toDouble(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$ContactEntityImplToJson(_$ContactEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phones': instance.phones,
      'rate': instance.rate,
      'tags': instance.tags,
      'image': instance.image,
    };
