// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_dc_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PickDcState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ContactEntity> contacts,
            Map<String, List<ContactEntity>> allContactsCategorized,
            Map<String, List<ContactEntity>> searchedContactsCategorized)
        picked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ContactEntity> contacts,
            Map<String, List<ContactEntity>> allContactsCategorized,
            Map<String, List<ContactEntity>> searchedContactsCategorized)?
        picked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ContactEntity> contacts,
            Map<String, List<ContactEntity>> allContactsCategorized,
            Map<String, List<ContactEntity>> searchedContactsCategorized)?
        picked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Picked value)? picked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickDcStateCopyWith<$Res> {
  factory $PickDcStateCopyWith(
          PickDcState value, $Res Function(PickDcState) then) =
      _$PickDcStateCopyWithImpl<$Res, PickDcState>;
}

/// @nodoc
class _$PickDcStateCopyWithImpl<$Res, $Val extends PickDcState>
    implements $PickDcStateCopyWith<$Res> {
  _$PickDcStateCopyWithImpl(this._value, this._then);

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
    extends _$PickDcStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'PickDcState.initial()';
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
    required TResult Function(
            List<ContactEntity> contacts,
            Map<String, List<ContactEntity>> allContactsCategorized,
            Map<String, List<ContactEntity>> searchedContactsCategorized)
        picked,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ContactEntity> contacts,
            Map<String, List<ContactEntity>> allContactsCategorized,
            Map<String, List<ContactEntity>> searchedContactsCategorized)?
        picked,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ContactEntity> contacts,
            Map<String, List<ContactEntity>> allContactsCategorized,
            Map<String, List<ContactEntity>> searchedContactsCategorized)?
        picked,
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
    required TResult Function(_Picked value) picked,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Picked value)? picked,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PickDcState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$PickedImplCopyWith<$Res> {
  factory _$$PickedImplCopyWith(
          _$PickedImpl value, $Res Function(_$PickedImpl) then) =
      __$$PickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ContactEntity> contacts,
      Map<String, List<ContactEntity>> allContactsCategorized,
      Map<String, List<ContactEntity>> searchedContactsCategorized});
}

/// @nodoc
class __$$PickedImplCopyWithImpl<$Res>
    extends _$PickDcStateCopyWithImpl<$Res, _$PickedImpl>
    implements _$$PickedImplCopyWith<$Res> {
  __$$PickedImplCopyWithImpl(
      _$PickedImpl _value, $Res Function(_$PickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
    Object? allContactsCategorized = null,
    Object? searchedContactsCategorized = null,
  }) {
    return _then(_$PickedImpl(
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ContactEntity>,
      allContactsCategorized: null == allContactsCategorized
          ? _value._allContactsCategorized
          : allContactsCategorized // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContactEntity>>,
      searchedContactsCategorized: null == searchedContactsCategorized
          ? _value._searchedContactsCategorized
          : searchedContactsCategorized // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContactEntity>>,
    ));
  }
}

/// @nodoc

class _$PickedImpl extends _Picked {
  const _$PickedImpl(
      {required final List<ContactEntity> contacts,
      required final Map<String, List<ContactEntity>> allContactsCategorized,
      required final Map<String, List<ContactEntity>>
          searchedContactsCategorized})
      : _contacts = contacts,
        _allContactsCategorized = allContactsCategorized,
        _searchedContactsCategorized = searchedContactsCategorized,
        super._();

  final List<ContactEntity> _contacts;
  @override
  List<ContactEntity> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  final Map<String, List<ContactEntity>> _allContactsCategorized;
  @override
  Map<String, List<ContactEntity>> get allContactsCategorized {
    if (_allContactsCategorized is EqualUnmodifiableMapView)
      return _allContactsCategorized;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_allContactsCategorized);
  }

  final Map<String, List<ContactEntity>> _searchedContactsCategorized;
  @override
  Map<String, List<ContactEntity>> get searchedContactsCategorized {
    if (_searchedContactsCategorized is EqualUnmodifiableMapView)
      return _searchedContactsCategorized;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchedContactsCategorized);
  }

  @override
  String toString() {
    return 'PickDcState.picked(contacts: $contacts, allContactsCategorized: $allContactsCategorized, searchedContactsCategorized: $searchedContactsCategorized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickedImpl &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            const DeepCollectionEquality().equals(
                other._allContactsCategorized, _allContactsCategorized) &&
            const DeepCollectionEquality().equals(
                other._searchedContactsCategorized,
                _searchedContactsCategorized));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_contacts),
      const DeepCollectionEquality().hash(_allContactsCategorized),
      const DeepCollectionEquality().hash(_searchedContactsCategorized));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickedImplCopyWith<_$PickedImpl> get copyWith =>
      __$$PickedImplCopyWithImpl<_$PickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ContactEntity> contacts,
            Map<String, List<ContactEntity>> allContactsCategorized,
            Map<String, List<ContactEntity>> searchedContactsCategorized)
        picked,
  }) {
    return picked(
        contacts, allContactsCategorized, searchedContactsCategorized);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ContactEntity> contacts,
            Map<String, List<ContactEntity>> allContactsCategorized,
            Map<String, List<ContactEntity>> searchedContactsCategorized)?
        picked,
  }) {
    return picked?.call(
        contacts, allContactsCategorized, searchedContactsCategorized);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ContactEntity> contacts,
            Map<String, List<ContactEntity>> allContactsCategorized,
            Map<String, List<ContactEntity>> searchedContactsCategorized)?
        picked,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked(
          contacts, allContactsCategorized, searchedContactsCategorized);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
  }) {
    return picked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Picked value)? picked,
  }) {
    return picked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked(this);
    }
    return orElse();
  }
}

abstract class _Picked extends PickDcState {
  const factory _Picked(
      {required final List<ContactEntity> contacts,
      required final Map<String, List<ContactEntity>> allContactsCategorized,
      required final Map<String, List<ContactEntity>>
          searchedContactsCategorized}) = _$PickedImpl;
  const _Picked._() : super._();

  List<ContactEntity> get contacts;
  Map<String, List<ContactEntity>> get allContactsCategorized;
  Map<String, List<ContactEntity>> get searchedContactsCategorized;
  @JsonKey(ignore: true)
  _$$PickedImplCopyWith<_$PickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
