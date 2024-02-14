// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OtpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        resendCode,
    required TResult Function(String verificationId, String smsCode) verify,
    required TResult Function() otpSent,
    required TResult Function(String exception) catchFail,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult? Function(String verificationId, String smsCode)? verify,
    TResult? Function()? otpSent,
    TResult? Function(String exception)? catchFail,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult Function(String verificationId, String smsCode)? verify,
    TResult Function()? otpSent,
    TResult Function(String exception)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_Verify value) verify,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_Verify value)? verify,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpEventCopyWith<$Res> {
  factory $OtpEventCopyWith(OtpEvent value, $Res Function(OtpEvent) then) =
      _$OtpEventCopyWithImpl<$Res, OtpEvent>;
}

/// @nodoc
class _$OtpEventCopyWithImpl<$Res, $Val extends OtpEvent>
    implements $OtpEventCopyWith<$Res> {
  _$OtpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResendCodeImplCopyWith<$Res> {
  factory _$$ResendCodeImplCopyWith(
          _$ResendCodeImpl value, $Res Function(_$ResendCodeImpl) then) =
      __$$ResendCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, void Function(String) verifyId});
}

/// @nodoc
class __$$ResendCodeImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$ResendCodeImpl>
    implements _$$ResendCodeImplCopyWith<$Res> {
  __$$ResendCodeImplCopyWithImpl(
      _$ResendCodeImpl _value, $Res Function(_$ResendCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? verifyId = null,
  }) {
    return _then(_$ResendCodeImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verifyId: null == verifyId
          ? _value.verifyId
          : verifyId // ignore: cast_nullable_to_non_nullable
              as void Function(String),
    ));
  }
}

/// @nodoc

class _$ResendCodeImpl implements _ResendCode {
  const _$ResendCodeImpl({required this.phoneNumber, required this.verifyId});

  @override
  final String phoneNumber;
  @override
  final void Function(String) verifyId;

  @override
  String toString() {
    return 'OtpEvent.resendCode(phoneNumber: $phoneNumber, verifyId: $verifyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendCodeImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.verifyId, verifyId) ||
                other.verifyId == verifyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, verifyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendCodeImplCopyWith<_$ResendCodeImpl> get copyWith =>
      __$$ResendCodeImplCopyWithImpl<_$ResendCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        resendCode,
    required TResult Function(String verificationId, String smsCode) verify,
    required TResult Function() otpSent,
    required TResult Function(String exception) catchFail,
    required TResult Function() reset,
  }) {
    return resendCode(phoneNumber, verifyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult? Function(String verificationId, String smsCode)? verify,
    TResult? Function()? otpSent,
    TResult? Function(String exception)? catchFail,
    TResult? Function()? reset,
  }) {
    return resendCode?.call(phoneNumber, verifyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult Function(String verificationId, String smsCode)? verify,
    TResult Function()? otpSent,
    TResult Function(String exception)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (resendCode != null) {
      return resendCode(phoneNumber, verifyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_Verify value) verify,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
    required TResult Function(_Reset value) reset,
  }) {
    return resendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
    TResult? Function(_Reset value)? reset,
  }) {
    return resendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_Verify value)? verify,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (resendCode != null) {
      return resendCode(this);
    }
    return orElse();
  }
}

abstract class _ResendCode implements OtpEvent {
  const factory _ResendCode(
      {required final String phoneNumber,
      required final void Function(String) verifyId}) = _$ResendCodeImpl;

  String get phoneNumber;
  void Function(String) get verifyId;
  @JsonKey(ignore: true)
  _$$ResendCodeImplCopyWith<_$ResendCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyImplCopyWith<$Res> {
  factory _$$VerifyImplCopyWith(
          _$VerifyImpl value, $Res Function(_$VerifyImpl) then) =
      __$$VerifyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, String smsCode});
}

/// @nodoc
class __$$VerifyImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$VerifyImpl>
    implements _$$VerifyImplCopyWith<$Res> {
  __$$VerifyImplCopyWithImpl(
      _$VerifyImpl _value, $Res Function(_$VerifyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? smsCode = null,
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
    ));
  }
}

/// @nodoc

class _$VerifyImpl implements _Verify {
  const _$VerifyImpl({required this.verificationId, required this.smsCode});

  @override
  final String verificationId;
  @override
  final String smsCode;

  @override
  String toString() {
    return 'OtpEvent.verify(verificationId: $verificationId, smsCode: $smsCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.smsCode, smsCode) || other.smsCode == smsCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, smsCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      __$$VerifyImplCopyWithImpl<_$VerifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        resendCode,
    required TResult Function(String verificationId, String smsCode) verify,
    required TResult Function() otpSent,
    required TResult Function(String exception) catchFail,
    required TResult Function() reset,
  }) {
    return verify(verificationId, smsCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult? Function(String verificationId, String smsCode)? verify,
    TResult? Function()? otpSent,
    TResult? Function(String exception)? catchFail,
    TResult? Function()? reset,
  }) {
    return verify?.call(verificationId, smsCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult Function(String verificationId, String smsCode)? verify,
    TResult Function()? otpSent,
    TResult Function(String exception)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(verificationId, smsCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResendCode value) resendCode,
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
    TResult? Function(_ResendCode value)? resendCode,
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
    TResult Function(_ResendCode value)? resendCode,
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

abstract class _Verify implements OtpEvent {
  const factory _Verify(
      {required final String verificationId,
      required final String smsCode}) = _$VerifyImpl;

  String get verificationId;
  String get smsCode;
  @JsonKey(ignore: true)
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpSentImplCopyWith<$Res> {
  factory _$$OtpSentImplCopyWith(
          _$OtpSentImpl value, $Res Function(_$OtpSentImpl) then) =
      __$$OtpSentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtpSentImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$OtpSentImpl>
    implements _$$OtpSentImplCopyWith<$Res> {
  __$$OtpSentImplCopyWithImpl(
      _$OtpSentImpl _value, $Res Function(_$OtpSentImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OtpSentImpl implements _OtpSent {
  const _$OtpSentImpl();

  @override
  String toString() {
    return 'OtpEvent.otpSent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtpSentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        resendCode,
    required TResult Function(String verificationId, String smsCode) verify,
    required TResult Function() otpSent,
    required TResult Function(String exception) catchFail,
    required TResult Function() reset,
  }) {
    return otpSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult? Function(String verificationId, String smsCode)? verify,
    TResult? Function()? otpSent,
    TResult? Function(String exception)? catchFail,
    TResult? Function()? reset,
  }) {
    return otpSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult Function(String verificationId, String smsCode)? verify,
    TResult Function()? otpSent,
    TResult Function(String exception)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResendCode value) resendCode,
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
    TResult? Function(_ResendCode value)? resendCode,
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
    TResult Function(_ResendCode value)? resendCode,
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

abstract class _OtpSent implements OtpEvent {
  const factory _OtpSent() = _$OtpSentImpl;
}

/// @nodoc
abstract class _$$CatchFailImplCopyWith<$Res> {
  factory _$$CatchFailImplCopyWith(
          _$CatchFailImpl value, $Res Function(_$CatchFailImpl) then) =
      __$$CatchFailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String exception});
}

/// @nodoc
class __$$CatchFailImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$CatchFailImpl>
    implements _$$CatchFailImplCopyWith<$Res> {
  __$$CatchFailImplCopyWithImpl(
      _$CatchFailImpl _value, $Res Function(_$CatchFailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$CatchFailImpl(
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CatchFailImpl implements _CatchFail {
  const _$CatchFailImpl({required this.exception});

  @override
  final String exception;

  @override
  String toString() {
    return 'OtpEvent.catchFail(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatchFailImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatchFailImplCopyWith<_$CatchFailImpl> get copyWith =>
      __$$CatchFailImplCopyWithImpl<_$CatchFailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        resendCode,
    required TResult Function(String verificationId, String smsCode) verify,
    required TResult Function() otpSent,
    required TResult Function(String exception) catchFail,
    required TResult Function() reset,
  }) {
    return catchFail(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult? Function(String verificationId, String smsCode)? verify,
    TResult? Function()? otpSent,
    TResult? Function(String exception)? catchFail,
    TResult? Function()? reset,
  }) {
    return catchFail?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult Function(String verificationId, String smsCode)? verify,
    TResult Function()? otpSent,
    TResult Function(String exception)? catchFail,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (catchFail != null) {
      return catchFail(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResendCode value) resendCode,
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
    TResult? Function(_ResendCode value)? resendCode,
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
    TResult Function(_ResendCode value)? resendCode,
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

abstract class _CatchFail implements OtpEvent {
  const factory _CatchFail({required final String exception}) = _$CatchFailImpl;

  String get exception;
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
    extends _$OtpEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'OtpEvent.reset()';
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
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        resendCode,
    required TResult Function(String verificationId, String smsCode) verify,
    required TResult Function() otpSent,
    required TResult Function(String exception) catchFail,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult? Function(String verificationId, String smsCode)? verify,
    TResult? Function()? otpSent,
    TResult? Function(String exception)? catchFail,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, void Function(String) verifyId)?
        resendCode,
    TResult Function(String verificationId, String smsCode)? verify,
    TResult Function()? otpSent,
    TResult Function(String exception)? catchFail,
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
    required TResult Function(_ResendCode value) resendCode,
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
    TResult? Function(_ResendCode value)? resendCode,
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
    TResult Function(_ResendCode value)? resendCode,
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

abstract class _Reset implements OtpEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$OtpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() wait,
    required TResult Function() verification,
    required TResult Function() loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? wait,
    TResult? Function()? verification,
    TResult? Function()? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? wait,
    TResult Function()? verification,
    TResult Function()? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Wait value)? wait,
    TResult? Function(_Verification value)? verification,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Wait value)? wait,
    TResult Function(_Verification value)? verification,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

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
    extends _$OtpStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OtpState.initial()';
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
    required TResult Function() wait,
    required TResult Function() verification,
    required TResult Function() loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? wait,
    TResult? Function()? verification,
    TResult? Function()? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? wait,
    TResult Function()? verification,
    TResult Function()? loaded,
    TResult Function(String error)? error,
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
    required TResult Function(_Loaded value) loaded,
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
    TResult? Function(_Loaded value)? loaded,
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OtpState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$WaitImplCopyWith<$Res> {
  factory _$$WaitImplCopyWith(
          _$WaitImpl value, $Res Function(_$WaitImpl) then) =
      __$$WaitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WaitImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$WaitImpl>
    implements _$$WaitImplCopyWith<$Res> {
  __$$WaitImplCopyWithImpl(_$WaitImpl _value, $Res Function(_$WaitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WaitImpl implements _Wait {
  const _$WaitImpl();

  @override
  String toString() {
    return 'OtpState.wait()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WaitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() wait,
    required TResult Function() verification,
    required TResult Function() loaded,
    required TResult Function(String error) error,
  }) {
    return wait();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? wait,
    TResult? Function()? verification,
    TResult? Function()? loaded,
    TResult? Function(String error)? error,
  }) {
    return wait?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? wait,
    TResult Function()? verification,
    TResult Function()? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (wait != null) {
      return wait();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Loaded value) loaded,
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
    TResult? Function(_Loaded value)? loaded,
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (wait != null) {
      return wait(this);
    }
    return orElse();
  }
}

abstract class _Wait implements OtpState {
  const factory _Wait() = _$WaitImpl;
}

/// @nodoc
abstract class _$$VerificationImplCopyWith<$Res> {
  factory _$$VerificationImplCopyWith(
          _$VerificationImpl value, $Res Function(_$VerificationImpl) then) =
      __$$VerificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerificationImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$VerificationImpl>
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
    return 'OtpState.verification()';
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
    required TResult Function() wait,
    required TResult Function() verification,
    required TResult Function() loaded,
    required TResult Function(String error) error,
  }) {
    return verification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? wait,
    TResult? Function()? verification,
    TResult? Function()? loaded,
    TResult? Function(String error)? error,
  }) {
    return verification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? wait,
    TResult Function()? verification,
    TResult Function()? loaded,
    TResult Function(String error)? error,
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
    required TResult Function(_Loaded value) loaded,
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
    TResult? Function(_Loaded value)? loaded,
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (verification != null) {
      return verification(this);
    }
    return orElse();
  }
}

abstract class _Verification implements OtpState {
  const factory _Verification() = _$VerificationImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl();

  @override
  String toString() {
    return 'OtpState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() wait,
    required TResult Function() verification,
    required TResult Function() loaded,
    required TResult Function(String error) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? wait,
    TResult? Function()? verification,
    TResult? Function()? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? wait,
    TResult Function()? verification,
    TResult Function()? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Wait value)? wait,
    TResult? Function(_Verification value)? verification,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Wait value)? wait,
    TResult Function(_Verification value)? verification,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements OtpState {
  const factory _Loaded() = _$LoadedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'OtpState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() wait,
    required TResult Function() verification,
    required TResult Function() loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? wait,
    TResult? Function()? verification,
    TResult? Function()? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? wait,
    TResult Function()? verification,
    TResult Function()? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Wait value) wait,
    required TResult Function(_Verification value) verification,
    required TResult Function(_Loaded value) loaded,
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
    TResult? Function(_Loaded value)? loaded,
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements OtpState {
  const factory _Error({required final String error}) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
