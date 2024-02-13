// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_codes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryCodes _$CountryCodesFromJson(Map<String, dynamic> json) {
  return _CountryCodes.fromJson(json);
}

/// @nodoc
mixin _$CountryCodes {
  String get code => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  int get phoneLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCodesCopyWith<CountryCodes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCodesCopyWith<$Res> {
  factory $CountryCodesCopyWith(
          CountryCodes value, $Res Function(CountryCodes) then) =
      _$CountryCodesCopyWithImpl<$Res, CountryCodes>;
  @useResult
  $Res call({String code, String label, String phone, int phoneLength});
}

/// @nodoc
class _$CountryCodesCopyWithImpl<$Res, $Val extends CountryCodes>
    implements $CountryCodesCopyWith<$Res> {
  _$CountryCodesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
    Object? phone = null,
    Object? phoneLength = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      phoneLength: null == phoneLength
          ? _value.phoneLength
          : phoneLength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryCodesImplCopyWith<$Res>
    implements $CountryCodesCopyWith<$Res> {
  factory _$$CountryCodesImplCopyWith(
          _$CountryCodesImpl value, $Res Function(_$CountryCodesImpl) then) =
      __$$CountryCodesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String label, String phone, int phoneLength});
}

/// @nodoc
class __$$CountryCodesImplCopyWithImpl<$Res>
    extends _$CountryCodesCopyWithImpl<$Res, _$CountryCodesImpl>
    implements _$$CountryCodesImplCopyWith<$Res> {
  __$$CountryCodesImplCopyWithImpl(
      _$CountryCodesImpl _value, $Res Function(_$CountryCodesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
    Object? phone = null,
    Object? phoneLength = null,
  }) {
    return _then(_$CountryCodesImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      phoneLength: null == phoneLength
          ? _value.phoneLength
          : phoneLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryCodesImpl implements _CountryCodes {
  const _$CountryCodesImpl(
      {required this.code,
      required this.label,
      required this.phone,
      required this.phoneLength});

  factory _$CountryCodesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryCodesImplFromJson(json);

  @override
  final String code;
  @override
  final String label;
  @override
  final String phone;
  @override
  final int phoneLength;

  @override
  String toString() {
    return 'CountryCodes(code: $code, label: $label, phone: $phone, phoneLength: $phoneLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryCodesImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.phoneLength, phoneLength) ||
                other.phoneLength == phoneLength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, label, phone, phoneLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryCodesImplCopyWith<_$CountryCodesImpl> get copyWith =>
      __$$CountryCodesImplCopyWithImpl<_$CountryCodesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryCodesImplToJson(
      this,
    );
  }
}

abstract class _CountryCodes implements CountryCodes {
  const factory _CountryCodes(
      {required final String code,
      required final String label,
      required final String phone,
      required final int phoneLength}) = _$CountryCodesImpl;

  factory _CountryCodes.fromJson(Map<String, dynamic> json) =
      _$CountryCodesImpl.fromJson;

  @override
  String get code;
  @override
  String get label;
  @override
  String get phone;
  @override
  int get phoneLength;
  @override
  @JsonKey(ignore: true)
  _$$CountryCodesImplCopyWith<_$CountryCodesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
