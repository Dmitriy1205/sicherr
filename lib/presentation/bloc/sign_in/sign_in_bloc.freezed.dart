// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        login,
    required TResult Function(AuthCredential credential)
        phoneAuthVerificationComplete,
    required TResult Function(
            String verificationId, int? token, String phoneNumber)
        otpSent,
    required TResult Function(String exception) catchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        login,
    TResult? Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult? Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult? Function(String exception)? catchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String phoneNumber, void Function(String) verifyId)? login,
    TResult Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult Function(String exception)? catchFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_PhoneAuthVerificationComplete value)
        phoneAuthVerificationComplete,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res, SignInEvent>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res, $Val extends SignInEvent>
    implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'SignInEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        login,
    required TResult Function(AuthCredential credential)
        phoneAuthVerificationComplete,
    required TResult Function(
            String verificationId, int? token, String phoneNumber)
        otpSent,
    required TResult Function(String exception) catchFail,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        login,
    TResult? Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult? Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult? Function(String exception)? catchFail,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String phoneNumber, void Function(String) verifyId)? login,
    TResult Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult Function(String exception)? catchFail,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_PhoneAuthVerificationComplete value)
        phoneAuthVerificationComplete,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements SignInEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, void Function(String) verifyId});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? verifyId = null,
  }) {
    return _then(_$LoginImpl(
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

class _$LoginImpl implements _Login {
  const _$LoginImpl({required this.phoneNumber, required this.verifyId});

  @override
  final String phoneNumber;
  @override
  final void Function(String) verifyId;

  @override
  String toString() {
    return 'SignInEvent.login(phoneNumber: $phoneNumber, verifyId: $verifyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
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
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        login,
    required TResult Function(AuthCredential credential)
        phoneAuthVerificationComplete,
    required TResult Function(
            String verificationId, int? token, String phoneNumber)
        otpSent,
    required TResult Function(String exception) catchFail,
  }) {
    return login(phoneNumber, verifyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        login,
    TResult? Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult? Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult? Function(String exception)? catchFail,
  }) {
    return login?.call(phoneNumber, verifyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String phoneNumber, void Function(String) verifyId)? login,
    TResult Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult Function(String exception)? catchFail,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(phoneNumber, verifyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_PhoneAuthVerificationComplete value)
        phoneAuthVerificationComplete,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements SignInEvent {
  const factory _Login(
      {required final String phoneNumber,
      required final void Function(String) verifyId}) = _$LoginImpl;

  String get phoneNumber;
  void Function(String) get verifyId;
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneAuthVerificationCompleteImplCopyWith<$Res> {
  factory _$$PhoneAuthVerificationCompleteImplCopyWith(
          _$PhoneAuthVerificationCompleteImpl value,
          $Res Function(_$PhoneAuthVerificationCompleteImpl) then) =
      __$$PhoneAuthVerificationCompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthCredential credential});
}

/// @nodoc
class __$$PhoneAuthVerificationCompleteImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$PhoneAuthVerificationCompleteImpl>
    implements _$$PhoneAuthVerificationCompleteImplCopyWith<$Res> {
  __$$PhoneAuthVerificationCompleteImplCopyWithImpl(
      _$PhoneAuthVerificationCompleteImpl _value,
      $Res Function(_$PhoneAuthVerificationCompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credential = null,
  }) {
    return _then(_$PhoneAuthVerificationCompleteImpl(
      credential: null == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as AuthCredential,
    ));
  }
}

/// @nodoc

class _$PhoneAuthVerificationCompleteImpl
    implements _PhoneAuthVerificationComplete {
  const _$PhoneAuthVerificationCompleteImpl({required this.credential});

  @override
  final AuthCredential credential;

  @override
  String toString() {
    return 'SignInEvent.phoneAuthVerificationComplete(credential: $credential)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneAuthVerificationCompleteImpl &&
            (identical(other.credential, credential) ||
                other.credential == credential));
  }

  @override
  int get hashCode => Object.hash(runtimeType, credential);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneAuthVerificationCompleteImplCopyWith<
          _$PhoneAuthVerificationCompleteImpl>
      get copyWith => __$$PhoneAuthVerificationCompleteImplCopyWithImpl<
          _$PhoneAuthVerificationCompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        login,
    required TResult Function(AuthCredential credential)
        phoneAuthVerificationComplete,
    required TResult Function(
            String verificationId, int? token, String phoneNumber)
        otpSent,
    required TResult Function(String exception) catchFail,
  }) {
    return phoneAuthVerificationComplete(credential);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        login,
    TResult? Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult? Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult? Function(String exception)? catchFail,
  }) {
    return phoneAuthVerificationComplete?.call(credential);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String phoneNumber, void Function(String) verifyId)? login,
    TResult Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult Function(String exception)? catchFail,
    required TResult orElse(),
  }) {
    if (phoneAuthVerificationComplete != null) {
      return phoneAuthVerificationComplete(credential);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_PhoneAuthVerificationComplete value)
        phoneAuthVerificationComplete,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
  }) {
    return phoneAuthVerificationComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
  }) {
    return phoneAuthVerificationComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    required TResult orElse(),
  }) {
    if (phoneAuthVerificationComplete != null) {
      return phoneAuthVerificationComplete(this);
    }
    return orElse();
  }
}

abstract class _PhoneAuthVerificationComplete implements SignInEvent {
  const factory _PhoneAuthVerificationComplete(
          {required final AuthCredential credential}) =
      _$PhoneAuthVerificationCompleteImpl;

  AuthCredential get credential;
  @JsonKey(ignore: true)
  _$$PhoneAuthVerificationCompleteImplCopyWith<
          _$PhoneAuthVerificationCompleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpSentImplCopyWith<$Res> {
  factory _$$OtpSentImplCopyWith(
          _$OtpSentImpl value, $Res Function(_$OtpSentImpl) then) =
      __$$OtpSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, int? token, String phoneNumber});
}

/// @nodoc
class __$$OtpSentImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$OtpSentImpl>
    implements _$$OtpSentImplCopyWith<$Res> {
  __$$OtpSentImplCopyWithImpl(
      _$OtpSentImpl _value, $Res Function(_$OtpSentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? token = freezed,
    Object? phoneNumber = null,
  }) {
    return _then(_$OtpSentImpl(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpSentImpl implements _OtpSent {
  const _$OtpSentImpl(
      {required this.verificationId,
      required this.token,
      required this.phoneNumber});

  @override
  final String verificationId;
  @override
  final int? token;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignInEvent.otpSent(verificationId: $verificationId, token: $token, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpSentImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, verificationId, token, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpSentImplCopyWith<_$OtpSentImpl> get copyWith =>
      __$$OtpSentImplCopyWithImpl<_$OtpSentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        login,
    required TResult Function(AuthCredential credential)
        phoneAuthVerificationComplete,
    required TResult Function(
            String verificationId, int? token, String phoneNumber)
        otpSent,
    required TResult Function(String exception) catchFail,
  }) {
    return otpSent(verificationId, token, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        login,
    TResult? Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult? Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult? Function(String exception)? catchFail,
  }) {
    return otpSent?.call(verificationId, token, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String phoneNumber, void Function(String) verifyId)? login,
    TResult Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult Function(String exception)? catchFail,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(verificationId, token, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_PhoneAuthVerificationComplete value)
        phoneAuthVerificationComplete,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
  }) {
    return otpSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
  }) {
    return otpSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(this);
    }
    return orElse();
  }
}

abstract class _OtpSent implements SignInEvent {
  const factory _OtpSent(
      {required final String verificationId,
      required final int? token,
      required final String phoneNumber}) = _$OtpSentImpl;

  String get verificationId;
  int? get token;
  String get phoneNumber;
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
  $Res call({String exception});
}

/// @nodoc
class __$$CatchFailImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$CatchFailImpl>
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
    return 'SignInEvent.catchFail(exception: $exception)';
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
    required TResult Function() init,
    required TResult Function(
            String phoneNumber, void Function(String) verifyId)
        login,
    required TResult Function(AuthCredential credential)
        phoneAuthVerificationComplete,
    required TResult Function(
            String verificationId, int? token, String phoneNumber)
        otpSent,
    required TResult Function(String exception) catchFail,
  }) {
    return catchFail(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String phoneNumber, void Function(String) verifyId)?
        login,
    TResult? Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult? Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult? Function(String exception)? catchFail,
  }) {
    return catchFail?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String phoneNumber, void Function(String) verifyId)? login,
    TResult Function(AuthCredential credential)? phoneAuthVerificationComplete,
    TResult Function(String verificationId, int? token, String phoneNumber)?
        otpSent,
    TResult Function(String exception)? catchFail,
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
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_PhoneAuthVerificationComplete value)
        phoneAuthVerificationComplete,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_CatchFail value) catchFail,
  }) {
    return catchFail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_CatchFail value)? catchFail,
  }) {
    return catchFail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_PhoneAuthVerificationComplete value)?
        phoneAuthVerificationComplete,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_CatchFail value)? catchFail,
    required TResult orElse(),
  }) {
    if (catchFail != null) {
      return catchFail(this);
    }
    return orElse();
  }
}

abstract class _CatchFail implements SignInEvent {
  const factory _CatchFail({required final String exception}) = _$CatchFailImpl;

  String get exception;
  @JsonKey(ignore: true)
  _$$CatchFailImplCopyWith<_$CatchFailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String verificationId, String phoneNumber)
        unVerified,
    required TResult Function() verified,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String verificationId, String phoneNumber)? unVerified,
    TResult? Function()? verified,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String verificationId, String phoneNumber)? unVerified,
    TResult Function()? verified,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UnVerified value) unVerified,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UnVerified value)? unVerified,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UnVerified value)? unVerified,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

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
    extends _$SignInStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'SignInState.initial()';
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
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String verificationId, String phoneNumber)
        unVerified,
    required TResult Function() verified,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String verificationId, String phoneNumber)? unVerified,
    TResult? Function()? verified,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String verificationId, String phoneNumber)? unVerified,
    TResult Function()? verified,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UnVerified value) unVerified,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UnVerified value)? unVerified,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UnVerified value)? unVerified,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends SignInState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'SignInState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String verificationId, String phoneNumber)
        unVerified,
    required TResult Function() verified,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String verificationId, String phoneNumber)? unVerified,
    TResult? Function()? verified,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String verificationId, String phoneNumber)? unVerified,
    TResult Function()? verified,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UnVerified value) unVerified,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UnVerified value)? unVerified,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UnVerified value)? unVerified,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends SignInState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl() : super._();

  @override
  String toString() {
    return 'SignInState.loaded()';
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
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String verificationId, String phoneNumber)
        unVerified,
    required TResult Function() verified,
    required TResult Function(String error) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String verificationId, String phoneNumber)? unVerified,
    TResult? Function()? verified,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String verificationId, String phoneNumber)? unVerified,
    TResult Function()? verified,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UnVerified value) unVerified,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UnVerified value)? unVerified,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UnVerified value)? unVerified,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends SignInState {
  const factory _Loaded() = _$LoadedImpl;
  const _Loaded._() : super._();
}

/// @nodoc
abstract class _$$UnVerifiedImplCopyWith<$Res> {
  factory _$$UnVerifiedImplCopyWith(
          _$UnVerifiedImpl value, $Res Function(_$UnVerifiedImpl) then) =
      __$$UnVerifiedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, String phoneNumber});
}

/// @nodoc
class __$$UnVerifiedImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$UnVerifiedImpl>
    implements _$$UnVerifiedImplCopyWith<$Res> {
  __$$UnVerifiedImplCopyWithImpl(
      _$UnVerifiedImpl _value, $Res Function(_$UnVerifiedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$UnVerifiedImpl(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnVerifiedImpl extends _UnVerified {
  const _$UnVerifiedImpl(
      {required this.verificationId, required this.phoneNumber})
      : super._();

  @override
  final String verificationId;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignInState.unVerified(verificationId: $verificationId, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnVerifiedImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnVerifiedImplCopyWith<_$UnVerifiedImpl> get copyWith =>
      __$$UnVerifiedImplCopyWithImpl<_$UnVerifiedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String verificationId, String phoneNumber)
        unVerified,
    required TResult Function() verified,
    required TResult Function(String error) error,
  }) {
    return unVerified(verificationId, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String verificationId, String phoneNumber)? unVerified,
    TResult? Function()? verified,
    TResult? Function(String error)? error,
  }) {
    return unVerified?.call(verificationId, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String verificationId, String phoneNumber)? unVerified,
    TResult Function()? verified,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (unVerified != null) {
      return unVerified(verificationId, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UnVerified value) unVerified,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return unVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UnVerified value)? unVerified,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return unVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UnVerified value)? unVerified,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unVerified != null) {
      return unVerified(this);
    }
    return orElse();
  }
}

abstract class _UnVerified extends SignInState {
  const factory _UnVerified(
      {required final String verificationId,
      required final String phoneNumber}) = _$UnVerifiedImpl;
  const _UnVerified._() : super._();

  String get verificationId;
  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$UnVerifiedImplCopyWith<_$UnVerifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifiedImplCopyWith<$Res> {
  factory _$$VerifiedImplCopyWith(
          _$VerifiedImpl value, $Res Function(_$VerifiedImpl) then) =
      __$$VerifiedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifiedImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$VerifiedImpl>
    implements _$$VerifiedImplCopyWith<$Res> {
  __$$VerifiedImplCopyWithImpl(
      _$VerifiedImpl _value, $Res Function(_$VerifiedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerifiedImpl extends _Verified {
  const _$VerifiedImpl() : super._();

  @override
  String toString() {
    return 'SignInState.verified()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifiedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String verificationId, String phoneNumber)
        unVerified,
    required TResult Function() verified,
    required TResult Function(String error) error,
  }) {
    return verified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String verificationId, String phoneNumber)? unVerified,
    TResult? Function()? verified,
    TResult? Function(String error)? error,
  }) {
    return verified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String verificationId, String phoneNumber)? unVerified,
    TResult Function()? verified,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UnVerified value) unVerified,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return verified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UnVerified value)? unVerified,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return verified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UnVerified value)? unVerified,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(this);
    }
    return orElse();
  }
}

abstract class _Verified extends SignInState {
  const factory _Verified() = _$VerifiedImpl;
  const _Verified._() : super._();
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
    extends _$SignInStateCopyWithImpl<$Res, _$ErrorImpl>
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

class _$ErrorImpl extends _Error {
  const _$ErrorImpl({required this.error}) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'SignInState.error(error: $error)';
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
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String verificationId, String phoneNumber)
        unVerified,
    required TResult Function() verified,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String verificationId, String phoneNumber)? unVerified,
    TResult? Function()? verified,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String verificationId, String phoneNumber)? unVerified,
    TResult Function()? verified,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UnVerified value) unVerified,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UnVerified value)? unVerified,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UnVerified value)? unVerified,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends SignInState {
  const factory _Error({required final String error}) = _$ErrorImpl;
  const _Error._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
