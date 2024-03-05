// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Onboarding _$OnboardingFromJson(Map<String, dynamic> json) {
  return _Onboarding.fromJson(json);
}

/// @nodoc
mixin _$Onboarding {
  bool? get isWelcome => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingCopyWith<Onboarding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingCopyWith<$Res> {
  factory $OnboardingCopyWith(
          Onboarding value, $Res Function(Onboarding) then) =
      _$OnboardingCopyWithImpl<$Res, Onboarding>;
  @useResult
  $Res call({bool? isWelcome});
}

/// @nodoc
class _$OnboardingCopyWithImpl<$Res, $Val extends Onboarding>
    implements $OnboardingCopyWith<$Res> {
  _$OnboardingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWelcome = freezed,
  }) {
    return _then(_value.copyWith(
      isWelcome: freezed == isWelcome
          ? _value.isWelcome
          : isWelcome // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingImplCopyWith<$Res>
    implements $OnboardingCopyWith<$Res> {
  factory _$$OnboardingImplCopyWith(
          _$OnboardingImpl value, $Res Function(_$OnboardingImpl) then) =
      __$$OnboardingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isWelcome});
}

/// @nodoc
class __$$OnboardingImplCopyWithImpl<$Res>
    extends _$OnboardingCopyWithImpl<$Res, _$OnboardingImpl>
    implements _$$OnboardingImplCopyWith<$Res> {
  __$$OnboardingImplCopyWithImpl(
      _$OnboardingImpl _value, $Res Function(_$OnboardingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWelcome = freezed,
  }) {
    return _then(_$OnboardingImpl(
      isWelcome: freezed == isWelcome
          ? _value.isWelcome
          : isWelcome // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnboardingImpl implements _Onboarding {
  const _$OnboardingImpl({this.isWelcome});

  factory _$OnboardingImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingImplFromJson(json);

  @override
  final bool? isWelcome;

  @override
  String toString() {
    return 'Onboarding(isWelcome: $isWelcome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingImpl &&
            (identical(other.isWelcome, isWelcome) ||
                other.isWelcome == isWelcome));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isWelcome);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingImplCopyWith<_$OnboardingImpl> get copyWith =>
      __$$OnboardingImplCopyWithImpl<_$OnboardingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingImplToJson(
      this,
    );
  }
}

abstract class _Onboarding implements Onboarding {
  const factory _Onboarding({final bool? isWelcome}) = _$OnboardingImpl;

  factory _Onboarding.fromJson(Map<String, dynamic> json) =
      _$OnboardingImpl.fromJson;

  @override
  bool? get isWelcome;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingImplCopyWith<_$OnboardingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
