// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  bool get enabledSosQB => throw _privateConstructorUsedError;
  String get sosMessage => throw _privateConstructorUsedError;
  bool get sendSosGeolocation => throw _privateConstructorUsedError;
  bool get alarmToneQB => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {bool enabledSosQB,
      String sosMessage,
      bool sendSosGeolocation,
      bool alarmToneQB,
      String id,
      String phone,
      String createdAt});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabledSosQB = null,
    Object? sosMessage = null,
    Object? sendSosGeolocation = null,
    Object? alarmToneQB = null,
    Object? id = null,
    Object? phone = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      enabledSosQB: null == enabledSosQB
          ? _value.enabledSosQB
          : enabledSosQB // ignore: cast_nullable_to_non_nullable
              as bool,
      sosMessage: null == sosMessage
          ? _value.sosMessage
          : sosMessage // ignore: cast_nullable_to_non_nullable
              as String,
      sendSosGeolocation: null == sendSosGeolocation
          ? _value.sendSosGeolocation
          : sendSosGeolocation // ignore: cast_nullable_to_non_nullable
              as bool,
      alarmToneQB: null == alarmToneQB
          ? _value.alarmToneQB
          : alarmToneQB // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool enabledSosQB,
      String sosMessage,
      bool sendSosGeolocation,
      bool alarmToneQB,
      String id,
      String phone,
      String createdAt});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabledSosQB = null,
    Object? sosMessage = null,
    Object? sendSosGeolocation = null,
    Object? alarmToneQB = null,
    Object? id = null,
    Object? phone = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserProfileImpl(
      enabledSosQB: null == enabledSosQB
          ? _value.enabledSosQB
          : enabledSosQB // ignore: cast_nullable_to_non_nullable
              as bool,
      sosMessage: null == sosMessage
          ? _value.sosMessage
          : sosMessage // ignore: cast_nullable_to_non_nullable
              as String,
      sendSosGeolocation: null == sendSosGeolocation
          ? _value.sendSosGeolocation
          : sendSosGeolocation // ignore: cast_nullable_to_non_nullable
              as bool,
      alarmToneQB: null == alarmToneQB
          ? _value.alarmToneQB
          : alarmToneQB // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {required this.enabledSosQB,
      required this.sosMessage,
      required this.sendSosGeolocation,
      required this.alarmToneQB,
      required this.id,
      required this.phone,
      required this.createdAt});

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final bool enabledSosQB;
  @override
  final String sosMessage;
  @override
  final bool sendSosGeolocation;
  @override
  final bool alarmToneQB;
  @override
  final String id;
  @override
  final String phone;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'UserProfile(enabledSosQB: $enabledSosQB, sosMessage: $sosMessage, sendSosGeolocation: $sendSosGeolocation, alarmToneQB: $alarmToneQB, id: $id, phone: $phone, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.enabledSosQB, enabledSosQB) ||
                other.enabledSosQB == enabledSosQB) &&
            (identical(other.sosMessage, sosMessage) ||
                other.sosMessage == sosMessage) &&
            (identical(other.sendSosGeolocation, sendSosGeolocation) ||
                other.sendSosGeolocation == sendSosGeolocation) &&
            (identical(other.alarmToneQB, alarmToneQB) ||
                other.alarmToneQB == alarmToneQB) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, enabledSosQB, sosMessage,
      sendSosGeolocation, alarmToneQB, id, phone, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {required final bool enabledSosQB,
      required final String sosMessage,
      required final bool sendSosGeolocation,
      required final bool alarmToneQB,
      required final String id,
      required final String phone,
      required final String createdAt}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  bool get enabledSosQB;
  @override
  String get sosMessage;
  @override
  bool get sendSosGeolocation;
  @override
  bool get alarmToneQB;
  @override
  String get id;
  @override
  String get phone;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
