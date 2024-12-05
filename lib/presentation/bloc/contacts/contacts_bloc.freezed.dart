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
    required TResult Function(ContactEntity contact) openFoundedContact,
    required TResult Function() notFoundContact,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function(ContactEntity contact)? openFoundedContact,
    TResult? Function()? notFoundContact,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(ContactEntity contact)? openFoundedContact,
    TResult Function()? notFoundContact,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_OpenFoundedContact value) openFoundedContact,
    required TResult Function(_NotFoundContact value) notFoundContact,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_OpenFoundedContact value)? openFoundedContact,
    TResult? Function(_NotFoundContact value)? notFoundContact,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_OpenFoundedContact value)? openFoundedContact,
    TResult Function(_NotFoundContact value)? notFoundContact,
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

class _$LoadInProgressImpl implements _LoadInProgress {
  const _$LoadInProgressImpl();

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
    required TResult Function(ContactEntity contact) openFoundedContact,
    required TResult Function() notFoundContact,
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
    TResult? Function(ContactEntity contact)? openFoundedContact,
    TResult? Function()? notFoundContact,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(ContactEntity contact)? openFoundedContact,
    TResult Function()? notFoundContact,
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
    required TResult Function(_OpenFoundedContact value) openFoundedContact,
    required TResult Function(_NotFoundContact value) notFoundContact,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_OpenFoundedContact value)? openFoundedContact,
    TResult? Function(_NotFoundContact value)? notFoundContact,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_OpenFoundedContact value)? openFoundedContact,
    TResult Function(_NotFoundContact value)? notFoundContact,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements ContactsState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$OpenFoundedContactImplCopyWith<$Res> {
  factory _$$OpenFoundedContactImplCopyWith(_$OpenFoundedContactImpl value,
          $Res Function(_$OpenFoundedContactImpl) then) =
      __$$OpenFoundedContactImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ContactEntity contact});
}

/// @nodoc
class __$$OpenFoundedContactImplCopyWithImpl<$Res>
    extends _$ContactsStateCopyWithImpl<$Res, _$OpenFoundedContactImpl>
    implements _$$OpenFoundedContactImplCopyWith<$Res> {
  __$$OpenFoundedContactImplCopyWithImpl(_$OpenFoundedContactImpl _value,
      $Res Function(_$OpenFoundedContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = null,
  }) {
    return _then(_$OpenFoundedContactImpl(
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as ContactEntity,
    ));
  }
}

/// @nodoc

class _$OpenFoundedContactImpl implements _OpenFoundedContact {
  const _$OpenFoundedContactImpl({required this.contact});

  @override
  final ContactEntity contact;

  @override
  String toString() {
    return 'ContactsState.openFoundedContact(contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenFoundedContactImpl &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenFoundedContactImplCopyWith<_$OpenFoundedContactImpl> get copyWith =>
      __$$OpenFoundedContactImplCopyWithImpl<_$OpenFoundedContactImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function(ContactEntity contact) openFoundedContact,
    required TResult Function() notFoundContact,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts)
        loaded,
  }) {
    return openFoundedContact(contact);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function(ContactEntity contact)? openFoundedContact,
    TResult? Function()? notFoundContact,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
  }) {
    return openFoundedContact?.call(contact);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(ContactEntity contact)? openFoundedContact,
    TResult Function()? notFoundContact,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
    required TResult orElse(),
  }) {
    if (openFoundedContact != null) {
      return openFoundedContact(contact);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_OpenFoundedContact value) openFoundedContact,
    required TResult Function(_NotFoundContact value) notFoundContact,
    required TResult Function(_Loaded value) loaded,
  }) {
    return openFoundedContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_OpenFoundedContact value)? openFoundedContact,
    TResult? Function(_NotFoundContact value)? notFoundContact,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return openFoundedContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_OpenFoundedContact value)? openFoundedContact,
    TResult Function(_NotFoundContact value)? notFoundContact,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (openFoundedContact != null) {
      return openFoundedContact(this);
    }
    return orElse();
  }
}

abstract class _OpenFoundedContact implements ContactsState {
  const factory _OpenFoundedContact({required final ContactEntity contact}) =
      _$OpenFoundedContactImpl;

  ContactEntity get contact;
  @JsonKey(ignore: true)
  _$$OpenFoundedContactImplCopyWith<_$OpenFoundedContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundContactImplCopyWith<$Res> {
  factory _$$NotFoundContactImplCopyWith(_$NotFoundContactImpl value,
          $Res Function(_$NotFoundContactImpl) then) =
      __$$NotFoundContactImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundContactImplCopyWithImpl<$Res>
    extends _$ContactsStateCopyWithImpl<$Res, _$NotFoundContactImpl>
    implements _$$NotFoundContactImplCopyWith<$Res> {
  __$$NotFoundContactImplCopyWithImpl(
      _$NotFoundContactImpl _value, $Res Function(_$NotFoundContactImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotFoundContactImpl implements _NotFoundContact {
  const _$NotFoundContactImpl();

  @override
  String toString() {
    return 'ContactsState.notFoundContact()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundContactImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function(ContactEntity contact) openFoundedContact,
    required TResult Function() notFoundContact,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts)
        loaded,
  }) {
    return notFoundContact();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function(ContactEntity contact)? openFoundedContact,
    TResult? Function()? notFoundContact,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
  }) {
    return notFoundContact?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(ContactEntity contact)? openFoundedContact,
    TResult Function()? notFoundContact,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
    required TResult orElse(),
  }) {
    if (notFoundContact != null) {
      return notFoundContact();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_OpenFoundedContact value) openFoundedContact,
    required TResult Function(_NotFoundContact value) notFoundContact,
    required TResult Function(_Loaded value) loaded,
  }) {
    return notFoundContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_OpenFoundedContact value)? openFoundedContact,
    TResult? Function(_NotFoundContact value)? notFoundContact,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return notFoundContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_OpenFoundedContact value)? openFoundedContact,
    TResult Function(_NotFoundContact value)? notFoundContact,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (notFoundContact != null) {
      return notFoundContact(this);
    }
    return orElse();
  }
}

abstract class _NotFoundContact implements ContactsState {
  const factory _NotFoundContact() = _$NotFoundContactImpl;
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

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final Map<String, List<ContactEntity>> categorizedContacts})
      : _categorizedContacts = categorizedContacts;

  final Map<String, List<ContactEntity>> _categorizedContacts;
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
    required TResult Function(ContactEntity contact) openFoundedContact,
    required TResult Function() notFoundContact,
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
    TResult? Function(ContactEntity contact)? openFoundedContact,
    TResult? Function()? notFoundContact,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts)?
        loaded,
  }) {
    return loaded?.call(categorizedContacts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(ContactEntity contact)? openFoundedContact,
    TResult Function()? notFoundContact,
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
    required TResult Function(_OpenFoundedContact value) openFoundedContact,
    required TResult Function(_NotFoundContact value) notFoundContact,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_OpenFoundedContact value)? openFoundedContact,
    TResult? Function(_NotFoundContact value)? notFoundContact,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_OpenFoundedContact value)? openFoundedContact,
    TResult Function(_NotFoundContact value)? notFoundContact,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ContactsState {
  const factory _Loaded(
      {required final Map<String, List<ContactEntity>>
          categorizedContacts}) = _$LoadedImpl;

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
    required TResult Function(String text) searchSharedContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadContacts,
    TResult? Function(String text)? searchContact,
    TResult? Function(String text)? searchSharedContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadContacts,
    TResult Function(String text)? searchContact,
    TResult Function(String text)? searchSharedContact,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_SearchContact value) searchContact,
    required TResult Function(_SearchSharedContact value) searchSharedContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_SearchSharedContact value)? searchSharedContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_SearchSharedContact value)? searchSharedContact,
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
    required TResult Function(String text) searchSharedContact,
  }) {
    return loadContacts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadContacts,
    TResult? Function(String text)? searchContact,
    TResult? Function(String text)? searchSharedContact,
  }) {
    return loadContacts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadContacts,
    TResult Function(String text)? searchContact,
    TResult Function(String text)? searchSharedContact,
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
    required TResult Function(_SearchSharedContact value) searchSharedContact,
  }) {
    return loadContacts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_SearchSharedContact value)? searchSharedContact,
  }) {
    return loadContacts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_SearchSharedContact value)? searchSharedContact,
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
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchContactImpl implements _SearchContact {
  const _$SearchContactImpl(this.text);

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
    required TResult Function(String text) searchSharedContact,
  }) {
    return searchContact(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadContacts,
    TResult? Function(String text)? searchContact,
    TResult? Function(String text)? searchSharedContact,
  }) {
    return searchContact?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadContacts,
    TResult Function(String text)? searchContact,
    TResult Function(String text)? searchSharedContact,
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
    required TResult Function(_SearchSharedContact value) searchSharedContact,
  }) {
    return searchContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_SearchSharedContact value)? searchSharedContact,
  }) {
    return searchContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_SearchSharedContact value)? searchSharedContact,
    required TResult orElse(),
  }) {
    if (searchContact != null) {
      return searchContact(this);
    }
    return orElse();
  }
}

abstract class _SearchContact implements ContactsEvent {
  const factory _SearchContact(final String text) = _$SearchContactImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$SearchContactImplCopyWith<_$SearchContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSharedContactImplCopyWith<$Res> {
  factory _$$SearchSharedContactImplCopyWith(_$SearchSharedContactImpl value,
          $Res Function(_$SearchSharedContactImpl) then) =
      __$$SearchSharedContactImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SearchSharedContactImplCopyWithImpl<$Res>
    extends _$ContactsEventCopyWithImpl<$Res, _$SearchSharedContactImpl>
    implements _$$SearchSharedContactImplCopyWith<$Res> {
  __$$SearchSharedContactImplCopyWithImpl(_$SearchSharedContactImpl _value,
      $Res Function(_$SearchSharedContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SearchSharedContactImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchSharedContactImpl implements _SearchSharedContact {
  const _$SearchSharedContactImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'ContactsEvent.searchSharedContact(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSharedContactImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSharedContactImplCopyWith<_$SearchSharedContactImpl> get copyWith =>
      __$$SearchSharedContactImplCopyWithImpl<_$SearchSharedContactImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadContacts,
    required TResult Function(String text) searchContact,
    required TResult Function(String text) searchSharedContact,
  }) {
    return searchSharedContact(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadContacts,
    TResult? Function(String text)? searchContact,
    TResult? Function(String text)? searchSharedContact,
  }) {
    return searchSharedContact?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadContacts,
    TResult Function(String text)? searchContact,
    TResult Function(String text)? searchSharedContact,
    required TResult orElse(),
  }) {
    if (searchSharedContact != null) {
      return searchSharedContact(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_SearchContact value) searchContact,
    required TResult Function(_SearchSharedContact value) searchSharedContact,
  }) {
    return searchSharedContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_SearchSharedContact value)? searchSharedContact,
  }) {
    return searchSharedContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_SearchSharedContact value)? searchSharedContact,
    required TResult orElse(),
  }) {
    if (searchSharedContact != null) {
      return searchSharedContact(this);
    }
    return orElse();
  }
}

abstract class _SearchSharedContact implements ContactsEvent {
  const factory _SearchSharedContact(final String text) =
      _$SearchSharedContactImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$SearchSharedContactImplCopyWith<_$SearchSharedContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
