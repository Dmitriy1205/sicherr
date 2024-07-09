// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tracking _$TrackingFromJson(Map<String, dynamic> json) {
  return _Tracking.fromJson(json);
}

/// @nodoc
mixin _$Tracking {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  List<TrackingPolygone> get polygones => throw _privateConstructorUsedError;
  bool get isSosSignal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackingCopyWith<Tracking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingCopyWith<$Res> {
  factory $TrackingCopyWith(Tracking value, $Res Function(Tracking) then) =
      _$TrackingCopyWithImpl<$Res, Tracking>;
  @useResult
  $Res call(
      {String userId,
      String userName,
      double lat,
      double long,
      String? photoURL,
      List<TrackingPolygone> polygones,
      bool isSosSignal});
}

/// @nodoc
class _$TrackingCopyWithImpl<$Res, $Val extends Tracking>
    implements $TrackingCopyWith<$Res> {
  _$TrackingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? lat = null,
    Object? long = null,
    Object? photoURL = freezed,
    Object? polygones = null,
    Object? isSosSignal = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      polygones: null == polygones
          ? _value.polygones
          : polygones // ignore: cast_nullable_to_non_nullable
              as List<TrackingPolygone>,
      isSosSignal: null == isSosSignal
          ? _value.isSosSignal
          : isSosSignal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackingImplCopyWith<$Res>
    implements $TrackingCopyWith<$Res> {
  factory _$$TrackingImplCopyWith(
          _$TrackingImpl value, $Res Function(_$TrackingImpl) then) =
      __$$TrackingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      double lat,
      double long,
      String? photoURL,
      List<TrackingPolygone> polygones,
      bool isSosSignal});
}

/// @nodoc
class __$$TrackingImplCopyWithImpl<$Res>
    extends _$TrackingCopyWithImpl<$Res, _$TrackingImpl>
    implements _$$TrackingImplCopyWith<$Res> {
  __$$TrackingImplCopyWithImpl(
      _$TrackingImpl _value, $Res Function(_$TrackingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? lat = null,
    Object? long = null,
    Object? photoURL = freezed,
    Object? polygones = null,
    Object? isSosSignal = null,
  }) {
    return _then(_$TrackingImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      polygones: null == polygones
          ? _value._polygones
          : polygones // ignore: cast_nullable_to_non_nullable
              as List<TrackingPolygone>,
      isSosSignal: null == isSosSignal
          ? _value.isSosSignal
          : isSosSignal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingImpl extends _Tracking {
  const _$TrackingImpl(
      {required this.userId,
      required this.userName,
      required this.lat,
      required this.long,
      required this.photoURL,
      final List<TrackingPolygone> polygones = const [],
      this.isSosSignal = false})
      : _polygones = polygones,
        super._();

  factory _$TrackingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingImplFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final double lat;
  @override
  final double long;
  @override
  final String? photoURL;
  final List<TrackingPolygone> _polygones;
  @override
  @JsonKey()
  List<TrackingPolygone> get polygones {
    if (_polygones is EqualUnmodifiableListView) return _polygones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polygones);
  }

  @override
  @JsonKey()
  final bool isSosSignal;

  @override
  String toString() {
    return 'Tracking(userId: $userId, userName: $userName, lat: $lat, long: $long, photoURL: $photoURL, polygones: $polygones, isSosSignal: $isSosSignal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            const DeepCollectionEquality()
                .equals(other._polygones, _polygones) &&
            (identical(other.isSosSignal, isSosSignal) ||
                other.isSosSignal == isSosSignal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, lat, long,
      photoURL, const DeepCollectionEquality().hash(_polygones), isSosSignal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingImplCopyWith<_$TrackingImpl> get copyWith =>
      __$$TrackingImplCopyWithImpl<_$TrackingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingImplToJson(
      this,
    );
  }
}

abstract class _Tracking extends Tracking {
  const factory _Tracking(
      {required final String userId,
      required final String userName,
      required final double lat,
      required final double long,
      required final String? photoURL,
      final List<TrackingPolygone> polygones,
      final bool isSosSignal}) = _$TrackingImpl;
  const _Tracking._() : super._();

  factory _Tracking.fromJson(Map<String, dynamic> json) =
      _$TrackingImpl.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  double get lat;
  @override
  double get long;
  @override
  String? get photoURL;
  @override
  List<TrackingPolygone> get polygones;
  @override
  bool get isSosSignal;
  @override
  @JsonKey(ignore: true)
  _$$TrackingImplCopyWith<_$TrackingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
