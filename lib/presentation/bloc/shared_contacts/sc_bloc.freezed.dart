// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSC,
    required TResult Function(String contactId, String taName) addTag,
    required TResult Function(String contactId, String rate) addRemoveRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllSC,
    TResult? Function(String contactId, String taName)? addTag,
    TResult? Function(String contactId, String rate)? addRemoveRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSC,
    TResult Function(String contactId, String taName)? addTag,
    TResult Function(String contactId, String rate)? addRemoveRating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllSC value) getAllSC,
    required TResult Function(_AddTag value) addTag,
    required TResult Function(_AddRemoveRating value) addRemoveRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllSC value)? getAllSC,
    TResult? Function(_AddTag value)? addTag,
    TResult? Function(_AddRemoveRating value)? addRemoveRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllSC value)? getAllSC,
    TResult Function(_AddTag value)? addTag,
    TResult Function(_AddRemoveRating value)? addRemoveRating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScEventCopyWith<$Res> {
  factory $ScEventCopyWith(ScEvent value, $Res Function(ScEvent) then) =
      _$ScEventCopyWithImpl<$Res, ScEvent>;
}

/// @nodoc
class _$ScEventCopyWithImpl<$Res, $Val extends ScEvent>
    implements $ScEventCopyWith<$Res> {
  _$ScEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllSCImplCopyWith<$Res> {
  factory _$$GetAllSCImplCopyWith(
          _$GetAllSCImpl value, $Res Function(_$GetAllSCImpl) then) =
      __$$GetAllSCImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllSCImplCopyWithImpl<$Res>
    extends _$ScEventCopyWithImpl<$Res, _$GetAllSCImpl>
    implements _$$GetAllSCImplCopyWith<$Res> {
  __$$GetAllSCImplCopyWithImpl(
      _$GetAllSCImpl _value, $Res Function(_$GetAllSCImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllSCImpl implements _GetAllSC {
  const _$GetAllSCImpl();

  @override
  String toString() {
    return 'ScEvent.getAllSC()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllSCImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSC,
    required TResult Function(String contactId, String taName) addTag,
    required TResult Function(String contactId, String rate) addRemoveRating,
  }) {
    return getAllSC();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllSC,
    TResult? Function(String contactId, String taName)? addTag,
    TResult? Function(String contactId, String rate)? addRemoveRating,
  }) {
    return getAllSC?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSC,
    TResult Function(String contactId, String taName)? addTag,
    TResult Function(String contactId, String rate)? addRemoveRating,
    required TResult orElse(),
  }) {
    if (getAllSC != null) {
      return getAllSC();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllSC value) getAllSC,
    required TResult Function(_AddTag value) addTag,
    required TResult Function(_AddRemoveRating value) addRemoveRating,
  }) {
    return getAllSC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllSC value)? getAllSC,
    TResult? Function(_AddTag value)? addTag,
    TResult? Function(_AddRemoveRating value)? addRemoveRating,
  }) {
    return getAllSC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllSC value)? getAllSC,
    TResult Function(_AddTag value)? addTag,
    TResult Function(_AddRemoveRating value)? addRemoveRating,
    required TResult orElse(),
  }) {
    if (getAllSC != null) {
      return getAllSC(this);
    }
    return orElse();
  }
}

abstract class _GetAllSC implements ScEvent {
  const factory _GetAllSC() = _$GetAllSCImpl;
}

/// @nodoc
abstract class _$$AddTagImplCopyWith<$Res> {
  factory _$$AddTagImplCopyWith(
          _$AddTagImpl value, $Res Function(_$AddTagImpl) then) =
      __$$AddTagImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String contactId, String taName});
}

/// @nodoc
class __$$AddTagImplCopyWithImpl<$Res>
    extends _$ScEventCopyWithImpl<$Res, _$AddTagImpl>
    implements _$$AddTagImplCopyWith<$Res> {
  __$$AddTagImplCopyWithImpl(
      _$AddTagImpl _value, $Res Function(_$AddTagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactId = null,
    Object? taName = null,
  }) {
    return _then(_$AddTagImpl(
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      taName: null == taName
          ? _value.taName
          : taName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddTagImpl implements _AddTag {
  const _$AddTagImpl({required this.contactId, required this.taName});

  @override
  final String contactId;
  @override
  final String taName;

  @override
  String toString() {
    return 'ScEvent.addTag(contactId: $contactId, taName: $taName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTagImpl &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.taName, taName) || other.taName == taName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contactId, taName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTagImplCopyWith<_$AddTagImpl> get copyWith =>
      __$$AddTagImplCopyWithImpl<_$AddTagImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSC,
    required TResult Function(String contactId, String taName) addTag,
    required TResult Function(String contactId, String rate) addRemoveRating,
  }) {
    return addTag(contactId, taName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllSC,
    TResult? Function(String contactId, String taName)? addTag,
    TResult? Function(String contactId, String rate)? addRemoveRating,
  }) {
    return addTag?.call(contactId, taName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSC,
    TResult Function(String contactId, String taName)? addTag,
    TResult Function(String contactId, String rate)? addRemoveRating,
    required TResult orElse(),
  }) {
    if (addTag != null) {
      return addTag(contactId, taName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllSC value) getAllSC,
    required TResult Function(_AddTag value) addTag,
    required TResult Function(_AddRemoveRating value) addRemoveRating,
  }) {
    return addTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllSC value)? getAllSC,
    TResult? Function(_AddTag value)? addTag,
    TResult? Function(_AddRemoveRating value)? addRemoveRating,
  }) {
    return addTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllSC value)? getAllSC,
    TResult Function(_AddTag value)? addTag,
    TResult Function(_AddRemoveRating value)? addRemoveRating,
    required TResult orElse(),
  }) {
    if (addTag != null) {
      return addTag(this);
    }
    return orElse();
  }
}

abstract class _AddTag implements ScEvent {
  const factory _AddTag(
      {required final String contactId,
      required final String taName}) = _$AddTagImpl;

  String get contactId;
  String get taName;
  @JsonKey(ignore: true)
  _$$AddTagImplCopyWith<_$AddTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddRemoveRatingImplCopyWith<$Res> {
  factory _$$AddRemoveRatingImplCopyWith(_$AddRemoveRatingImpl value,
          $Res Function(_$AddRemoveRatingImpl) then) =
      __$$AddRemoveRatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String contactId, String rate});
}

/// @nodoc
class __$$AddRemoveRatingImplCopyWithImpl<$Res>
    extends _$ScEventCopyWithImpl<$Res, _$AddRemoveRatingImpl>
    implements _$$AddRemoveRatingImplCopyWith<$Res> {
  __$$AddRemoveRatingImplCopyWithImpl(
      _$AddRemoveRatingImpl _value, $Res Function(_$AddRemoveRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactId = null,
    Object? rate = null,
  }) {
    return _then(_$AddRemoveRatingImpl(
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddRemoveRatingImpl implements _AddRemoveRating {
  const _$AddRemoveRatingImpl({required this.contactId, required this.rate});

  @override
  final String contactId;
  @override
  final String rate;

  @override
  String toString() {
    return 'ScEvent.addRemoveRating(contactId: $contactId, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddRemoveRatingImpl &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contactId, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddRemoveRatingImplCopyWith<_$AddRemoveRatingImpl> get copyWith =>
      __$$AddRemoveRatingImplCopyWithImpl<_$AddRemoveRatingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSC,
    required TResult Function(String contactId, String taName) addTag,
    required TResult Function(String contactId, String rate) addRemoveRating,
  }) {
    return addRemoveRating(contactId, rate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllSC,
    TResult? Function(String contactId, String taName)? addTag,
    TResult? Function(String contactId, String rate)? addRemoveRating,
  }) {
    return addRemoveRating?.call(contactId, rate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSC,
    TResult Function(String contactId, String taName)? addTag,
    TResult Function(String contactId, String rate)? addRemoveRating,
    required TResult orElse(),
  }) {
    if (addRemoveRating != null) {
      return addRemoveRating(contactId, rate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllSC value) getAllSC,
    required TResult Function(_AddTag value) addTag,
    required TResult Function(_AddRemoveRating value) addRemoveRating,
  }) {
    return addRemoveRating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllSC value)? getAllSC,
    TResult? Function(_AddTag value)? addTag,
    TResult? Function(_AddRemoveRating value)? addRemoveRating,
  }) {
    return addRemoveRating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllSC value)? getAllSC,
    TResult Function(_AddTag value)? addTag,
    TResult Function(_AddRemoveRating value)? addRemoveRating,
    required TResult orElse(),
  }) {
    if (addRemoveRating != null) {
      return addRemoveRating(this);
    }
    return orElse();
  }
}

abstract class _AddRemoveRating implements ScEvent {
  const factory _AddRemoveRating(
      {required final String contactId,
      required final String rate}) = _$AddRemoveRatingImpl;

  String get contactId;
  String get rate;
  @JsonKey(ignore: true)
  _$$AddRemoveRatingImplCopyWith<_$AddRemoveRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ContactEntity> sc) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> sc)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> sc)? loaded,
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
abstract class $ScStateCopyWith<$Res> {
  factory $ScStateCopyWith(ScState value, $Res Function(ScState) then) =
      _$ScStateCopyWithImpl<$Res, ScState>;
}

/// @nodoc
class _$ScStateCopyWithImpl<$Res, $Val extends ScState>
    implements $ScStateCopyWith<$Res> {
  _$ScStateCopyWithImpl(this._value, this._then);

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
    extends _$ScStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ScState.initial()';
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
    required TResult Function(List<ContactEntity> sc) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> sc)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> sc)? loaded,
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

abstract class _Initial extends ScState {
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
    extends _$ScStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ScState.loading()';
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
    required TResult Function(List<ContactEntity> sc) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> sc)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> sc)? loaded,
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

abstract class _Loading extends ScState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ContactEntity> sc});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ScStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sc = null,
  }) {
    return _then(_$LoadedImpl(
      sc: null == sc
          ? _value._sc
          : sc // ignore: cast_nullable_to_non_nullable
              as List<ContactEntity>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl({required final List<ContactEntity> sc})
      : _sc = sc,
        super._();

  final List<ContactEntity> _sc;
  @override
  List<ContactEntity> get sc {
    if (_sc is EqualUnmodifiableListView) return _sc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sc);
  }

  @override
  String toString() {
    return 'ScState.loaded(sc: $sc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._sc, _sc));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sc));

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
    required TResult Function(List<ContactEntity> sc) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(sc);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> sc)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(sc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> sc)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(sc);
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

abstract class _Loaded extends ScState {
  const factory _Loaded({required final List<ContactEntity> sc}) = _$LoadedImpl;
  const _Loaded._() : super._();

  List<ContactEntity> get sc;
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
    extends _$ScStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'ScState.error(error: $error)';
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
    required TResult Function(List<ContactEntity> sc) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContactEntity> sc)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContactEntity> sc)? loaded,
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

abstract class _Error extends ScState {
  const factory _Error({required final String error}) = _$ErrorImpl;
  const _Error._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
