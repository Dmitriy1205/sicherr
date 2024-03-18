// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_sos_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendSosEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)
        sendSOS,
    required TResult Function() openDialog,
    required TResult Function() closeDialog,
    required TResult Function() triggerQuickBinding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult? Function()? openDialog,
    TResult? Function()? closeDialog,
    TResult? Function()? triggerQuickBinding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult Function()? openDialog,
    TResult Function()? closeDialog,
    TResult Function()? triggerQuickBinding,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendSOS value) sendSOS,
    required TResult Function(_OpenDialog value) openDialog,
    required TResult Function(_CloseDialog value) closeDialog,
    required TResult Function(_TriggerQuickBinding value) triggerQuickBinding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendSOS value)? sendSOS,
    TResult? Function(_OpenDialog value)? openDialog,
    TResult? Function(_CloseDialog value)? closeDialog,
    TResult? Function(_TriggerQuickBinding value)? triggerQuickBinding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendSOS value)? sendSOS,
    TResult Function(_OpenDialog value)? openDialog,
    TResult Function(_CloseDialog value)? closeDialog,
    TResult Function(_TriggerQuickBinding value)? triggerQuickBinding,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendSosEventCopyWith<$Res> {
  factory $SendSosEventCopyWith(
          SendSosEvent value, $Res Function(SendSosEvent) then) =
      _$SendSosEventCopyWithImpl<$Res, SendSosEvent>;
}

/// @nodoc
class _$SendSosEventCopyWithImpl<$Res, $Val extends SendSosEvent>
    implements $SendSosEventCopyWith<$Res> {
  _$SendSosEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendSOSImplCopyWith<$Res> {
  factory _$$SendSOSImplCopyWith(
          _$SendSOSImpl value, $Res Function(_$SendSOSImpl) then) =
      __$$SendSOSImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? lat,
      String? long,
      String message,
      String currentUserPhone,
      List<String> emContactPhone});
}

/// @nodoc
class __$$SendSOSImplCopyWithImpl<$Res>
    extends _$SendSosEventCopyWithImpl<$Res, _$SendSOSImpl>
    implements _$$SendSOSImplCopyWith<$Res> {
  __$$SendSOSImplCopyWithImpl(
      _$SendSOSImpl _value, $Res Function(_$SendSOSImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
    Object? message = null,
    Object? currentUserPhone = null,
    Object? emContactPhone = null,
  }) {
    return _then(_$SendSOSImpl(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      currentUserPhone: null == currentUserPhone
          ? _value.currentUserPhone
          : currentUserPhone // ignore: cast_nullable_to_non_nullable
              as String,
      emContactPhone: null == emContactPhone
          ? _value._emContactPhone
          : emContactPhone // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SendSOSImpl implements _SendSOS {
  const _$SendSOSImpl(
      {required this.lat,
      required this.long,
      required this.message,
      required this.currentUserPhone,
      required final List<String> emContactPhone})
      : _emContactPhone = emContactPhone;

  @override
  final String? lat;
  @override
  final String? long;
  @override
  final String message;
  @override
  final String currentUserPhone;
  final List<String> _emContactPhone;
  @override
  List<String> get emContactPhone {
    if (_emContactPhone is EqualUnmodifiableListView) return _emContactPhone;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emContactPhone);
  }

  @override
  String toString() {
    return 'SendSosEvent.sendSOS(lat: $lat, long: $long, message: $message, currentUserPhone: $currentUserPhone, emContactPhone: $emContactPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendSOSImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.currentUserPhone, currentUserPhone) ||
                other.currentUserPhone == currentUserPhone) &&
            const DeepCollectionEquality()
                .equals(other._emContactPhone, _emContactPhone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, long, message,
      currentUserPhone, const DeepCollectionEquality().hash(_emContactPhone));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendSOSImplCopyWith<_$SendSOSImpl> get copyWith =>
      __$$SendSOSImplCopyWithImpl<_$SendSOSImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)
        sendSOS,
    required TResult Function() openDialog,
    required TResult Function() closeDialog,
    required TResult Function() triggerQuickBinding,
  }) {
    return sendSOS(lat, long, message, currentUserPhone, emContactPhone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult? Function()? openDialog,
    TResult? Function()? closeDialog,
    TResult? Function()? triggerQuickBinding,
  }) {
    return sendSOS?.call(lat, long, message, currentUserPhone, emContactPhone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult Function()? openDialog,
    TResult Function()? closeDialog,
    TResult Function()? triggerQuickBinding,
    required TResult orElse(),
  }) {
    if (sendSOS != null) {
      return sendSOS(lat, long, message, currentUserPhone, emContactPhone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendSOS value) sendSOS,
    required TResult Function(_OpenDialog value) openDialog,
    required TResult Function(_CloseDialog value) closeDialog,
    required TResult Function(_TriggerQuickBinding value) triggerQuickBinding,
  }) {
    return sendSOS(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendSOS value)? sendSOS,
    TResult? Function(_OpenDialog value)? openDialog,
    TResult? Function(_CloseDialog value)? closeDialog,
    TResult? Function(_TriggerQuickBinding value)? triggerQuickBinding,
  }) {
    return sendSOS?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendSOS value)? sendSOS,
    TResult Function(_OpenDialog value)? openDialog,
    TResult Function(_CloseDialog value)? closeDialog,
    TResult Function(_TriggerQuickBinding value)? triggerQuickBinding,
    required TResult orElse(),
  }) {
    if (sendSOS != null) {
      return sendSOS(this);
    }
    return orElse();
  }
}

abstract class _SendSOS implements SendSosEvent {
  const factory _SendSOS(
      {required final String? lat,
      required final String? long,
      required final String message,
      required final String currentUserPhone,
      required final List<String> emContactPhone}) = _$SendSOSImpl;

  String? get lat;
  String? get long;
  String get message;
  String get currentUserPhone;
  List<String> get emContactPhone;
  @JsonKey(ignore: true)
  _$$SendSOSImplCopyWith<_$SendSOSImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenDialogImplCopyWith<$Res> {
  factory _$$OpenDialogImplCopyWith(
          _$OpenDialogImpl value, $Res Function(_$OpenDialogImpl) then) =
      __$$OpenDialogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenDialogImplCopyWithImpl<$Res>
    extends _$SendSosEventCopyWithImpl<$Res, _$OpenDialogImpl>
    implements _$$OpenDialogImplCopyWith<$Res> {
  __$$OpenDialogImplCopyWithImpl(
      _$OpenDialogImpl _value, $Res Function(_$OpenDialogImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OpenDialogImpl implements _OpenDialog {
  const _$OpenDialogImpl();

  @override
  String toString() {
    return 'SendSosEvent.openDialog()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenDialogImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)
        sendSOS,
    required TResult Function() openDialog,
    required TResult Function() closeDialog,
    required TResult Function() triggerQuickBinding,
  }) {
    return openDialog();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult? Function()? openDialog,
    TResult? Function()? closeDialog,
    TResult? Function()? triggerQuickBinding,
  }) {
    return openDialog?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult Function()? openDialog,
    TResult Function()? closeDialog,
    TResult Function()? triggerQuickBinding,
    required TResult orElse(),
  }) {
    if (openDialog != null) {
      return openDialog();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendSOS value) sendSOS,
    required TResult Function(_OpenDialog value) openDialog,
    required TResult Function(_CloseDialog value) closeDialog,
    required TResult Function(_TriggerQuickBinding value) triggerQuickBinding,
  }) {
    return openDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendSOS value)? sendSOS,
    TResult? Function(_OpenDialog value)? openDialog,
    TResult? Function(_CloseDialog value)? closeDialog,
    TResult? Function(_TriggerQuickBinding value)? triggerQuickBinding,
  }) {
    return openDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendSOS value)? sendSOS,
    TResult Function(_OpenDialog value)? openDialog,
    TResult Function(_CloseDialog value)? closeDialog,
    TResult Function(_TriggerQuickBinding value)? triggerQuickBinding,
    required TResult orElse(),
  }) {
    if (openDialog != null) {
      return openDialog(this);
    }
    return orElse();
  }
}

abstract class _OpenDialog implements SendSosEvent {
  const factory _OpenDialog() = _$OpenDialogImpl;
}

/// @nodoc
abstract class _$$CloseDialogImplCopyWith<$Res> {
  factory _$$CloseDialogImplCopyWith(
          _$CloseDialogImpl value, $Res Function(_$CloseDialogImpl) then) =
      __$$CloseDialogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CloseDialogImplCopyWithImpl<$Res>
    extends _$SendSosEventCopyWithImpl<$Res, _$CloseDialogImpl>
    implements _$$CloseDialogImplCopyWith<$Res> {
  __$$CloseDialogImplCopyWithImpl(
      _$CloseDialogImpl _value, $Res Function(_$CloseDialogImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CloseDialogImpl implements _CloseDialog {
  const _$CloseDialogImpl();

  @override
  String toString() {
    return 'SendSosEvent.closeDialog()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CloseDialogImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)
        sendSOS,
    required TResult Function() openDialog,
    required TResult Function() closeDialog,
    required TResult Function() triggerQuickBinding,
  }) {
    return closeDialog();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult? Function()? openDialog,
    TResult? Function()? closeDialog,
    TResult? Function()? triggerQuickBinding,
  }) {
    return closeDialog?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult Function()? openDialog,
    TResult Function()? closeDialog,
    TResult Function()? triggerQuickBinding,
    required TResult orElse(),
  }) {
    if (closeDialog != null) {
      return closeDialog();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendSOS value) sendSOS,
    required TResult Function(_OpenDialog value) openDialog,
    required TResult Function(_CloseDialog value) closeDialog,
    required TResult Function(_TriggerQuickBinding value) triggerQuickBinding,
  }) {
    return closeDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendSOS value)? sendSOS,
    TResult? Function(_OpenDialog value)? openDialog,
    TResult? Function(_CloseDialog value)? closeDialog,
    TResult? Function(_TriggerQuickBinding value)? triggerQuickBinding,
  }) {
    return closeDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendSOS value)? sendSOS,
    TResult Function(_OpenDialog value)? openDialog,
    TResult Function(_CloseDialog value)? closeDialog,
    TResult Function(_TriggerQuickBinding value)? triggerQuickBinding,
    required TResult orElse(),
  }) {
    if (closeDialog != null) {
      return closeDialog(this);
    }
    return orElse();
  }
}

abstract class _CloseDialog implements SendSosEvent {
  const factory _CloseDialog() = _$CloseDialogImpl;
}

/// @nodoc
abstract class _$$TriggerQuickBindingImplCopyWith<$Res> {
  factory _$$TriggerQuickBindingImplCopyWith(_$TriggerQuickBindingImpl value,
          $Res Function(_$TriggerQuickBindingImpl) then) =
      __$$TriggerQuickBindingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TriggerQuickBindingImplCopyWithImpl<$Res>
    extends _$SendSosEventCopyWithImpl<$Res, _$TriggerQuickBindingImpl>
    implements _$$TriggerQuickBindingImplCopyWith<$Res> {
  __$$TriggerQuickBindingImplCopyWithImpl(_$TriggerQuickBindingImpl _value,
      $Res Function(_$TriggerQuickBindingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TriggerQuickBindingImpl implements _TriggerQuickBinding {
  const _$TriggerQuickBindingImpl();

  @override
  String toString() {
    return 'SendSosEvent.triggerQuickBinding()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TriggerQuickBindingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)
        sendSOS,
    required TResult Function() openDialog,
    required TResult Function() closeDialog,
    required TResult Function() triggerQuickBinding,
  }) {
    return triggerQuickBinding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult? Function()? openDialog,
    TResult? Function()? closeDialog,
    TResult? Function()? triggerQuickBinding,
  }) {
    return triggerQuickBinding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? lat, String? long, String message,
            String currentUserPhone, List<String> emContactPhone)?
        sendSOS,
    TResult Function()? openDialog,
    TResult Function()? closeDialog,
    TResult Function()? triggerQuickBinding,
    required TResult orElse(),
  }) {
    if (triggerQuickBinding != null) {
      return triggerQuickBinding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendSOS value) sendSOS,
    required TResult Function(_OpenDialog value) openDialog,
    required TResult Function(_CloseDialog value) closeDialog,
    required TResult Function(_TriggerQuickBinding value) triggerQuickBinding,
  }) {
    return triggerQuickBinding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendSOS value)? sendSOS,
    TResult? Function(_OpenDialog value)? openDialog,
    TResult? Function(_CloseDialog value)? closeDialog,
    TResult? Function(_TriggerQuickBinding value)? triggerQuickBinding,
  }) {
    return triggerQuickBinding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendSOS value)? sendSOS,
    TResult Function(_OpenDialog value)? openDialog,
    TResult Function(_CloseDialog value)? closeDialog,
    TResult Function(_TriggerQuickBinding value)? triggerQuickBinding,
    required TResult orElse(),
  }) {
    if (triggerQuickBinding != null) {
      return triggerQuickBinding(this);
    }
    return orElse();
  }
}

abstract class _TriggerQuickBinding implements SendSosEvent {
  const factory _TriggerQuickBinding() = _$TriggerQuickBindingImpl;
}

/// @nodoc
mixin _$SendSosState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() quickBindingTriggered,
    required TResult Function() dialogOpened,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? quickBindingTriggered,
    TResult? Function()? dialogOpened,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? quickBindingTriggered,
    TResult Function()? dialogOpened,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_QuickBindingTriggered value)
        quickBindingTriggered,
    required TResult Function(_DialogOpened value) dialogOpened,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult? Function(_DialogOpened value)? dialogOpened,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult Function(_DialogOpened value)? dialogOpened,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendSosStateCopyWith<$Res> {
  factory $SendSosStateCopyWith(
          SendSosState value, $Res Function(SendSosState) then) =
      _$SendSosStateCopyWithImpl<$Res, SendSosState>;
}

/// @nodoc
class _$SendSosStateCopyWithImpl<$Res, $Val extends SendSosState>
    implements $SendSosStateCopyWith<$Res> {
  _$SendSosStateCopyWithImpl(this._value, this._then);

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
    extends _$SendSosStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SendSosState.initial()';
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
    required TResult Function() quickBindingTriggered,
    required TResult Function() dialogOpened,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? quickBindingTriggered,
    TResult? Function()? dialogOpened,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? quickBindingTriggered,
    TResult Function()? dialogOpened,
    TResult Function()? loading,
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
    required TResult Function(_QuickBindingTriggered value)
        quickBindingTriggered,
    required TResult Function(_DialogOpened value) dialogOpened,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult? Function(_DialogOpened value)? dialogOpened,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult Function(_DialogOpened value)? dialogOpened,
    TResult Function(_Loading value)? loading,
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

abstract class _Initial extends SendSosState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$QuickBindingTriggeredImplCopyWith<$Res> {
  factory _$$QuickBindingTriggeredImplCopyWith(
          _$QuickBindingTriggeredImpl value,
          $Res Function(_$QuickBindingTriggeredImpl) then) =
      __$$QuickBindingTriggeredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuickBindingTriggeredImplCopyWithImpl<$Res>
    extends _$SendSosStateCopyWithImpl<$Res, _$QuickBindingTriggeredImpl>
    implements _$$QuickBindingTriggeredImplCopyWith<$Res> {
  __$$QuickBindingTriggeredImplCopyWithImpl(_$QuickBindingTriggeredImpl _value,
      $Res Function(_$QuickBindingTriggeredImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$QuickBindingTriggeredImpl extends _QuickBindingTriggered {
  const _$QuickBindingTriggeredImpl() : super._();

  @override
  String toString() {
    return 'SendSosState.quickBindingTriggered()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickBindingTriggeredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() quickBindingTriggered,
    required TResult Function() dialogOpened,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return quickBindingTriggered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? quickBindingTriggered,
    TResult? Function()? dialogOpened,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return quickBindingTriggered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? quickBindingTriggered,
    TResult Function()? dialogOpened,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (quickBindingTriggered != null) {
      return quickBindingTriggered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_QuickBindingTriggered value)
        quickBindingTriggered,
    required TResult Function(_DialogOpened value) dialogOpened,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return quickBindingTriggered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult? Function(_DialogOpened value)? dialogOpened,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return quickBindingTriggered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult Function(_DialogOpened value)? dialogOpened,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (quickBindingTriggered != null) {
      return quickBindingTriggered(this);
    }
    return orElse();
  }
}

abstract class _QuickBindingTriggered extends SendSosState {
  const factory _QuickBindingTriggered() = _$QuickBindingTriggeredImpl;
  const _QuickBindingTriggered._() : super._();
}

/// @nodoc
abstract class _$$DialogOpenedImplCopyWith<$Res> {
  factory _$$DialogOpenedImplCopyWith(
          _$DialogOpenedImpl value, $Res Function(_$DialogOpenedImpl) then) =
      __$$DialogOpenedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DialogOpenedImplCopyWithImpl<$Res>
    extends _$SendSosStateCopyWithImpl<$Res, _$DialogOpenedImpl>
    implements _$$DialogOpenedImplCopyWith<$Res> {
  __$$DialogOpenedImplCopyWithImpl(
      _$DialogOpenedImpl _value, $Res Function(_$DialogOpenedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DialogOpenedImpl extends _DialogOpened {
  const _$DialogOpenedImpl() : super._();

  @override
  String toString() {
    return 'SendSosState.dialogOpened()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DialogOpenedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() quickBindingTriggered,
    required TResult Function() dialogOpened,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return dialogOpened();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? quickBindingTriggered,
    TResult? Function()? dialogOpened,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return dialogOpened?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? quickBindingTriggered,
    TResult Function()? dialogOpened,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (dialogOpened != null) {
      return dialogOpened();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_QuickBindingTriggered value)
        quickBindingTriggered,
    required TResult Function(_DialogOpened value) dialogOpened,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return dialogOpened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult? Function(_DialogOpened value)? dialogOpened,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return dialogOpened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult Function(_DialogOpened value)? dialogOpened,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (dialogOpened != null) {
      return dialogOpened(this);
    }
    return orElse();
  }
}

abstract class _DialogOpened extends SendSosState {
  const factory _DialogOpened() = _$DialogOpenedImpl;
  const _DialogOpened._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SendSosStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'SendSosState.loading()';
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
    required TResult Function() quickBindingTriggered,
    required TResult Function() dialogOpened,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? quickBindingTriggered,
    TResult? Function()? dialogOpened,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? quickBindingTriggered,
    TResult Function()? dialogOpened,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message, String? code)? error,
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
    required TResult Function(_QuickBindingTriggered value)
        quickBindingTriggered,
    required TResult Function(_DialogOpened value) dialogOpened,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult? Function(_DialogOpened value)? dialogOpened,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult Function(_DialogOpened value)? dialogOpened,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends SendSosState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SendSosStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl extends _Success {
  const _$SuccessImpl() : super._();

  @override
  String toString() {
    return 'SendSosState.success()';
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
    required TResult Function() quickBindingTriggered,
    required TResult Function() dialogOpened,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? quickBindingTriggered,
    TResult? Function()? dialogOpened,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? quickBindingTriggered,
    TResult Function()? dialogOpened,
    TResult Function()? loading,
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
    required TResult Function(_QuickBindingTriggered value)
        quickBindingTriggered,
    required TResult Function(_DialogOpened value) dialogOpened,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult? Function(_DialogOpened value)? dialogOpened,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult Function(_DialogOpened value)? dialogOpened,
    TResult Function(_Loading value)? loading,
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

abstract class _Success extends SendSosState {
  const factory _Success() = _$SuccessImpl;
  const _Success._() : super._();
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
    extends _$SendSosStateCopyWithImpl<$Res, _$ErrorImpl>
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

class _$ErrorImpl extends _Error {
  const _$ErrorImpl({required this.message, this.code}) : super._();

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'SendSosState.error(message: $message, code: $code)';
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
    required TResult Function() quickBindingTriggered,
    required TResult Function() dialogOpened,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message, String? code) error,
  }) {
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? quickBindingTriggered,
    TResult? Function()? dialogOpened,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message, String? code)? error,
  }) {
    return error?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? quickBindingTriggered,
    TResult Function()? dialogOpened,
    TResult Function()? loading,
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
    required TResult Function(_QuickBindingTriggered value)
        quickBindingTriggered,
    required TResult Function(_DialogOpened value) dialogOpened,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult? Function(_DialogOpened value)? dialogOpened,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_QuickBindingTriggered value)? quickBindingTriggered,
    TResult Function(_DialogOpened value)? dialogOpened,
    TResult Function(_Loading value)? loading,
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

abstract class _Error extends SendSosState {
  const factory _Error({required final String message, final String? code}) =
      _$ErrorImpl;
  const _Error._() : super._();

  String get message;
  String? get code;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
