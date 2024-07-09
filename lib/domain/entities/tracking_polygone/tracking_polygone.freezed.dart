// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_polygone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrackingPolygone _$TrackingPolygoneFromJson(Map<String, dynamic> json) {
  return _TrackingPolygone.fromJson(json);
}

/// @nodoc
mixin _$TrackingPolygone {
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackingPolygoneCopyWith<TrackingPolygone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingPolygoneCopyWith<$Res> {
  factory $TrackingPolygoneCopyWith(
          TrackingPolygone value, $Res Function(TrackingPolygone) then) =
      _$TrackingPolygoneCopyWithImpl<$Res, TrackingPolygone>;
  @useResult
  $Res call({double lat, double long});
}

/// @nodoc
class _$TrackingPolygoneCopyWithImpl<$Res, $Val extends TrackingPolygone>
    implements $TrackingPolygoneCopyWith<$Res> {
  _$TrackingPolygoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackingPolygoneImplCopyWith<$Res>
    implements $TrackingPolygoneCopyWith<$Res> {
  factory _$$TrackingPolygoneImplCopyWith(_$TrackingPolygoneImpl value,
          $Res Function(_$TrackingPolygoneImpl) then) =
      __$$TrackingPolygoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double long});
}

/// @nodoc
class __$$TrackingPolygoneImplCopyWithImpl<$Res>
    extends _$TrackingPolygoneCopyWithImpl<$Res, _$TrackingPolygoneImpl>
    implements _$$TrackingPolygoneImplCopyWith<$Res> {
  __$$TrackingPolygoneImplCopyWithImpl(_$TrackingPolygoneImpl _value,
      $Res Function(_$TrackingPolygoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_$TrackingPolygoneImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingPolygoneImpl implements _TrackingPolygone {
  const _$TrackingPolygoneImpl({required this.lat, required this.long});

  factory _$TrackingPolygoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingPolygoneImplFromJson(json);

  @override
  final double lat;
  @override
  final double long;

  @override
  String toString() {
    return 'TrackingPolygone(lat: $lat, long: $long)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingPolygoneImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, long);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingPolygoneImplCopyWith<_$TrackingPolygoneImpl> get copyWith =>
      __$$TrackingPolygoneImplCopyWithImpl<_$TrackingPolygoneImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingPolygoneImplToJson(
      this,
    );
  }
}

abstract class _TrackingPolygone implements TrackingPolygone {
  const factory _TrackingPolygone(
      {required final double lat,
      required final double long}) = _$TrackingPolygoneImpl;

  factory _TrackingPolygone.fromJson(Map<String, dynamic> json) =
      _$TrackingPolygoneImpl.fromJson;

  @override
  double get lat;
  @override
  double get long;
  @override
  @JsonKey(ignore: true)
  _$$TrackingPolygoneImplCopyWith<_$TrackingPolygoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
