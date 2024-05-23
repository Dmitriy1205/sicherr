// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DcEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllDC,
    required TResult Function(dynamic dangerContact) addToDC,
    required TResult Function(String dcId) removeFromDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllDC,
    TResult? Function(dynamic dangerContact)? addToDC,
    TResult? Function(String dcId)? removeFromDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllDC,
    TResult Function(dynamic dangerContact)? addToDC,
    TResult Function(String dcId)? removeFromDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllDC value) getAllDC,
    required TResult Function(_AddToDC value) addToDC,
    required TResult Function(_RemoveFromDC value) removeFromDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllDC value)? getAllDC,
    TResult? Function(_AddToDC value)? addToDC,
    TResult? Function(_RemoveFromDC value)? removeFromDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllDC value)? getAllDC,
    TResult Function(_AddToDC value)? addToDC,
    TResult Function(_RemoveFromDC value)? removeFromDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DcEventCopyWith<$Res> {
  factory $DcEventCopyWith(DcEvent value, $Res Function(DcEvent) then) =
      _$DcEventCopyWithImpl<$Res, DcEvent>;
}

/// @nodoc
class _$DcEventCopyWithImpl<$Res, $Val extends DcEvent>
    implements $DcEventCopyWith<$Res> {
  _$DcEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllDCImplCopyWith<$Res> {
  factory _$$GetAllDCImplCopyWith(
          _$GetAllDCImpl value, $Res Function(_$GetAllDCImpl) then) =
      __$$GetAllDCImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllDCImplCopyWithImpl<$Res>
    extends _$DcEventCopyWithImpl<$Res, _$GetAllDCImpl>
    implements _$$GetAllDCImplCopyWith<$Res> {
  __$$GetAllDCImplCopyWithImpl(
      _$GetAllDCImpl _value, $Res Function(_$GetAllDCImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllDCImpl implements _GetAllDC {
  const _$GetAllDCImpl();

  @override
  String toString() {
    return 'DcEvent.getAllDC()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllDCImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllDC,
    required TResult Function(dynamic dangerContact) addToDC,
    required TResult Function(String dcId) removeFromDC,
  }) {
    return getAllDC();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllDC,
    TResult? Function(dynamic dangerContact)? addToDC,
    TResult? Function(String dcId)? removeFromDC,
  }) {
    return getAllDC?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllDC,
    TResult Function(dynamic dangerContact)? addToDC,
    TResult Function(String dcId)? removeFromDC,
    required TResult orElse(),
  }) {
    if (getAllDC != null) {
      return getAllDC();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllDC value) getAllDC,
    required TResult Function(_AddToDC value) addToDC,
    required TResult Function(_RemoveFromDC value) removeFromDC,
  }) {
    return getAllDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllDC value)? getAllDC,
    TResult? Function(_AddToDC value)? addToDC,
    TResult? Function(_RemoveFromDC value)? removeFromDC,
  }) {
    return getAllDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllDC value)? getAllDC,
    TResult Function(_AddToDC value)? addToDC,
    TResult Function(_RemoveFromDC value)? removeFromDC,
    required TResult orElse(),
  }) {
    if (getAllDC != null) {
      return getAllDC(this);
    }
    return orElse();
  }
}

abstract class _GetAllDC implements DcEvent {
  const factory _GetAllDC() = _$GetAllDCImpl;
}

/// @nodoc
abstract class _$$AddToDCImplCopyWith<$Res> {
  factory _$$AddToDCImplCopyWith(
          _$AddToDCImpl value, $Res Function(_$AddToDCImpl) then) =
      __$$AddToDCImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic dangerContact});
}

/// @nodoc
class __$$AddToDCImplCopyWithImpl<$Res>
    extends _$DcEventCopyWithImpl<$Res, _$AddToDCImpl>
    implements _$$AddToDCImplCopyWith<$Res> {
  __$$AddToDCImplCopyWithImpl(
      _$AddToDCImpl _value, $Res Function(_$AddToDCImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dangerContact = freezed,
  }) {
    return _then(_$AddToDCImpl(
      dangerContact: freezed == dangerContact
          ? _value.dangerContact
          : dangerContact // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AddToDCImpl implements _AddToDC {
  const _$AddToDCImpl({required this.dangerContact});

  @override
  final dynamic dangerContact;

  @override
  String toString() {
    return 'DcEvent.addToDC(dangerContact: $dangerContact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToDCImpl &&
            const DeepCollectionEquality()
                .equals(other.dangerContact, dangerContact));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(dangerContact));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToDCImplCopyWith<_$AddToDCImpl> get copyWith =>
      __$$AddToDCImplCopyWithImpl<_$AddToDCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllDC,
    required TResult Function(dynamic dangerContact) addToDC,
    required TResult Function(String dcId) removeFromDC,
  }) {
    return addToDC(dangerContact);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllDC,
    TResult? Function(dynamic dangerContact)? addToDC,
    TResult? Function(String dcId)? removeFromDC,
  }) {
    return addToDC?.call(dangerContact);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllDC,
    TResult Function(dynamic dangerContact)? addToDC,
    TResult Function(String dcId)? removeFromDC,
    required TResult orElse(),
  }) {
    if (addToDC != null) {
      return addToDC(dangerContact);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllDC value) getAllDC,
    required TResult Function(_AddToDC value) addToDC,
    required TResult Function(_RemoveFromDC value) removeFromDC,
  }) {
    return addToDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllDC value)? getAllDC,
    TResult? Function(_AddToDC value)? addToDC,
    TResult? Function(_RemoveFromDC value)? removeFromDC,
  }) {
    return addToDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllDC value)? getAllDC,
    TResult Function(_AddToDC value)? addToDC,
    TResult Function(_RemoveFromDC value)? removeFromDC,
    required TResult orElse(),
  }) {
    if (addToDC != null) {
      return addToDC(this);
    }
    return orElse();
  }
}

abstract class _AddToDC implements DcEvent {
  const factory _AddToDC({required final dynamic dangerContact}) =
      _$AddToDCImpl;

  dynamic get dangerContact;
  @JsonKey(ignore: true)
  _$$AddToDCImplCopyWith<_$AddToDCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromDCImplCopyWith<$Res> {
  factory _$$RemoveFromDCImplCopyWith(
          _$RemoveFromDCImpl value, $Res Function(_$RemoveFromDCImpl) then) =
      __$$RemoveFromDCImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String dcId});
}

/// @nodoc
class __$$RemoveFromDCImplCopyWithImpl<$Res>
    extends _$DcEventCopyWithImpl<$Res, _$RemoveFromDCImpl>
    implements _$$RemoveFromDCImplCopyWith<$Res> {
  __$$RemoveFromDCImplCopyWithImpl(
      _$RemoveFromDCImpl _value, $Res Function(_$RemoveFromDCImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dcId = null,
  }) {
    return _then(_$RemoveFromDCImpl(
      dcId: null == dcId
          ? _value.dcId
          : dcId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveFromDCImpl implements _RemoveFromDC {
  const _$RemoveFromDCImpl({required this.dcId});

  @override
  final String dcId;

  @override
  String toString() {
    return 'DcEvent.removeFromDC(dcId: $dcId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromDCImpl &&
            (identical(other.dcId, dcId) || other.dcId == dcId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dcId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromDCImplCopyWith<_$RemoveFromDCImpl> get copyWith =>
      __$$RemoveFromDCImplCopyWithImpl<_$RemoveFromDCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllDC,
    required TResult Function(dynamic dangerContact) addToDC,
    required TResult Function(String dcId) removeFromDC,
  }) {
    return removeFromDC(dcId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllDC,
    TResult? Function(dynamic dangerContact)? addToDC,
    TResult? Function(String dcId)? removeFromDC,
  }) {
    return removeFromDC?.call(dcId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllDC,
    TResult Function(dynamic dangerContact)? addToDC,
    TResult Function(String dcId)? removeFromDC,
    required TResult orElse(),
  }) {
    if (removeFromDC != null) {
      return removeFromDC(dcId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllDC value) getAllDC,
    required TResult Function(_AddToDC value) addToDC,
    required TResult Function(_RemoveFromDC value) removeFromDC,
  }) {
    return removeFromDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllDC value)? getAllDC,
    TResult? Function(_AddToDC value)? addToDC,
    TResult? Function(_RemoveFromDC value)? removeFromDC,
  }) {
    return removeFromDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllDC value)? getAllDC,
    TResult Function(_AddToDC value)? addToDC,
    TResult Function(_RemoveFromDC value)? removeFromDC,
    required TResult orElse(),
  }) {
    if (removeFromDC != null) {
      return removeFromDC(this);
    }
    return orElse();
  }
}

abstract class _RemoveFromDC implements DcEvent {
  const factory _RemoveFromDC({required final String dcId}) =
      _$RemoveFromDCImpl;

  String get dcId;
  @JsonKey(ignore: true)
  _$$RemoveFromDCImplCopyWith<_$RemoveFromDCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DcState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ContactEntity> dc) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> dc)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> dc)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DcStateCopyWith<$Res> {
  factory $DcStateCopyWith(DcState value, $Res Function(DcState) then) =
      _$DcStateCopyWithImpl<$Res, DcState>;
}

/// @nodoc
class _$DcStateCopyWithImpl<$Res, $Val extends DcState>
    implements $DcStateCopyWith<$Res> {
  _$DcStateCopyWithImpl(this._value, this._then);

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
    extends _$DcStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'DcState.initial()';
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
    required TResult Function(List<ContactEntity> dc) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> dc)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> dc)? loaded,
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
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends DcState {
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
    extends _$DcStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'DcState.loading()';
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
    required TResult Function(List<ContactEntity> dc) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> dc)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> dc)? loaded,
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
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends DcState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ContactEntity> dc});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$DcStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dc = null,
  }) {
    return _then(_$LoadedImpl(
      dc: null == dc
          ? _value._dc
          : dc // ignore: cast_nullable_to_non_nullable
              as List<ContactEntity>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl({required final List<ContactEntity> dc})
      : _dc = dc,
        super._();

  final List<ContactEntity> _dc;
  @override
  List<ContactEntity> get dc {
    if (_dc is EqualUnmodifiableListView) return _dc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dc);
  }

  @override
  String toString() {
    return 'DcState.loaded(dc: $dc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._dc, _dc));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_dc));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ContactEntity> dc) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(dc);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> dc)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(dc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> dc)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(dc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
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
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends DcState {
  const factory _Loaded({required final List<ContactEntity> dc}) = _$LoadedImpl;
  const _Loaded._() : super._();

  List<ContactEntity> get dc;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
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
    extends _$DcStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'DcState.error(error: $error)';
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
    required TResult Function(List<ContactEntity> dc) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> dc)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> dc)? loaded,
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
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends DcState {
  const factory _Error({required final String error}) = _$ErrorImpl;
  const _Error._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
