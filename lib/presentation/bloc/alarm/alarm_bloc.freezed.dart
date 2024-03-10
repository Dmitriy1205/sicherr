// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AlarmState {
  bool get isAlarmPlaying => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAlarmPlaying) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAlarmPlaying)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAlarmPlaying)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmStateCopyWith<AlarmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmStateCopyWith<$Res> {
  factory $AlarmStateCopyWith(
          AlarmState value, $Res Function(AlarmState) then) =
      _$AlarmStateCopyWithImpl<$Res, AlarmState>;
  @useResult
  $Res call({bool isAlarmPlaying});
}

/// @nodoc
class _$AlarmStateCopyWithImpl<$Res, $Val extends AlarmState>
    implements $AlarmStateCopyWith<$Res> {
  _$AlarmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAlarmPlaying = null,
  }) {
    return _then(_value.copyWith(
      isAlarmPlaying: null == isAlarmPlaying
          ? _value.isAlarmPlaying
          : isAlarmPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $AlarmStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAlarmPlaying});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AlarmStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAlarmPlaying = null,
  }) {
    return _then(_$LoadedImpl(
      isAlarmPlaying: null == isAlarmPlaying
          ? _value.isAlarmPlaying
          : isAlarmPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.isAlarmPlaying});

  @override
  final bool isAlarmPlaying;

  @override
  String toString() {
    return 'AlarmState.loaded(isAlarmPlaying: $isAlarmPlaying)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.isAlarmPlaying, isAlarmPlaying) ||
                other.isAlarmPlaying == isAlarmPlaying));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAlarmPlaying);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAlarmPlaying) loaded,
  }) {
    return loaded(isAlarmPlaying);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAlarmPlaying)? loaded,
  }) {
    return loaded?.call(isAlarmPlaying);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAlarmPlaying)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(isAlarmPlaying);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AlarmState {
  const factory _Loaded({required final bool isAlarmPlaying}) = _$LoadedImpl;

  @override
  bool get isAlarmPlaying;
  @override
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AlarmEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playAlarm,
    required TResult Function() stopAlarm,
    required TResult Function() playerChangedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playAlarm,
    TResult? Function()? stopAlarm,
    TResult? Function()? playerChangedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playAlarm,
    TResult Function()? stopAlarm,
    TResult Function()? playerChangedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayAlarm value) playAlarm,
    required TResult Function(_StopAlarm value) stopAlarm,
    required TResult Function(_PlayerChangedState value) playerChangedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlayAlarm value)? playAlarm,
    TResult? Function(_StopAlarm value)? stopAlarm,
    TResult? Function(_PlayerChangedState value)? playerChangedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayAlarm value)? playAlarm,
    TResult Function(_StopAlarm value)? stopAlarm,
    TResult Function(_PlayerChangedState value)? playerChangedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmEventCopyWith<$Res> {
  factory $AlarmEventCopyWith(
          AlarmEvent value, $Res Function(AlarmEvent) then) =
      _$AlarmEventCopyWithImpl<$Res, AlarmEvent>;
}

/// @nodoc
class _$AlarmEventCopyWithImpl<$Res, $Val extends AlarmEvent>
    implements $AlarmEventCopyWith<$Res> {
  _$AlarmEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlayAlarmImplCopyWith<$Res> {
  factory _$$PlayAlarmImplCopyWith(
          _$PlayAlarmImpl value, $Res Function(_$PlayAlarmImpl) then) =
      __$$PlayAlarmImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayAlarmImplCopyWithImpl<$Res>
    extends _$AlarmEventCopyWithImpl<$Res, _$PlayAlarmImpl>
    implements _$$PlayAlarmImplCopyWith<$Res> {
  __$$PlayAlarmImplCopyWithImpl(
      _$PlayAlarmImpl _value, $Res Function(_$PlayAlarmImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlayAlarmImpl implements _PlayAlarm {
  const _$PlayAlarmImpl();

  @override
  String toString() {
    return 'AlarmEvent.playAlarm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlayAlarmImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playAlarm,
    required TResult Function() stopAlarm,
    required TResult Function() playerChangedState,
  }) {
    return playAlarm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playAlarm,
    TResult? Function()? stopAlarm,
    TResult? Function()? playerChangedState,
  }) {
    return playAlarm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playAlarm,
    TResult Function()? stopAlarm,
    TResult Function()? playerChangedState,
    required TResult orElse(),
  }) {
    if (playAlarm != null) {
      return playAlarm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayAlarm value) playAlarm,
    required TResult Function(_StopAlarm value) stopAlarm,
    required TResult Function(_PlayerChangedState value) playerChangedState,
  }) {
    return playAlarm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlayAlarm value)? playAlarm,
    TResult? Function(_StopAlarm value)? stopAlarm,
    TResult? Function(_PlayerChangedState value)? playerChangedState,
  }) {
    return playAlarm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayAlarm value)? playAlarm,
    TResult Function(_StopAlarm value)? stopAlarm,
    TResult Function(_PlayerChangedState value)? playerChangedState,
    required TResult orElse(),
  }) {
    if (playAlarm != null) {
      return playAlarm(this);
    }
    return orElse();
  }
}

abstract class _PlayAlarm implements AlarmEvent {
  const factory _PlayAlarm() = _$PlayAlarmImpl;
}

/// @nodoc
abstract class _$$StopAlarmImplCopyWith<$Res> {
  factory _$$StopAlarmImplCopyWith(
          _$StopAlarmImpl value, $Res Function(_$StopAlarmImpl) then) =
      __$$StopAlarmImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopAlarmImplCopyWithImpl<$Res>
    extends _$AlarmEventCopyWithImpl<$Res, _$StopAlarmImpl>
    implements _$$StopAlarmImplCopyWith<$Res> {
  __$$StopAlarmImplCopyWithImpl(
      _$StopAlarmImpl _value, $Res Function(_$StopAlarmImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StopAlarmImpl implements _StopAlarm {
  const _$StopAlarmImpl();

  @override
  String toString() {
    return 'AlarmEvent.stopAlarm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopAlarmImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playAlarm,
    required TResult Function() stopAlarm,
    required TResult Function() playerChangedState,
  }) {
    return stopAlarm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playAlarm,
    TResult? Function()? stopAlarm,
    TResult? Function()? playerChangedState,
  }) {
    return stopAlarm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playAlarm,
    TResult Function()? stopAlarm,
    TResult Function()? playerChangedState,
    required TResult orElse(),
  }) {
    if (stopAlarm != null) {
      return stopAlarm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayAlarm value) playAlarm,
    required TResult Function(_StopAlarm value) stopAlarm,
    required TResult Function(_PlayerChangedState value) playerChangedState,
  }) {
    return stopAlarm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlayAlarm value)? playAlarm,
    TResult? Function(_StopAlarm value)? stopAlarm,
    TResult? Function(_PlayerChangedState value)? playerChangedState,
  }) {
    return stopAlarm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayAlarm value)? playAlarm,
    TResult Function(_StopAlarm value)? stopAlarm,
    TResult Function(_PlayerChangedState value)? playerChangedState,
    required TResult orElse(),
  }) {
    if (stopAlarm != null) {
      return stopAlarm(this);
    }
    return orElse();
  }
}

abstract class _StopAlarm implements AlarmEvent {
  const factory _StopAlarm() = _$StopAlarmImpl;
}

/// @nodoc
abstract class _$$PlayerChangedStateImplCopyWith<$Res> {
  factory _$$PlayerChangedStateImplCopyWith(_$PlayerChangedStateImpl value,
          $Res Function(_$PlayerChangedStateImpl) then) =
      __$$PlayerChangedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerChangedStateImplCopyWithImpl<$Res>
    extends _$AlarmEventCopyWithImpl<$Res, _$PlayerChangedStateImpl>
    implements _$$PlayerChangedStateImplCopyWith<$Res> {
  __$$PlayerChangedStateImplCopyWithImpl(_$PlayerChangedStateImpl _value,
      $Res Function(_$PlayerChangedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlayerChangedStateImpl implements _PlayerChangedState {
  const _$PlayerChangedStateImpl();

  @override
  String toString() {
    return 'AlarmEvent.playerChangedState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlayerChangedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playAlarm,
    required TResult Function() stopAlarm,
    required TResult Function() playerChangedState,
  }) {
    return playerChangedState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playAlarm,
    TResult? Function()? stopAlarm,
    TResult? Function()? playerChangedState,
  }) {
    return playerChangedState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playAlarm,
    TResult Function()? stopAlarm,
    TResult Function()? playerChangedState,
    required TResult orElse(),
  }) {
    if (playerChangedState != null) {
      return playerChangedState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayAlarm value) playAlarm,
    required TResult Function(_StopAlarm value) stopAlarm,
    required TResult Function(_PlayerChangedState value) playerChangedState,
  }) {
    return playerChangedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlayAlarm value)? playAlarm,
    TResult? Function(_StopAlarm value)? stopAlarm,
    TResult? Function(_PlayerChangedState value)? playerChangedState,
  }) {
    return playerChangedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayAlarm value)? playAlarm,
    TResult Function(_StopAlarm value)? stopAlarm,
    TResult Function(_PlayerChangedState value)? playerChangedState,
    required TResult orElse(),
  }) {
    if (playerChangedState != null) {
      return playerChangedState(this);
    }
    return orElse();
  }
}

abstract class _PlayerChangedState implements AlarmEvent {
  const factory _PlayerChangedState() = _$PlayerChangedStateImpl;
}
