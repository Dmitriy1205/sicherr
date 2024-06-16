// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int seconds) pickTime,
    required TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)
        startTimer,
    required TResult Function() fetchStatus,
    required TResult Function() tick,
    required TResult Function(bool sendSOS) stopTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int seconds)? pickTime,
    TResult? Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult? Function()? fetchStatus,
    TResult? Function()? tick,
    TResult? Function(bool sendSOS)? stopTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int seconds)? pickTime,
    TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult Function()? fetchStatus,
    TResult Function()? tick,
    TResult Function(bool sendSOS)? stopTimer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickTime value) pickTime,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_FetchStatus value) fetchStatus,
    required TResult Function(_Tick value) tick,
    required TResult Function(_StopTimer value) stopTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickTime value)? pickTime,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_FetchStatus value)? fetchStatus,
    TResult? Function(_Tick value)? tick,
    TResult? Function(_StopTimer value)? stopTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickTime value)? pickTime,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_FetchStatus value)? fetchStatus,
    TResult Function(_Tick value)? tick,
    TResult Function(_StopTimer value)? stopTimer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerEventCopyWith<$Res> {
  factory $TimerEventCopyWith(
          TimerEvent value, $Res Function(TimerEvent) then) =
      _$TimerEventCopyWithImpl<$Res, TimerEvent>;
}

/// @nodoc
class _$TimerEventCopyWithImpl<$Res, $Val extends TimerEvent>
    implements $TimerEventCopyWith<$Res> {
  _$TimerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PickTimeImplCopyWith<$Res> {
  factory _$$PickTimeImplCopyWith(
          _$PickTimeImpl value, $Res Function(_$PickTimeImpl) then) =
      __$$PickTimeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int seconds});
}

/// @nodoc
class __$$PickTimeImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$PickTimeImpl>
    implements _$$PickTimeImplCopyWith<$Res> {
  __$$PickTimeImplCopyWithImpl(
      _$PickTimeImpl _value, $Res Function(_$PickTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
  }) {
    return _then(_$PickTimeImpl(
      null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PickTimeImpl implements _PickTime {
  const _$PickTimeImpl(this.seconds);

  @override
  final int seconds;

  @override
  String toString() {
    return 'TimerEvent.pickTime(seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickTimeImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickTimeImplCopyWith<_$PickTimeImpl> get copyWith =>
      __$$PickTimeImplCopyWithImpl<_$PickTimeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int seconds) pickTime,
    required TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)
        startTimer,
    required TResult Function() fetchStatus,
    required TResult Function() tick,
    required TResult Function(bool sendSOS) stopTimer,
  }) {
    return pickTime(seconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int seconds)? pickTime,
    TResult? Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult? Function()? fetchStatus,
    TResult? Function()? tick,
    TResult? Function(bool sendSOS)? stopTimer,
  }) {
    return pickTime?.call(seconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int seconds)? pickTime,
    TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult Function()? fetchStatus,
    TResult Function()? tick,
    TResult Function(bool sendSOS)? stopTimer,
    required TResult orElse(),
  }) {
    if (pickTime != null) {
      return pickTime(seconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickTime value) pickTime,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_FetchStatus value) fetchStatus,
    required TResult Function(_Tick value) tick,
    required TResult Function(_StopTimer value) stopTimer,
  }) {
    return pickTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickTime value)? pickTime,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_FetchStatus value)? fetchStatus,
    TResult? Function(_Tick value)? tick,
    TResult? Function(_StopTimer value)? stopTimer,
  }) {
    return pickTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickTime value)? pickTime,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_FetchStatus value)? fetchStatus,
    TResult Function(_Tick value)? tick,
    TResult Function(_StopTimer value)? stopTimer,
    required TResult orElse(),
  }) {
    if (pickTime != null) {
      return pickTime(this);
    }
    return orElse();
  }
}

abstract class _PickTime implements TimerEvent {
  const factory _PickTime(final int seconds) = _$PickTimeImpl;

  int get seconds;
  @JsonKey(ignore: true)
  _$$PickTimeImplCopyWith<_$PickTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartTimerImplCopyWith<$Res> {
  factory _$$StartTimerImplCopyWith(
          _$StartTimerImpl value, $Res Function(_$StartTimerImpl) then) =
      __$$StartTimerImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String> emergencyPhones,
      String warningTitle,
      String warningMessage,
      String triggerTitle,
      String triggerMessage,
      String sosMessage,
      String phone});
}

/// @nodoc
class __$$StartTimerImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$StartTimerImpl>
    implements _$$StartTimerImplCopyWith<$Res> {
  __$$StartTimerImplCopyWithImpl(
      _$StartTimerImpl _value, $Res Function(_$StartTimerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emergencyPhones = null,
    Object? warningTitle = null,
    Object? warningMessage = null,
    Object? triggerTitle = null,
    Object? triggerMessage = null,
    Object? sosMessage = null,
    Object? phone = null,
  }) {
    return _then(_$StartTimerImpl(
      emergencyPhones: null == emergencyPhones
          ? _value._emergencyPhones
          : emergencyPhones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      warningTitle: null == warningTitle
          ? _value.warningTitle
          : warningTitle // ignore: cast_nullable_to_non_nullable
              as String,
      warningMessage: null == warningMessage
          ? _value.warningMessage
          : warningMessage // ignore: cast_nullable_to_non_nullable
              as String,
      triggerTitle: null == triggerTitle
          ? _value.triggerTitle
          : triggerTitle // ignore: cast_nullable_to_non_nullable
              as String,
      triggerMessage: null == triggerMessage
          ? _value.triggerMessage
          : triggerMessage // ignore: cast_nullable_to_non_nullable
              as String,
      sosMessage: null == sosMessage
          ? _value.sosMessage
          : sosMessage // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartTimerImpl implements _StartTimer {
  const _$StartTimerImpl(
      {required final List<String> emergencyPhones,
      required this.warningTitle,
      required this.warningMessage,
      required this.triggerTitle,
      required this.triggerMessage,
      required this.sosMessage,
      required this.phone})
      : _emergencyPhones = emergencyPhones;

  final List<String> _emergencyPhones;
  @override
  List<String> get emergencyPhones {
    if (_emergencyPhones is EqualUnmodifiableListView) return _emergencyPhones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emergencyPhones);
  }

  @override
  final String warningTitle;
  @override
  final String warningMessage;
  @override
  final String triggerTitle;
  @override
  final String triggerMessage;
  @override
  final String sosMessage;
  @override
  final String phone;

  @override
  String toString() {
    return 'TimerEvent.startTimer(emergencyPhones: $emergencyPhones, warningTitle: $warningTitle, warningMessage: $warningMessage, triggerTitle: $triggerTitle, triggerMessage: $triggerMessage, sosMessage: $sosMessage, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartTimerImpl &&
            const DeepCollectionEquality()
                .equals(other._emergencyPhones, _emergencyPhones) &&
            (identical(other.warningTitle, warningTitle) ||
                other.warningTitle == warningTitle) &&
            (identical(other.warningMessage, warningMessage) ||
                other.warningMessage == warningMessage) &&
            (identical(other.triggerTitle, triggerTitle) ||
                other.triggerTitle == triggerTitle) &&
            (identical(other.triggerMessage, triggerMessage) ||
                other.triggerMessage == triggerMessage) &&
            (identical(other.sosMessage, sosMessage) ||
                other.sosMessage == sosMessage) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_emergencyPhones),
      warningTitle,
      warningMessage,
      triggerTitle,
      triggerMessage,
      sosMessage,
      phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartTimerImplCopyWith<_$StartTimerImpl> get copyWith =>
      __$$StartTimerImplCopyWithImpl<_$StartTimerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int seconds) pickTime,
    required TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)
        startTimer,
    required TResult Function() fetchStatus,
    required TResult Function() tick,
    required TResult Function(bool sendSOS) stopTimer,
  }) {
    return startTimer(emergencyPhones, warningTitle, warningMessage,
        triggerTitle, triggerMessage, sosMessage, phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int seconds)? pickTime,
    TResult? Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult? Function()? fetchStatus,
    TResult? Function()? tick,
    TResult? Function(bool sendSOS)? stopTimer,
  }) {
    return startTimer?.call(emergencyPhones, warningTitle, warningMessage,
        triggerTitle, triggerMessage, sosMessage, phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int seconds)? pickTime,
    TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult Function()? fetchStatus,
    TResult Function()? tick,
    TResult Function(bool sendSOS)? stopTimer,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer(emergencyPhones, warningTitle, warningMessage,
          triggerTitle, triggerMessage, sosMessage, phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickTime value) pickTime,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_FetchStatus value) fetchStatus,
    required TResult Function(_Tick value) tick,
    required TResult Function(_StopTimer value) stopTimer,
  }) {
    return startTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickTime value)? pickTime,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_FetchStatus value)? fetchStatus,
    TResult? Function(_Tick value)? tick,
    TResult? Function(_StopTimer value)? stopTimer,
  }) {
    return startTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickTime value)? pickTime,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_FetchStatus value)? fetchStatus,
    TResult Function(_Tick value)? tick,
    TResult Function(_StopTimer value)? stopTimer,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer(this);
    }
    return orElse();
  }
}

abstract class _StartTimer implements TimerEvent {
  const factory _StartTimer(
      {required final List<String> emergencyPhones,
      required final String warningTitle,
      required final String warningMessage,
      required final String triggerTitle,
      required final String triggerMessage,
      required final String sosMessage,
      required final String phone}) = _$StartTimerImpl;

  List<String> get emergencyPhones;
  String get warningTitle;
  String get warningMessage;
  String get triggerTitle;
  String get triggerMessage;
  String get sosMessage;
  String get phone;
  @JsonKey(ignore: true)
  _$$StartTimerImplCopyWith<_$StartTimerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchStatusImplCopyWith<$Res> {
  factory _$$FetchStatusImplCopyWith(
          _$FetchStatusImpl value, $Res Function(_$FetchStatusImpl) then) =
      __$$FetchStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchStatusImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$FetchStatusImpl>
    implements _$$FetchStatusImplCopyWith<$Res> {
  __$$FetchStatusImplCopyWithImpl(
      _$FetchStatusImpl _value, $Res Function(_$FetchStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchStatusImpl implements _FetchStatus {
  const _$FetchStatusImpl();

  @override
  String toString() {
    return 'TimerEvent.fetchStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int seconds) pickTime,
    required TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)
        startTimer,
    required TResult Function() fetchStatus,
    required TResult Function() tick,
    required TResult Function(bool sendSOS) stopTimer,
  }) {
    return fetchStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int seconds)? pickTime,
    TResult? Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult? Function()? fetchStatus,
    TResult? Function()? tick,
    TResult? Function(bool sendSOS)? stopTimer,
  }) {
    return fetchStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int seconds)? pickTime,
    TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult Function()? fetchStatus,
    TResult Function()? tick,
    TResult Function(bool sendSOS)? stopTimer,
    required TResult orElse(),
  }) {
    if (fetchStatus != null) {
      return fetchStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickTime value) pickTime,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_FetchStatus value) fetchStatus,
    required TResult Function(_Tick value) tick,
    required TResult Function(_StopTimer value) stopTimer,
  }) {
    return fetchStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickTime value)? pickTime,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_FetchStatus value)? fetchStatus,
    TResult? Function(_Tick value)? tick,
    TResult? Function(_StopTimer value)? stopTimer,
  }) {
    return fetchStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickTime value)? pickTime,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_FetchStatus value)? fetchStatus,
    TResult Function(_Tick value)? tick,
    TResult Function(_StopTimer value)? stopTimer,
    required TResult orElse(),
  }) {
    if (fetchStatus != null) {
      return fetchStatus(this);
    }
    return orElse();
  }
}

abstract class _FetchStatus implements TimerEvent {
  const factory _FetchStatus() = _$FetchStatusImpl;
}

/// @nodoc
abstract class _$$TickImplCopyWith<$Res> {
  factory _$$TickImplCopyWith(
          _$TickImpl value, $Res Function(_$TickImpl) then) =
      __$$TickImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TickImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TickImpl>
    implements _$$TickImplCopyWith<$Res> {
  __$$TickImplCopyWithImpl(_$TickImpl _value, $Res Function(_$TickImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TickImpl implements _Tick {
  const _$TickImpl();

  @override
  String toString() {
    return 'TimerEvent.tick()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TickImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int seconds) pickTime,
    required TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)
        startTimer,
    required TResult Function() fetchStatus,
    required TResult Function() tick,
    required TResult Function(bool sendSOS) stopTimer,
  }) {
    return tick();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int seconds)? pickTime,
    TResult? Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult? Function()? fetchStatus,
    TResult? Function()? tick,
    TResult? Function(bool sendSOS)? stopTimer,
  }) {
    return tick?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int seconds)? pickTime,
    TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult Function()? fetchStatus,
    TResult Function()? tick,
    TResult Function(bool sendSOS)? stopTimer,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickTime value) pickTime,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_FetchStatus value) fetchStatus,
    required TResult Function(_Tick value) tick,
    required TResult Function(_StopTimer value) stopTimer,
  }) {
    return tick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickTime value)? pickTime,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_FetchStatus value)? fetchStatus,
    TResult? Function(_Tick value)? tick,
    TResult? Function(_StopTimer value)? stopTimer,
  }) {
    return tick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickTime value)? pickTime,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_FetchStatus value)? fetchStatus,
    TResult Function(_Tick value)? tick,
    TResult Function(_StopTimer value)? stopTimer,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick(this);
    }
    return orElse();
  }
}

abstract class _Tick implements TimerEvent {
  const factory _Tick() = _$TickImpl;
}

/// @nodoc
abstract class _$$StopTimerImplCopyWith<$Res> {
  factory _$$StopTimerImplCopyWith(
          _$StopTimerImpl value, $Res Function(_$StopTimerImpl) then) =
      __$$StopTimerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool sendSOS});
}

/// @nodoc
class __$$StopTimerImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$StopTimerImpl>
    implements _$$StopTimerImplCopyWith<$Res> {
  __$$StopTimerImplCopyWithImpl(
      _$StopTimerImpl _value, $Res Function(_$StopTimerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendSOS = null,
  }) {
    return _then(_$StopTimerImpl(
      sendSOS: null == sendSOS
          ? _value.sendSOS
          : sendSOS // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StopTimerImpl implements _StopTimer {
  const _$StopTimerImpl({required this.sendSOS});

  @override
  final bool sendSOS;

  @override
  String toString() {
    return 'TimerEvent.stopTimer(sendSOS: $sendSOS)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopTimerImpl &&
            (identical(other.sendSOS, sendSOS) || other.sendSOS == sendSOS));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendSOS);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StopTimerImplCopyWith<_$StopTimerImpl> get copyWith =>
      __$$StopTimerImplCopyWithImpl<_$StopTimerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int seconds) pickTime,
    required TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)
        startTimer,
    required TResult Function() fetchStatus,
    required TResult Function() tick,
    required TResult Function(bool sendSOS) stopTimer,
  }) {
    return stopTimer(sendSOS);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int seconds)? pickTime,
    TResult? Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult? Function()? fetchStatus,
    TResult? Function()? tick,
    TResult? Function(bool sendSOS)? stopTimer,
  }) {
    return stopTimer?.call(sendSOS);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int seconds)? pickTime,
    TResult Function(
            List<String> emergencyPhones,
            String warningTitle,
            String warningMessage,
            String triggerTitle,
            String triggerMessage,
            String sosMessage,
            String phone)?
        startTimer,
    TResult Function()? fetchStatus,
    TResult Function()? tick,
    TResult Function(bool sendSOS)? stopTimer,
    required TResult orElse(),
  }) {
    if (stopTimer != null) {
      return stopTimer(sendSOS);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickTime value) pickTime,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_FetchStatus value) fetchStatus,
    required TResult Function(_Tick value) tick,
    required TResult Function(_StopTimer value) stopTimer,
  }) {
    return stopTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickTime value)? pickTime,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_FetchStatus value)? fetchStatus,
    TResult? Function(_Tick value)? tick,
    TResult? Function(_StopTimer value)? stopTimer,
  }) {
    return stopTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickTime value)? pickTime,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_FetchStatus value)? fetchStatus,
    TResult Function(_Tick value)? tick,
    TResult Function(_StopTimer value)? stopTimer,
    required TResult orElse(),
  }) {
    if (stopTimer != null) {
      return stopTimer(this);
    }
    return orElse();
  }
}

abstract class _StopTimer implements TimerEvent {
  const factory _StopTimer({required final bool sendSOS}) = _$StopTimerImpl;

  bool get sendSOS;
  @JsonKey(ignore: true)
  _$$StopTimerImplCopyWith<_$StopTimerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TimerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int seconds) pickedTime,
    required TResult Function(int seconds) timerStarted,
    required TResult Function(
            DateTime targetSeconds, int seconds, int setSeconds)
        ticking,
    required TResult Function(bool sendSOS) timerEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int seconds)? pickedTime,
    TResult? Function(int seconds)? timerStarted,
    TResult? Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult? Function(bool sendSOS)? timerEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int seconds)? pickedTime,
    TResult Function(int seconds)? timerStarted,
    TResult Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult Function(bool sendSOS)? timerEnded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_PickedTimeState value) pickedTime,
    required TResult Function(_TimerStartedState value) timerStarted,
    required TResult Function(_TickingState value) ticking,
    required TResult Function(_TimerEndedState value) timerEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_PickedTimeState value)? pickedTime,
    TResult? Function(_TimerStartedState value)? timerStarted,
    TResult? Function(_TickingState value)? ticking,
    TResult? Function(_TimerEndedState value)? timerEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_PickedTimeState value)? pickedTime,
    TResult Function(_TimerStartedState value)? timerStarted,
    TResult Function(_TickingState value)? ticking,
    TResult Function(_TimerEndedState value)? timerEnded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialStateImpl extends _InitialState {
  const _$InitialStateImpl() : super._();

  @override
  String toString() {
    return 'TimerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int seconds) pickedTime,
    required TResult Function(int seconds) timerStarted,
    required TResult Function(
            DateTime targetSeconds, int seconds, int setSeconds)
        ticking,
    required TResult Function(bool sendSOS) timerEnded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int seconds)? pickedTime,
    TResult? Function(int seconds)? timerStarted,
    TResult? Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult? Function(bool sendSOS)? timerEnded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int seconds)? pickedTime,
    TResult Function(int seconds)? timerStarted,
    TResult Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult Function(bool sendSOS)? timerEnded,
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
    required TResult Function(_InitialState value) initial,
    required TResult Function(_PickedTimeState value) pickedTime,
    required TResult Function(_TimerStartedState value) timerStarted,
    required TResult Function(_TickingState value) ticking,
    required TResult Function(_TimerEndedState value) timerEnded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_PickedTimeState value)? pickedTime,
    TResult? Function(_TimerStartedState value)? timerStarted,
    TResult? Function(_TickingState value)? ticking,
    TResult? Function(_TimerEndedState value)? timerEnded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_PickedTimeState value)? pickedTime,
    TResult Function(_TimerStartedState value)? timerStarted,
    TResult Function(_TickingState value)? ticking,
    TResult Function(_TimerEndedState value)? timerEnded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState extends TimerState {
  const factory _InitialState() = _$InitialStateImpl;
  const _InitialState._() : super._();
}

/// @nodoc
abstract class _$$PickedTimeStateImplCopyWith<$Res> {
  factory _$$PickedTimeStateImplCopyWith(_$PickedTimeStateImpl value,
          $Res Function(_$PickedTimeStateImpl) then) =
      __$$PickedTimeStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int seconds});
}

/// @nodoc
class __$$PickedTimeStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$PickedTimeStateImpl>
    implements _$$PickedTimeStateImplCopyWith<$Res> {
  __$$PickedTimeStateImplCopyWithImpl(
      _$PickedTimeStateImpl _value, $Res Function(_$PickedTimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
  }) {
    return _then(_$PickedTimeStateImpl(
      null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PickedTimeStateImpl extends _PickedTimeState {
  const _$PickedTimeStateImpl(this.seconds) : super._();

  @override
  final int seconds;

  @override
  String toString() {
    return 'TimerState.pickedTime(seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickedTimeStateImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickedTimeStateImplCopyWith<_$PickedTimeStateImpl> get copyWith =>
      __$$PickedTimeStateImplCopyWithImpl<_$PickedTimeStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int seconds) pickedTime,
    required TResult Function(int seconds) timerStarted,
    required TResult Function(
            DateTime targetSeconds, int seconds, int setSeconds)
        ticking,
    required TResult Function(bool sendSOS) timerEnded,
  }) {
    return pickedTime(seconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int seconds)? pickedTime,
    TResult? Function(int seconds)? timerStarted,
    TResult? Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult? Function(bool sendSOS)? timerEnded,
  }) {
    return pickedTime?.call(seconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int seconds)? pickedTime,
    TResult Function(int seconds)? timerStarted,
    TResult Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult Function(bool sendSOS)? timerEnded,
    required TResult orElse(),
  }) {
    if (pickedTime != null) {
      return pickedTime(seconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_PickedTimeState value) pickedTime,
    required TResult Function(_TimerStartedState value) timerStarted,
    required TResult Function(_TickingState value) ticking,
    required TResult Function(_TimerEndedState value) timerEnded,
  }) {
    return pickedTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_PickedTimeState value)? pickedTime,
    TResult? Function(_TimerStartedState value)? timerStarted,
    TResult? Function(_TickingState value)? ticking,
    TResult? Function(_TimerEndedState value)? timerEnded,
  }) {
    return pickedTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_PickedTimeState value)? pickedTime,
    TResult Function(_TimerStartedState value)? timerStarted,
    TResult Function(_TickingState value)? ticking,
    TResult Function(_TimerEndedState value)? timerEnded,
    required TResult orElse(),
  }) {
    if (pickedTime != null) {
      return pickedTime(this);
    }
    return orElse();
  }
}

abstract class _PickedTimeState extends TimerState {
  const factory _PickedTimeState(final int seconds) = _$PickedTimeStateImpl;
  const _PickedTimeState._() : super._();

  int get seconds;
  @JsonKey(ignore: true)
  _$$PickedTimeStateImplCopyWith<_$PickedTimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerStartedStateImplCopyWith<$Res> {
  factory _$$TimerStartedStateImplCopyWith(_$TimerStartedStateImpl value,
          $Res Function(_$TimerStartedStateImpl) then) =
      __$$TimerStartedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int seconds});
}

/// @nodoc
class __$$TimerStartedStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStartedStateImpl>
    implements _$$TimerStartedStateImplCopyWith<$Res> {
  __$$TimerStartedStateImplCopyWithImpl(_$TimerStartedStateImpl _value,
      $Res Function(_$TimerStartedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
  }) {
    return _then(_$TimerStartedStateImpl(
      null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerStartedStateImpl extends _TimerStartedState {
  const _$TimerStartedStateImpl(this.seconds) : super._();

  @override
  final int seconds;

  @override
  String toString() {
    return 'TimerState.timerStarted(seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStartedStateImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStartedStateImplCopyWith<_$TimerStartedStateImpl> get copyWith =>
      __$$TimerStartedStateImplCopyWithImpl<_$TimerStartedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int seconds) pickedTime,
    required TResult Function(int seconds) timerStarted,
    required TResult Function(
            DateTime targetSeconds, int seconds, int setSeconds)
        ticking,
    required TResult Function(bool sendSOS) timerEnded,
  }) {
    return timerStarted(seconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int seconds)? pickedTime,
    TResult? Function(int seconds)? timerStarted,
    TResult? Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult? Function(bool sendSOS)? timerEnded,
  }) {
    return timerStarted?.call(seconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int seconds)? pickedTime,
    TResult Function(int seconds)? timerStarted,
    TResult Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult Function(bool sendSOS)? timerEnded,
    required TResult orElse(),
  }) {
    if (timerStarted != null) {
      return timerStarted(seconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_PickedTimeState value) pickedTime,
    required TResult Function(_TimerStartedState value) timerStarted,
    required TResult Function(_TickingState value) ticking,
    required TResult Function(_TimerEndedState value) timerEnded,
  }) {
    return timerStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_PickedTimeState value)? pickedTime,
    TResult? Function(_TimerStartedState value)? timerStarted,
    TResult? Function(_TickingState value)? ticking,
    TResult? Function(_TimerEndedState value)? timerEnded,
  }) {
    return timerStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_PickedTimeState value)? pickedTime,
    TResult Function(_TimerStartedState value)? timerStarted,
    TResult Function(_TickingState value)? ticking,
    TResult Function(_TimerEndedState value)? timerEnded,
    required TResult orElse(),
  }) {
    if (timerStarted != null) {
      return timerStarted(this);
    }
    return orElse();
  }
}

abstract class _TimerStartedState extends TimerState {
  const factory _TimerStartedState(final int seconds) = _$TimerStartedStateImpl;
  const _TimerStartedState._() : super._();

  int get seconds;
  @JsonKey(ignore: true)
  _$$TimerStartedStateImplCopyWith<_$TimerStartedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TickingStateImplCopyWith<$Res> {
  factory _$$TickingStateImplCopyWith(
          _$TickingStateImpl value, $Res Function(_$TickingStateImpl) then) =
      __$$TickingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime targetSeconds, int seconds, int setSeconds});
}

/// @nodoc
class __$$TickingStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TickingStateImpl>
    implements _$$TickingStateImplCopyWith<$Res> {
  __$$TickingStateImplCopyWithImpl(
      _$TickingStateImpl _value, $Res Function(_$TickingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetSeconds = null,
    Object? seconds = null,
    Object? setSeconds = null,
  }) {
    return _then(_$TickingStateImpl(
      targetSeconds: null == targetSeconds
          ? _value.targetSeconds
          : targetSeconds // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      setSeconds: null == setSeconds
          ? _value.setSeconds
          : setSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TickingStateImpl extends _TickingState {
  const _$TickingStateImpl(
      {required this.targetSeconds,
      required this.seconds,
      required this.setSeconds})
      : super._();

  @override
  final DateTime targetSeconds;
  @override
  final int seconds;
  @override
  final int setSeconds;

  @override
  String toString() {
    return 'TimerState.ticking(targetSeconds: $targetSeconds, seconds: $seconds, setSeconds: $setSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TickingStateImpl &&
            (identical(other.targetSeconds, targetSeconds) ||
                other.targetSeconds == targetSeconds) &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.setSeconds, setSeconds) ||
                other.setSeconds == setSeconds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, targetSeconds, seconds, setSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TickingStateImplCopyWith<_$TickingStateImpl> get copyWith =>
      __$$TickingStateImplCopyWithImpl<_$TickingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int seconds) pickedTime,
    required TResult Function(int seconds) timerStarted,
    required TResult Function(
            DateTime targetSeconds, int seconds, int setSeconds)
        ticking,
    required TResult Function(bool sendSOS) timerEnded,
  }) {
    return ticking(targetSeconds, seconds, setSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int seconds)? pickedTime,
    TResult? Function(int seconds)? timerStarted,
    TResult? Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult? Function(bool sendSOS)? timerEnded,
  }) {
    return ticking?.call(targetSeconds, seconds, setSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int seconds)? pickedTime,
    TResult Function(int seconds)? timerStarted,
    TResult Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult Function(bool sendSOS)? timerEnded,
    required TResult orElse(),
  }) {
    if (ticking != null) {
      return ticking(targetSeconds, seconds, setSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_PickedTimeState value) pickedTime,
    required TResult Function(_TimerStartedState value) timerStarted,
    required TResult Function(_TickingState value) ticking,
    required TResult Function(_TimerEndedState value) timerEnded,
  }) {
    return ticking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_PickedTimeState value)? pickedTime,
    TResult? Function(_TimerStartedState value)? timerStarted,
    TResult? Function(_TickingState value)? ticking,
    TResult? Function(_TimerEndedState value)? timerEnded,
  }) {
    return ticking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_PickedTimeState value)? pickedTime,
    TResult Function(_TimerStartedState value)? timerStarted,
    TResult Function(_TickingState value)? ticking,
    TResult Function(_TimerEndedState value)? timerEnded,
    required TResult orElse(),
  }) {
    if (ticking != null) {
      return ticking(this);
    }
    return orElse();
  }
}

abstract class _TickingState extends TimerState {
  const factory _TickingState(
      {required final DateTime targetSeconds,
      required final int seconds,
      required final int setSeconds}) = _$TickingStateImpl;
  const _TickingState._() : super._();

  DateTime get targetSeconds;
  int get seconds;
  int get setSeconds;
  @JsonKey(ignore: true)
  _$$TickingStateImplCopyWith<_$TickingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerEndedStateImplCopyWith<$Res> {
  factory _$$TimerEndedStateImplCopyWith(_$TimerEndedStateImpl value,
          $Res Function(_$TimerEndedStateImpl) then) =
      __$$TimerEndedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool sendSOS});
}

/// @nodoc
class __$$TimerEndedStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerEndedStateImpl>
    implements _$$TimerEndedStateImplCopyWith<$Res> {
  __$$TimerEndedStateImplCopyWithImpl(
      _$TimerEndedStateImpl _value, $Res Function(_$TimerEndedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendSOS = null,
  }) {
    return _then(_$TimerEndedStateImpl(
      null == sendSOS
          ? _value.sendSOS
          : sendSOS // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TimerEndedStateImpl extends _TimerEndedState {
  const _$TimerEndedStateImpl(this.sendSOS) : super._();

  @override
  final bool sendSOS;

  @override
  String toString() {
    return 'TimerState.timerEnded(sendSOS: $sendSOS)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerEndedStateImpl &&
            (identical(other.sendSOS, sendSOS) || other.sendSOS == sendSOS));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendSOS);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerEndedStateImplCopyWith<_$TimerEndedStateImpl> get copyWith =>
      __$$TimerEndedStateImplCopyWithImpl<_$TimerEndedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int seconds) pickedTime,
    required TResult Function(int seconds) timerStarted,
    required TResult Function(
            DateTime targetSeconds, int seconds, int setSeconds)
        ticking,
    required TResult Function(bool sendSOS) timerEnded,
  }) {
    return timerEnded(sendSOS);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int seconds)? pickedTime,
    TResult? Function(int seconds)? timerStarted,
    TResult? Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult? Function(bool sendSOS)? timerEnded,
  }) {
    return timerEnded?.call(sendSOS);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int seconds)? pickedTime,
    TResult Function(int seconds)? timerStarted,
    TResult Function(DateTime targetSeconds, int seconds, int setSeconds)?
        ticking,
    TResult Function(bool sendSOS)? timerEnded,
    required TResult orElse(),
  }) {
    if (timerEnded != null) {
      return timerEnded(sendSOS);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_PickedTimeState value) pickedTime,
    required TResult Function(_TimerStartedState value) timerStarted,
    required TResult Function(_TickingState value) ticking,
    required TResult Function(_TimerEndedState value) timerEnded,
  }) {
    return timerEnded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_PickedTimeState value)? pickedTime,
    TResult? Function(_TimerStartedState value)? timerStarted,
    TResult? Function(_TickingState value)? ticking,
    TResult? Function(_TimerEndedState value)? timerEnded,
  }) {
    return timerEnded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_PickedTimeState value)? pickedTime,
    TResult Function(_TimerStartedState value)? timerStarted,
    TResult Function(_TickingState value)? ticking,
    TResult Function(_TimerEndedState value)? timerEnded,
    required TResult orElse(),
  }) {
    if (timerEnded != null) {
      return timerEnded(this);
    }
    return orElse();
  }
}

abstract class _TimerEndedState extends TimerState {
  const factory _TimerEndedState(final bool sendSOS) = _$TimerEndedStateImpl;
  const _TimerEndedState._() : super._();

  bool get sendSOS;
  @JsonKey(ignore: true)
  _$$TimerEndedStateImplCopyWith<_$TimerEndedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
