// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsStateCopyWith<$Res> {
  factory $ContactsStateCopyWith(
          ContactsState value, $Res Function(ContactsState) then) =
      _$ContactsStateCopyWithImpl<$Res, ContactsState>;
}

/// @nodoc
class _$ContactsStateCopyWithImpl<$Res, $Val extends ContactsState>
    implements $ContactsStateCopyWith<$Res> {
  _$ContactsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$ContactsStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadInProgressImpl extends _LoadInProgress {
  const _$LoadInProgressImpl() : super._();

  @override
  String toString() {
    return 'ContactsState.loadInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts)
        loaded,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends ContactsState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
  const _LoadInProgress._() : super._();
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<ContactEntity>> categorizedContacts});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ContactsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorizedContacts = null,
  }) {
    return _then(_$LoadedImpl(
      categorizedContacts: null == categorizedContacts
          ? _value._categorizedContacts
          : categorizedContacts // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContactEntity>>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl(

      {required final Map<String, List<ContactEntity>> categorizedContacts,
      required this.isPermissionDenied})
      : _categorizedContacts = categorizedContacts,
        super._();


// required List<ContactEntity> listContacts,
  final Map<String, List<ContactEntity>> _categorizedContacts;
// required List<ContactEntity> listContacts,
  @override
  Map<String, List<ContactEntity>> get categorizedContacts {
    if (_categorizedContacts is EqualUnmodifiableMapView)
      return _categorizedContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categorizedContacts);
  }

  @override
  String toString() {
    return 'ContactsState.loaded(categorizedContacts: $categorizedContacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._categorizedContacts, _categorizedContacts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categorizedContacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts)
        loaded,
  }) {
    return loaded(categorizedContacts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
  }) {
    return loaded?.call(categorizedContacts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categorizedContacts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends ContactsState {
  const factory _Loaded(

      {required final Map<String, List<ContactEntity>> categorizedContacts,
      required final bool isPermissionDenied}) = _$LoadedImpl;
  const _Loaded._() : super._();


// required List<ContactEntity> listContacts,
  Map<String, List<ContactEntity>> get categorizedContacts;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContactsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadContacts,
    required TResult Function(String text) searchContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadContacts,
    TResult? Function(String text)? searchContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadContacts,
    TResult Function(String text)? searchContact,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_SearchContact value) searchContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_SearchContact value)? searchContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_SearchContact value)? searchContact,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsEventCopyWith<$Res> {
  factory $ContactsEventCopyWith(
          ContactsEvent value, $Res Function(ContactsEvent) then) =
      _$ContactsEventCopyWithImpl<$Res, ContactsEvent>;
}

/// @nodoc
class _$ContactsEventCopyWithImpl<$Res, $Val extends ContactsEvent>
    implements $ContactsEventCopyWith<$Res> {
  _$ContactsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadContactsImplCopyWith<$Res> {
  factory _$$LoadContactsImplCopyWith(
          _$LoadContactsImpl value, $Res Function(_$LoadContactsImpl) then) =
      __$$LoadContactsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadContactsImplCopyWithImpl<$Res>
    extends _$ContactsEventCopyWithImpl<$Res, _$LoadContactsImpl>
    implements _$$LoadContactsImplCopyWith<$Res> {
  __$$LoadContactsImplCopyWithImpl(
      _$LoadContactsImpl _value, $Res Function(_$LoadContactsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadContactsImpl implements _LoadContacts {
  const _$LoadContactsImpl();

  @override
  String toString() {
    return 'ContactsEvent.loadContacts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadContactsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadContacts,
    required TResult Function(String text) searchContact,
  }) {
    return loadContacts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadContacts,
    TResult? Function(String text)? searchContact,
  }) {
    return loadContacts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadContacts,
    TResult Function(String text)? searchContact,
    required TResult orElse(),
  }) {
    if (loadContacts != null) {
      return loadContacts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_SearchContact value) searchContact,
  }) {
    return loadContacts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_SearchContact value)? searchContact,
  }) {
    return loadContacts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_SearchContact value)? searchContact,
    required TResult orElse(),
  }) {
    if (loadContacts != null) {
      return loadContacts(this);
    }
    return orElse();
  }
}

abstract class _LoadContacts implements ContactsEvent {
  const factory _LoadContacts() = _$LoadContactsImpl;
}

/// @nodoc
abstract class _$$SearchContactImplCopyWith<$Res> {
  factory _$$SearchContactImplCopyWith(
          _$SearchContactImpl value, $Res Function(_$SearchContactImpl) then) =
      __$$SearchContactImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SearchContactImplCopyWithImpl<$Res>
    extends _$ContactsEventCopyWithImpl<$Res, _$SearchContactImpl>
    implements _$$SearchContactImplCopyWith<$Res> {
  __$$SearchContactImplCopyWithImpl(
      _$SearchContactImpl _value, $Res Function(_$SearchContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SearchContactImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchContactImpl implements _SearchContact {
  const _$SearchContactImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'ContactsEvent.searchContact(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchContactImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchContactImplCopyWith<_$SearchContactImpl> get copyWith =>
      __$$SearchContactImplCopyWithImpl<_$SearchContactImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadContacts,
    required TResult Function(String text) searchContact,
  }) {
    return searchContact(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadContacts,
    TResult? Function(String text)? searchContact,
  }) {
    return searchContact?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadContacts,
    TResult Function(String text)? searchContact,
    required TResult orElse(),
  }) {
    if (searchContact != null) {
      return searchContact(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_SearchContact value) searchContact,
  }) {
    return searchContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_SearchContact value)? searchContact,
  }) {
    return searchContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_SearchContact value)? searchContact,
    required TResult orElse(),
  }) {
    if (searchContact != null) {
      return searchContact(this);
    }
    return orElse();
  }
}

abstract class _SearchContact implements ContactsEvent {
  const factory _SearchContact({required final String text}) =
      _$SearchContactImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$SearchContactImplCopyWith<_$SearchContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
