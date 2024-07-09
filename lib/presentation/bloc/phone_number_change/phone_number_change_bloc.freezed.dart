// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_number_change_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneNumberChangeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) sendCode,
    required TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)
        verify,
    required TResult Function(String phoneNumber, String verificationId)
        otpSent,
    required TResult Function(String message, String code) catchFail,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? sendCode,
    TResult? Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult? Function(String phoneNumber, String verificationId)? otpSent,
    TResult? Function(String message, String code)? catchFail,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? sendCode,
    TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult Function(String phoneNumber, String verificationId)? otpSent,
    TResult Function(String message, String code)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_Verify value) verify,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_Verify value)? verify,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberChangeEventCopyWith<$Res> {
  factory $PhoneNumberChangeEventCopyWith(PhoneNumberChangeEvent value,
          $Res Function(PhoneNumberChangeEvent) then) =
      _$PhoneNumberChangeEventCopyWithImpl<$Res, PhoneNumberChangeEvent>;
}

/// @nodoc
class _$PhoneNumberChangeEventCopyWithImpl<$Res,
        $Val extends PhoneNumberChangeEvent>
    implements $PhoneNumberChangeEventCopyWith<$Res> {
  _$PhoneNumberChangeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendCodeImplCopyWith<$Res> {
  factory _$$SendCodeImplCopyWith(
          _$SendCodeImpl value, $Res Function(_$SendCodeImpl) then) =
      __$$SendCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$SendCodeImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeEventCopyWithImpl<$Res, _$SendCodeImpl>
    implements _$$SendCodeImplCopyWith<$Res> {
  __$$SendCodeImplCopyWithImpl(
      _$SendCodeImpl _value, $Res Function(_$SendCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$SendCodeImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendCodeImpl implements _SendCode {
  const _$SendCodeImpl({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneNumberChangeEvent.sendCode(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCodeImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCodeImplCopyWith<_$SendCodeImpl> get copyWith =>
      __$$SendCodeImplCopyWithImpl<_$SendCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) sendCode,
    required TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)
        verify,
    required TResult Function(String phoneNumber, String verificationId)
        otpSent,
    required TResult Function(String message, String code) catchFail,
    required TResult Function() reset,
  }) {
    return sendCode(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? sendCode,
    TResult? Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult? Function(String phoneNumber, String verificationId)? otpSent,
    TResult? Function(String message, String code)? catchFail,
    TResult? Function()? reset,
  }) {
    return sendCode?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? sendCode,
    TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult Function(String phoneNumber, String verificationId)? otpSent,
    TResult Function(String message, String code)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_Verify value) verify,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
    required TResult Function(_Reset value) reset,
  }) {
    return sendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
    TResult? Function(_Reset value)? reset,
  }) {
    return sendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_Verify value)? verify,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(this);
    }
    return orElse();
  }
}

abstract class _SendCode implements PhoneNumberChangeEvent {
  const factory _SendCode({required final String phoneNumber}) = _$SendCodeImpl;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$SendCodeImplCopyWith<_$SendCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyImplCopyWith<$Res> {
  factory _$$VerifyImplCopyWith(
          _$VerifyImpl value, $Res Function(_$VerifyImpl) then) =
      __$$VerifyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, String smsCode, String newPhoneNumber});
}

/// @nodoc
class __$$VerifyImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeEventCopyWithImpl<$Res, _$VerifyImpl>
    implements _$$VerifyImplCopyWith<$Res> {
  __$$VerifyImplCopyWithImpl(
      _$VerifyImpl _value, $Res Function(_$VerifyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? smsCode = null,
    Object? newPhoneNumber = null,
  }) {
    return _then(_$VerifyImpl(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      smsCode: null == smsCode
          ? _value.smsCode
          : smsCode // ignore: cast_nullable_to_non_nullable
              as String,
      newPhoneNumber: null == newPhoneNumber
          ? _value.newPhoneNumber
          : newPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyImpl implements _Verify {
  const _$VerifyImpl(
      {required this.verificationId,
      required this.smsCode,
      required this.newPhoneNumber});

  @override
  final String verificationId;
  @override
  final String smsCode;
  @override
  final String newPhoneNumber;

  @override
  String toString() {
    return 'PhoneNumberChangeEvent.verify(verificationId: $verificationId, smsCode: $smsCode, newPhoneNumber: $newPhoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.smsCode, smsCode) || other.smsCode == smsCode) &&
            (identical(other.newPhoneNumber, newPhoneNumber) ||
                other.newPhoneNumber == newPhoneNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, verificationId, smsCode, newPhoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      __$$VerifyImplCopyWithImpl<_$VerifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) sendCode,
    required TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)
        verify,
    required TResult Function(String phoneNumber, String verificationId)
        otpSent,
    required TResult Function(String message, String code) catchFail,
    required TResult Function() reset,
  }) {
    return verify(verificationId, smsCode, newPhoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? sendCode,
    TResult? Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult? Function(String phoneNumber, String verificationId)? otpSent,
    TResult? Function(String message, String code)? catchFail,
    TResult? Function()? reset,
  }) {
    return verify?.call(verificationId, smsCode, newPhoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? sendCode,
    TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult Function(String phoneNumber, String verificationId)? otpSent,
    TResult Function(String message, String code)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(verificationId, smsCode, newPhoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_Verify value) verify,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
    required TResult Function(_Reset value) reset,
  }) {
    return verify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
    TResult? Function(_Reset value)? reset,
  }) {
    return verify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_Verify value)? verify,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(this);
    }
    return orElse();
  }
}

abstract class _Verify implements PhoneNumberChangeEvent {
  const factory _Verify(
      {required final String verificationId,
      required final String smsCode,
      required final String newPhoneNumber}) = _$VerifyImpl;

  String get verificationId;
  String get smsCode;
  String get newPhoneNumber;
  @JsonKey(ignore: true)
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpSentImplCopyWith<$Res> {
  factory _$$OtpSentImplCopyWith(
          _$OtpSentImpl value, $Res Function(_$OtpSentImpl) then) =
      __$$OtpSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String verificationId});
}

/// @nodoc
class __$$OtpSentImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeEventCopyWithImpl<$Res, _$OtpSentImpl>
    implements _$$OtpSentImplCopyWith<$Res> {
  __$$OtpSentImplCopyWithImpl(
      _$OtpSentImpl _value, $Res Function(_$OtpSentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? verificationId = null,
  }) {
    return _then(_$OtpSentImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpSentImpl implements _OtpSent {
  const _$OtpSentImpl(
      {required this.phoneNumber, required this.verificationId});

  @override
  final String phoneNumber;
  @override
  final String verificationId;

  @override
  String toString() {
    return 'PhoneNumberChangeEvent.otpSent(phoneNumber: $phoneNumber, verificationId: $verificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpSentImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, verificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpSentImplCopyWith<_$OtpSentImpl> get copyWith =>
      __$$OtpSentImplCopyWithImpl<_$OtpSentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) sendCode,
    required TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)
        verify,
    required TResult Function(String phoneNumber, String verificationId)
        otpSent,
    required TResult Function(String message, String code) catchFail,
    required TResult Function() reset,
  }) {
    return otpSent(phoneNumber, verificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? sendCode,
    TResult? Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult? Function(String phoneNumber, String verificationId)? otpSent,
    TResult? Function(String message, String code)? catchFail,
    TResult? Function()? reset,
  }) {
    return otpSent?.call(phoneNumber, verificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? sendCode,
    TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult Function(String phoneNumber, String verificationId)? otpSent,
    TResult Function(String message, String code)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(phoneNumber, verificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_Verify value) verify,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
    required TResult Function(_Reset value) reset,
  }) {
    return otpSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
    TResult? Function(_Reset value)? reset,
  }) {
    return otpSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_Verify value)? verify,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(this);
    }
    return orElse();
  }
}

abstract class _OtpSent implements PhoneNumberChangeEvent {
  const factory _OtpSent(
      {required final String phoneNumber,
      required final String verificationId}) = _$OtpSentImpl;

  String get phoneNumber;
  String get verificationId;
  @JsonKey(ignore: true)
  _$$OtpSentImplCopyWith<_$OtpSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CatchFailImplCopyWith<$Res> {
  factory _$$CatchFailImplCopyWith(
          _$CatchFailImpl value, $Res Function(_$CatchFailImpl) then) =
      __$$CatchFailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class __$$CatchFailImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeEventCopyWithImpl<$Res, _$CatchFailImpl>
    implements _$$CatchFailImplCopyWith<$Res> {
  __$$CatchFailImplCopyWithImpl(
      _$CatchFailImpl _value, $Res Function(_$CatchFailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$CatchFailImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CatchFailImpl implements _CatchFail {
  const _$CatchFailImpl({required this.message, required this.code});

  @override
  final String message;
  @override
  final String code;

  @override
  String toString() {
    return 'PhoneNumberChangeEvent.catchFail(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatchFailImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatchFailImplCopyWith<_$CatchFailImpl> get copyWith =>
      __$$CatchFailImplCopyWithImpl<_$CatchFailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) sendCode,
    required TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)
        verify,
    required TResult Function(String phoneNumber, String verificationId)
        otpSent,
    required TResult Function(String message, String code) catchFail,
    required TResult Function() reset,
  }) {
    return catchFail(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? sendCode,
    TResult? Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult? Function(String phoneNumber, String verificationId)? otpSent,
    TResult? Function(String message, String code)? catchFail,
    TResult? Function()? reset,
  }) {
    return catchFail?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? sendCode,
    TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult Function(String phoneNumber, String verificationId)? otpSent,
    TResult Function(String message, String code)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (catchFail != null) {
      return catchFail(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_Verify value) verify,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
    required TResult Function(_Reset value) reset,
  }) {
    return catchFail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
    TResult? Function(_Reset value)? reset,
  }) {
    return catchFail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_Verify value)? verify,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (catchFail != null) {
      return catchFail(this);
    }
    return orElse();
  }
}

abstract class _CatchFail implements PhoneNumberChangeEvent {
  const factory _CatchFail(
      {required final String message,
      required final String code}) = _$CatchFailImpl;

  String get message;
  String get code;
  @JsonKey(ignore: true)
  _$$CatchFailImplCopyWith<_$CatchFailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'PhoneNumberChangeEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) sendCode,
    required TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)
        verify,
    required TResult Function(String phoneNumber, String verificationId)
        otpSent,
    required TResult Function(String message, String code) catchFail,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? sendCode,
    TResult? Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult? Function(String phoneNumber, String verificationId)? otpSent,
    TResult? Function(String message, String code)? catchFail,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? sendCode,
    TResult Function(
            String verificationId, String smsCode, String newPhoneNumber)?
        verify,
    TResult Function(String phoneNumber, String verificationId)? otpSent,
    TResult Function(String message, String code)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_Verify value) verify,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_Verify value)? verify,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements PhoneNumberChangeEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$PhoneNumberChangeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String phoneNumber, String verificationId) wait,
    required TResult Function() verification,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String phoneNumber, String verificationId)? wait,
    TResult? Function()? verification,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String phoneNumber, String verificationId)? wait,
    TResult Function()? verification,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Wait value)? wait,
    TResult? Function(_Verification value)? verification,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Wait value)? wait,
    TResult Function(_Verification value)? verification,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberChangeStateCopyWith<$Res> {
  factory $PhoneNumberChangeStateCopyWith(PhoneNumberChangeState value,
          $Res Function(PhoneNumberChangeState) then) =
      _$PhoneNumberChangeStateCopyWithImpl<$Res, PhoneNumberChangeState>;
}

/// @nodoc
class _$PhoneNumberChangeStateCopyWithImpl<$Res,
        $Val extends PhoneNumberChangeState>
    implements $PhoneNumberChangeStateCopyWith<$Res> {
  _$PhoneNumberChangeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PhoneNumberChangeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String phoneNumber, String verificationId) wait,
    required TResult Function() verification,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String phoneNumber, String verificationId)? wait,
    TResult? Function()? verification,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String phoneNumber, String verificationId)? wait,
    TResult Function()? verification,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Wait value)? wait,
    TResult? Function(_Verification value)? verification,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Wait value)? wait,
    TResult Function(_Verification value)? verification,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PhoneNumberChangeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$WaitImplCopyWith<$Res> {
  factory _$$WaitImplCopyWith(
          _$WaitImpl value, $Res Function(_$WaitImpl) then) =
      __$$WaitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String verificationId});
}

/// @nodoc
class __$$WaitImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeStateCopyWithImpl<$Res, _$WaitImpl>
    implements _$$WaitImplCopyWith<$Res> {
  __$$WaitImplCopyWithImpl(_$WaitImpl _value, $Res Function(_$WaitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? verificationId = null,
  }) {
    return _then(_$WaitImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WaitImpl implements _Wait {
  const _$WaitImpl({required this.phoneNumber, required this.verificationId});

  @override
  final String phoneNumber;
  @override
  final String verificationId;

  @override
  String toString() {
    return 'PhoneNumberChangeState.wait(phoneNumber: $phoneNumber, verificationId: $verificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaitImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, verificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WaitImplCopyWith<_$WaitImpl> get copyWith =>
      __$$WaitImplCopyWithImpl<_$WaitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String phoneNumber, String verificationId) wait,
    required TResult Function() verification,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return wait(phoneNumber, verificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String phoneNumber, String verificationId)? wait,
    TResult? Function()? verification,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return wait?.call(phoneNumber, verificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String phoneNumber, String verificationId)? wait,
    TResult Function()? verification,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (wait != null) {
      return wait(phoneNumber, verificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return wait(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Wait value)? wait,
    TResult? Function(_Verification value)? verification,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return wait?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Wait value)? wait,
    TResult Function(_Verification value)? verification,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (wait != null) {
      return wait(this);
    }
    return orElse();
  }
}

abstract class _Wait implements PhoneNumberChangeState {
  const factory _Wait(
      {required final String phoneNumber,
      required final String verificationId}) = _$WaitImpl;

  String get phoneNumber;
  String get verificationId;
  @JsonKey(ignore: true)
  _$$WaitImplCopyWith<_$WaitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationImplCopyWith<$Res> {
  factory _$$VerificationImplCopyWith(
          _$VerificationImpl value, $Res Function(_$VerificationImpl) then) =
      __$$VerificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerificationImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeStateCopyWithImpl<$Res, _$VerificationImpl>
    implements _$$VerificationImplCopyWith<$Res> {
  __$$VerificationImplCopyWithImpl(
      _$VerificationImpl _value, $Res Function(_$VerificationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerificationImpl implements _Verification {
  const _$VerificationImpl();

  @override
  String toString() {
    return 'PhoneNumberChangeState.verification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String phoneNumber, String verificationId) wait,
    required TResult Function() verification,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return verification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String phoneNumber, String verificationId)? wait,
    TResult? Function()? verification,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return verification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String phoneNumber, String verificationId)? wait,
    TResult Function()? verification,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (verification != null) {
      return verification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return verification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Wait value)? wait,
    TResult? Function(_Verification value)? verification,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return verification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Wait value)? wait,
    TResult Function(_Verification value)? verification,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (verification != null) {
      return verification(this);
    }
    return orElse();
  }
}

abstract class _Verification implements PhoneNumberChangeState {
  const factory _Verification() = _$VerificationImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'PhoneNumberChangeState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String phoneNumber, String verificationId) wait,
    required TResult Function() verification,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String phoneNumber, String verificationId)? wait,
    TResult? Function()? verification,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String phoneNumber, String verificationId)? wait,
    TResult Function()? verification,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Wait value)? wait,
    TResult? Function(_Verification value)? verification,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Wait value)? wait,
    TResult Function(_Verification value)? verification,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PhoneNumberChangeState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PhoneNumberChangeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message, this.code});

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'PhoneNumberChangeState.error(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String phoneNumber, String verificationId) wait,
    required TResult Function() verification,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String phoneNumber, String verificationId)? wait,
    TResult? Function()? verification,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return error?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String phoneNumber, String verificationId)? wait,
    TResult Function()? verification,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Wait value)? wait,
    TResult? Function(_Verification value)? verification,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Wait value)? wait,
    TResult Function(_Verification value)? verification,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PhoneNumberChangeState {
  const factory _Error({required final String message, final String? code}) =
      _$ErrorImpl;

  String get message;
  String? get code;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
