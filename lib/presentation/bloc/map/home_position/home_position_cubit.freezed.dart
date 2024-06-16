// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_position_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePositionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LatLng? position) loaded,
    required TResult Function(LatLng? position, RouteDetails routeDetails)
        routPicked,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LatLng? position)? loaded,
    TResult? Function(LatLng? position, RouteDetails routeDetails)? routPicked,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LatLng? position)? loaded,
    TResult Function(LatLng? position, RouteDetails routeDetails)? routPicked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_RoutPicked value) routPicked,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_RoutPicked value)? routPicked,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_RoutPicked value)? routPicked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePositionStateCopyWith<$Res> {
  factory $HomePositionStateCopyWith(
          HomePositionState value, $Res Function(HomePositionState) then) =
      _$HomePositionStateCopyWithImpl<$Res, HomePositionState>;
}

/// @nodoc
class _$HomePositionStateCopyWithImpl<$Res, $Val extends HomePositionState>
    implements $HomePositionStateCopyWith<$Res> {
  _$HomePositionStateCopyWithImpl(this._value, this._then);

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
    extends _$HomePositionStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'HomePositionState.initial()';
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
    required TResult Function(LatLng? position) loaded,
    required TResult Function(LatLng? position, RouteDetails routeDetails)
        routPicked,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LatLng? position)? loaded,
    TResult? Function(LatLng? position, RouteDetails routeDetails)? routPicked,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LatLng? position)? loaded,
    TResult Function(LatLng? position, RouteDetails routeDetails)? routPicked,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_RoutPicked value) routPicked,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_RoutPicked value)? routPicked,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_RoutPicked value)? routPicked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends HomePositionState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng? position});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$HomePositionStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = freezed,
  }) {
    return _then(_$LoadedImpl(
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl({required this.position}) : super._();

  @override
  final LatLng? position;

  @override
  String toString() {
    return 'HomePositionState.loaded(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LatLng? position) loaded,
    required TResult Function(LatLng? position, RouteDetails routeDetails)
        routPicked,
    required TResult Function(String error) error,
  }) {
    return loaded(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LatLng? position)? loaded,
    TResult? Function(LatLng? position, RouteDetails routeDetails)? routPicked,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LatLng? position)? loaded,
    TResult Function(LatLng? position, RouteDetails routeDetails)? routPicked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_RoutPicked value) routPicked,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_RoutPicked value)? routPicked,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_RoutPicked value)? routPicked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends HomePositionState {
  const factory _Loaded({required final LatLng? position}) = _$LoadedImpl;
  const _Loaded._() : super._();

  LatLng? get position;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoutPickedImplCopyWith<$Res> {
  factory _$$RoutPickedImplCopyWith(
          _$RoutPickedImpl value, $Res Function(_$RoutPickedImpl) then) =
      __$$RoutPickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng? position, RouteDetails routeDetails});

  $RouteDetailsCopyWith<$Res> get routeDetails;
}

/// @nodoc
class __$$RoutPickedImplCopyWithImpl<$Res>
    extends _$HomePositionStateCopyWithImpl<$Res, _$RoutPickedImpl>
    implements _$$RoutPickedImplCopyWith<$Res> {
  __$$RoutPickedImplCopyWithImpl(
      _$RoutPickedImpl _value, $Res Function(_$RoutPickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = freezed,
    Object? routeDetails = null,
  }) {
    return _then(_$RoutPickedImpl(
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      routeDetails: null == routeDetails
          ? _value.routeDetails
          : routeDetails // ignore: cast_nullable_to_non_nullable
              as RouteDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteDetailsCopyWith<$Res> get routeDetails {
    return $RouteDetailsCopyWith<$Res>(_value.routeDetails, (value) {
      return _then(_value.copyWith(routeDetails: value));
    });
  }
}

/// @nodoc

class _$RoutPickedImpl extends _RoutPicked {
  const _$RoutPickedImpl({required this.position, required this.routeDetails})
      : super._();

  @override
  final LatLng? position;
  @override
  final RouteDetails routeDetails;

  @override
  String toString() {
    return 'HomePositionState.routPicked(position: $position, routeDetails: $routeDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutPickedImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.routeDetails, routeDetails) ||
                other.routeDetails == routeDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, routeDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutPickedImplCopyWith<_$RoutPickedImpl> get copyWith =>
      __$$RoutPickedImplCopyWithImpl<_$RoutPickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LatLng? position) loaded,
    required TResult Function(LatLng? position, RouteDetails routeDetails)
        routPicked,
    required TResult Function(String error) error,
  }) {
    return routPicked(position, routeDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LatLng? position)? loaded,
    TResult? Function(LatLng? position, RouteDetails routeDetails)? routPicked,
    TResult? Function(String error)? error,
  }) {
    return routPicked?.call(position, routeDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LatLng? position)? loaded,
    TResult Function(LatLng? position, RouteDetails routeDetails)? routPicked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (routPicked != null) {
      return routPicked(position, routeDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_RoutPicked value) routPicked,
    required TResult Function(_Error value) error,
  }) {
    return routPicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_RoutPicked value)? routPicked,
    TResult? Function(_Error value)? error,
  }) {
    return routPicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_RoutPicked value)? routPicked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (routPicked != null) {
      return routPicked(this);
    }
    return orElse();
  }
}

abstract class _RoutPicked extends HomePositionState {
  const factory _RoutPicked(
      {required final LatLng? position,
      required final RouteDetails routeDetails}) = _$RoutPickedImpl;
  const _RoutPicked._() : super._();

  LatLng? get position;
  RouteDetails get routeDetails;
  @JsonKey(ignore: true)
  _$$RoutPickedImplCopyWith<_$RoutPickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$HomePositionStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'HomePositionState.error(error: $error)';
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
    required TResult Function(LatLng? position) loaded,
    required TResult Function(LatLng? position, RouteDetails routeDetails)
        routPicked,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LatLng? position)? loaded,
    TResult? Function(LatLng? position, RouteDetails routeDetails)? routPicked,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LatLng? position)? loaded,
    TResult Function(LatLng? position, RouteDetails routeDetails)? routPicked,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_RoutPicked value) routPicked,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_RoutPicked value)? routPicked,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_RoutPicked value)? routPicked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends HomePositionState {
  const factory _Error({required final String error}) = _$ErrorImpl;
  const _Error._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
