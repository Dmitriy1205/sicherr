// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteDetails _$RouteDetailsFromJson(Map<String, dynamic> json) {
  return _RouteDetails.fromJson(json);
}

/// @nodoc
mixin _$RouteDetails {
  @LatLngConverter()
  List<LatLng> get route => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  int get radius => throw _privateConstructorUsedError;
  List<ContactEntity> get etaContacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDetailsCopyWith<RouteDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDetailsCopyWith<$Res> {
  factory $RouteDetailsCopyWith(
          RouteDetails value, $Res Function(RouteDetails) then) =
      _$RouteDetailsCopyWithImpl<$Res, RouteDetails>;
  @useResult
  $Res call(
      {@LatLngConverter() List<LatLng> route,
      double distance,
      int radius,
      List<ContactEntity> etaContacts});
}

/// @nodoc
class _$RouteDetailsCopyWithImpl<$Res, $Val extends RouteDetails>
    implements $RouteDetailsCopyWith<$Res> {
  _$RouteDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? distance = null,
    Object? radius = null,
    Object? etaContacts = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      etaContacts: null == etaContacts
          ? _value.etaContacts
          : etaContacts // ignore: cast_nullable_to_non_nullable
              as List<ContactEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteDetailsImplCopyWith<$Res>
    implements $RouteDetailsCopyWith<$Res> {
  factory _$$RouteDetailsImplCopyWith(
          _$RouteDetailsImpl value, $Res Function(_$RouteDetailsImpl) then) =
      __$$RouteDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@LatLngConverter() List<LatLng> route,
      double distance,
      int radius,
      List<ContactEntity> etaContacts});
}

/// @nodoc
class __$$RouteDetailsImplCopyWithImpl<$Res>
    extends _$RouteDetailsCopyWithImpl<$Res, _$RouteDetailsImpl>
    implements _$$RouteDetailsImplCopyWith<$Res> {
  __$$RouteDetailsImplCopyWithImpl(
      _$RouteDetailsImpl _value, $Res Function(_$RouteDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? distance = null,
    Object? radius = null,
    Object? etaContacts = null,
  }) {
    return _then(_$RouteDetailsImpl(
      route: null == route
          ? _value._route
          : route // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      etaContacts: null == etaContacts
          ? _value._etaContacts
          : etaContacts // ignore: cast_nullable_to_non_nullable
              as List<ContactEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDetailsImpl implements _RouteDetails {
  const _$RouteDetailsImpl(
      {@LatLngConverter() required final List<LatLng> route,
      required this.distance,
      required this.radius,
      required final List<ContactEntity> etaContacts})
      : _route = route,
        _etaContacts = etaContacts;

  factory _$RouteDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDetailsImplFromJson(json);

  final List<LatLng> _route;
  @override
  @LatLngConverter()
  List<LatLng> get route {
    if (_route is EqualUnmodifiableListView) return _route;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_route);
  }

  @override
  final double distance;
  @override
  final int radius;
  final List<ContactEntity> _etaContacts;
  @override
  List<ContactEntity> get etaContacts {
    if (_etaContacts is EqualUnmodifiableListView) return _etaContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_etaContacts);
  }

  @override
  String toString() {
    return 'RouteDetails(route: $route, distance: $distance, radius: $radius, etaContacts: $etaContacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDetailsImpl &&
            const DeepCollectionEquality().equals(other._route, _route) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            const DeepCollectionEquality()
                .equals(other._etaContacts, _etaContacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_route),
      distance,
      radius,
      const DeepCollectionEquality().hash(_etaContacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDetailsImplCopyWith<_$RouteDetailsImpl> get copyWith =>
      __$$RouteDetailsImplCopyWithImpl<_$RouteDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDetailsImplToJson(
      this,
    );
  }
}

abstract class _RouteDetails implements RouteDetails {
  const factory _RouteDetails(
      {@LatLngConverter() required final List<LatLng> route,
      required final double distance,
      required final int radius,
      required final List<ContactEntity> etaContacts}) = _$RouteDetailsImpl;

  factory _RouteDetails.fromJson(Map<String, dynamic> json) =
      _$RouteDetailsImpl.fromJson;

  @override
  @LatLngConverter()
  List<LatLng> get route;
  @override
  double get distance;
  @override
  int get radius;
  @override
  List<ContactEntity> get etaContacts;
  @override
  @JsonKey(ignore: true)
  _$$RouteDetailsImplCopyWith<_$RouteDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
