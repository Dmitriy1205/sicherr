// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppPlaceDetails _$AppPlaceDetailsFromJson(Map<String, dynamic> json) {
  return _AppPlaceDetails.fromJson(json);
}

/// @nodoc
mixin _$AppPlaceDetails {
  String get address => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng get latlng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppPlaceDetailsCopyWith<AppPlaceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPlaceDetailsCopyWith<$Res> {
  factory $AppPlaceDetailsCopyWith(
          AppPlaceDetails value, $Res Function(AppPlaceDetails) then) =
      _$AppPlaceDetailsCopyWithImpl<$Res, AppPlaceDetails>;
  @useResult
  $Res call({String address, @LatLngConverter() LatLng latlng});
}

/// @nodoc
class _$AppPlaceDetailsCopyWithImpl<$Res, $Val extends AppPlaceDetails>
    implements $AppPlaceDetailsCopyWith<$Res> {
  _$AppPlaceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? latlng = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latlng: null == latlng
          ? _value.latlng
          : latlng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppPlaceDetailsImplCopyWith<$Res>
    implements $AppPlaceDetailsCopyWith<$Res> {
  factory _$$AppPlaceDetailsImplCopyWith(_$AppPlaceDetailsImpl value,
          $Res Function(_$AppPlaceDetailsImpl) then) =
      __$$AppPlaceDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, @LatLngConverter() LatLng latlng});
}

/// @nodoc
class __$$AppPlaceDetailsImplCopyWithImpl<$Res>
    extends _$AppPlaceDetailsCopyWithImpl<$Res, _$AppPlaceDetailsImpl>
    implements _$$AppPlaceDetailsImplCopyWith<$Res> {
  __$$AppPlaceDetailsImplCopyWithImpl(
      _$AppPlaceDetailsImpl _value, $Res Function(_$AppPlaceDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? latlng = null,
  }) {
    return _then(_$AppPlaceDetailsImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latlng: null == latlng
          ? _value.latlng
          : latlng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppPlaceDetailsImpl implements _AppPlaceDetails {
  const _$AppPlaceDetailsImpl(
      {required this.address, @LatLngConverter() required this.latlng});

  factory _$AppPlaceDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppPlaceDetailsImplFromJson(json);

  @override
  final String address;
  @override
  @LatLngConverter()
  final LatLng latlng;

  @override
  String toString() {
    return 'AppPlaceDetails(address: $address, latlng: $latlng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPlaceDetailsImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latlng, latlng) || other.latlng == latlng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, latlng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPlaceDetailsImplCopyWith<_$AppPlaceDetailsImpl> get copyWith =>
      __$$AppPlaceDetailsImplCopyWithImpl<_$AppPlaceDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppPlaceDetailsImplToJson(
      this,
    );
  }
}

abstract class _AppPlaceDetails implements AppPlaceDetails {
  const factory _AppPlaceDetails(
      {required final String address,
      @LatLngConverter() required final LatLng latlng}) = _$AppPlaceDetailsImpl;

  factory _AppPlaceDetails.fromJson(Map<String, dynamic> json) =
      _$AppPlaceDetailsImpl.fromJson;

  @override
  String get address;
  @override
  @LatLngConverter()
  LatLng get latlng;
  @override
  @JsonKey(ignore: true)
  _$$AppPlaceDetailsImplCopyWith<_$AppPlaceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
