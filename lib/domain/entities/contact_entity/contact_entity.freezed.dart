// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactEntity _$ContactEntityFromJson(Map<String, dynamic> json) {
  return _ContactEntity.fromJson(json);
}

/// @nodoc
mixin _$ContactEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get phones => throw _privateConstructorUsedError;
  double? get rate => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactEntityCopyWith<ContactEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactEntityCopyWith<$Res> {
  factory $ContactEntityCopyWith(
          ContactEntity value, $Res Function(ContactEntity) then) =
      _$ContactEntityCopyWithImpl<$Res, ContactEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> phones,
      double? rate,
      List<String>? tags,
      String? image});
}

/// @nodoc
class _$ContactEntityCopyWithImpl<$Res, $Val extends ContactEntity>
    implements $ContactEntityCopyWith<$Res> {
  _$ContactEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phones = null,
    Object? rate = freezed,
    Object? tags = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phones: null == phones
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactEntityImplCopyWith<$Res>
    implements $ContactEntityCopyWith<$Res> {
  factory _$$ContactEntityImplCopyWith(
          _$ContactEntityImpl value, $Res Function(_$ContactEntityImpl) then) =
      __$$ContactEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> phones,
      double? rate,
      List<String>? tags,
      String? image});
}

/// @nodoc
class __$$ContactEntityImplCopyWithImpl<$Res>
    extends _$ContactEntityCopyWithImpl<$Res, _$ContactEntityImpl>
    implements _$$ContactEntityImplCopyWith<$Res> {
  __$$ContactEntityImplCopyWithImpl(
      _$ContactEntityImpl _value, $Res Function(_$ContactEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phones = null,
    Object? rate = freezed,
    Object? tags = freezed,
    Object? image = freezed,
  }) {
    return _then(_$ContactEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phones: null == phones
          ? _value._phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactEntityImpl extends _ContactEntity {
  _$ContactEntityImpl(
      {required this.id,
      required this.name,
      required final List<String> phones,
      this.rate,
      final List<String>? tags,
      this.image})
      : _phones = phones,
        _tags = tags,
        super._();

  factory _$ContactEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _phones;
  @override
  List<String> get phones {
    if (_phones is EqualUnmodifiableListView) return _phones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phones);
  }

  @override
  final double? rate;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? image;

  @override
  String toString() {
    return 'ContactEntity(id: $id, name: $name, phones: $phones, rate: $rate, tags: $tags, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._phones, _phones) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_phones),
      rate,
      const DeepCollectionEquality().hash(_tags),
      image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactEntityImplCopyWith<_$ContactEntityImpl> get copyWith =>
      __$$ContactEntityImplCopyWithImpl<_$ContactEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactEntityImplToJson(
      this,
    );
  }
}

abstract class _ContactEntity extends ContactEntity {
  factory _ContactEntity(
      {required final String id,
      required final String name,
      required final List<String> phones,
      final double? rate,
      final List<String>? tags,
      final String? image}) = _$ContactEntityImpl;
  _ContactEntity._() : super._();

  factory _ContactEntity.fromJson(Map<String, dynamic> json) =
      _$ContactEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get phones;
  @override
  double? get rate;
  @override
  List<String>? get tags;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$ContactEntityImplCopyWith<_$ContactEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
