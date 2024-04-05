// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configure_contacts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfigureContactsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function() assignedContacts,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied,
            List<ContactEntity> selectedContacts)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function()? assignedContacts,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied, List<ContactEntity> selectedContacts)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function()? assignedContacts,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied, List<ContactEntity> selectedContacts)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_AssignedContacts value) assignedContacts,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_AssignedContacts value)? assignedContacts,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_AssignedContacts value)? assignedContacts,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigureContactsStateCopyWith<$Res> {
  factory $ConfigureContactsStateCopyWith(ConfigureContactsState value,
          $Res Function(ConfigureContactsState) then) =
      _$ConfigureContactsStateCopyWithImpl<$Res, ConfigureContactsState>;
}

/// @nodoc
class _$ConfigureContactsStateCopyWithImpl<$Res,
        $Val extends ConfigureContactsState>
    implements $ConfigureContactsStateCopyWith<$Res> {
  _$ConfigureContactsStateCopyWithImpl(this._value, this._then);

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
    extends _$ConfigureContactsStateCopyWithImpl<$Res, _$LoadInProgressImpl>
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
    return 'ConfigureContactsState.loadInProgress()';
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
    required TResult Function() assignedContacts,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied,
            List<ContactEntity> selectedContacts)
        loaded,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function()? assignedContacts,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied, List<ContactEntity> selectedContacts)?
        loaded,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function()? assignedContacts,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied, List<ContactEntity> selectedContacts)?
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
    required TResult Function(_AssignedContacts value) assignedContacts,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_AssignedContacts value)? assignedContacts,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_AssignedContacts value)? assignedContacts,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements ConfigureContactsState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$AssignedContactsImplCopyWith<$Res> {
  factory _$$AssignedContactsImplCopyWith(_$AssignedContactsImpl value,
          $Res Function(_$AssignedContactsImpl) then) =
      __$$AssignedContactsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AssignedContactsImplCopyWithImpl<$Res>
    extends _$ConfigureContactsStateCopyWithImpl<$Res, _$AssignedContactsImpl>
    implements _$$AssignedContactsImplCopyWith<$Res> {
  __$$AssignedContactsImplCopyWithImpl(_$AssignedContactsImpl _value,
      $Res Function(_$AssignedContactsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AssignedContactsImpl implements _AssignedContacts {
  const _$AssignedContactsImpl();

  @override
  String toString() {
    return 'ConfigureContactsState.assignedContacts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AssignedContactsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function() assignedContacts,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied,
            List<ContactEntity> selectedContacts)
        loaded,
  }) {
    return assignedContacts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function()? assignedContacts,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied, List<ContactEntity> selectedContacts)?
        loaded,
  }) {
    return assignedContacts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function()? assignedContacts,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied, List<ContactEntity> selectedContacts)?
        loaded,
    required TResult orElse(),
  }) {
    if (assignedContacts != null) {
      return assignedContacts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_AssignedContacts value) assignedContacts,
    required TResult Function(_Loaded value) loaded,
  }) {
    return assignedContacts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_AssignedContacts value)? assignedContacts,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return assignedContacts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_AssignedContacts value)? assignedContacts,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (assignedContacts != null) {
      return assignedContacts(this);
    }
    return orElse();
  }
}

abstract class _AssignedContacts implements ConfigureContactsState {
  const factory _AssignedContacts() = _$AssignedContactsImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Map<String, List<ContactEntity>> categorizedContacts,
      bool isPermissionDenied,
      List<ContactEntity> selectedContacts});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ConfigureContactsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorizedContacts = null,
    Object? isPermissionDenied = null,
    Object? selectedContacts = null,
  }) {
    return _then(_$LoadedImpl(
      categorizedContacts: null == categorizedContacts
          ? _value._categorizedContacts
          : categorizedContacts // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContactEntity>>,
      isPermissionDenied: null == isPermissionDenied
          ? _value.isPermissionDenied
          : isPermissionDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedContacts: null == selectedContacts
          ? _value._selectedContacts
          : selectedContacts // ignore: cast_nullable_to_non_nullable
              as List<ContactEntity>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final Map<String, List<ContactEntity>> categorizedContacts,
      required this.isPermissionDenied,
      required final List<ContactEntity> selectedContacts})
      : _categorizedContacts = categorizedContacts,
        _selectedContacts = selectedContacts;

  final Map<String, List<ContactEntity>> _categorizedContacts;
  @override
  Map<String, List<ContactEntity>> get categorizedContacts {
    if (_categorizedContacts is EqualUnmodifiableMapView)
      return _categorizedContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categorizedContacts);
  }

  @override
  final bool isPermissionDenied;
  final List<ContactEntity> _selectedContacts;
  @override
  List<ContactEntity> get selectedContacts {
    if (_selectedContacts is EqualUnmodifiableListView)
      return _selectedContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedContacts);
  }

  @override
  String toString() {
    return 'ConfigureContactsState.loaded(categorizedContacts: $categorizedContacts, isPermissionDenied: $isPermissionDenied, selectedContacts: $selectedContacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._categorizedContacts, _categorizedContacts) &&
            (identical(other.isPermissionDenied, isPermissionDenied) ||
                other.isPermissionDenied == isPermissionDenied) &&
            const DeepCollectionEquality()
                .equals(other._selectedContacts, _selectedContacts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categorizedContacts),
      isPermissionDenied,
      const DeepCollectionEquality().hash(_selectedContacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function() assignedContacts,
    required TResult Function(
            Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied,
            List<ContactEntity> selectedContacts)
        loaded,
  }) {
    return loaded(categorizedContacts, isPermissionDenied, selectedContacts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadInProgress,
    TResult? Function()? assignedContacts,
    TResult? Function(Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied, List<ContactEntity> selectedContacts)?
        loaded,
  }) {
    return loaded?.call(
        categorizedContacts, isPermissionDenied, selectedContacts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function()? assignedContacts,
    TResult Function(Map<String, List<ContactEntity>> categorizedContacts,
            bool isPermissionDenied, List<ContactEntity> selectedContacts)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categorizedContacts, isPermissionDenied, selectedContacts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_AssignedContacts value) assignedContacts,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_AssignedContacts value)? assignedContacts,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_AssignedContacts value)? assignedContacts,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ConfigureContactsState {
  const factory _Loaded(
      {required final Map<String, List<ContactEntity>> categorizedContacts,
      required final bool isPermissionDenied,
      required final List<ContactEntity> selectedContacts}) = _$LoadedImpl;

  Map<String, List<ContactEntity>> get categorizedContacts;
  bool get isPermissionDenied;
  List<ContactEntity> get selectedContacts;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConfigureContactsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String text) searchContact,
    required TResult Function() checkPermission,
    required TResult Function(ContactEntity contact) selectContact,
    required TResult Function() assignContacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String text)? searchContact,
    TResult? Function()? checkPermission,
    TResult? Function(ContactEntity contact)? selectContact,
    TResult? Function()? assignContacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String text)? searchContact,
    TResult Function()? checkPermission,
    TResult Function(ContactEntity contact)? selectContact,
    TResult Function()? assignContacts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_SearchContact value) searchContact,
    required TResult Function(_CheckPermission value) checkPermission,
    required TResult Function(_SelectContact value) selectContact,
    required TResult Function(_AssignContacts value) assignContacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_CheckPermission value)? checkPermission,
    TResult? Function(_SelectContact value)? selectContact,
    TResult? Function(_AssignContacts value)? assignContacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_CheckPermission value)? checkPermission,
    TResult Function(_SelectContact value)? selectContact,
    TResult Function(_AssignContacts value)? assignContacts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigureContactsEventCopyWith<$Res> {
  factory $ConfigureContactsEventCopyWith(ConfigureContactsEvent value,
          $Res Function(ConfigureContactsEvent) then) =
      _$ConfigureContactsEventCopyWithImpl<$Res, ConfigureContactsEvent>;
}

/// @nodoc
class _$ConfigureContactsEventCopyWithImpl<$Res,
        $Val extends ConfigureContactsEvent>
    implements $ConfigureContactsEventCopyWith<$Res> {
  _$ConfigureContactsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialEventImplCopyWith<$Res> {
  factory _$$InitialEventImplCopyWith(
          _$InitialEventImpl value, $Res Function(_$InitialEventImpl) then) =
      __$$InitialEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialEventImplCopyWithImpl<$Res>
    extends _$ConfigureContactsEventCopyWithImpl<$Res, _$InitialEventImpl>
    implements _$$InitialEventImplCopyWith<$Res> {
  __$$InitialEventImplCopyWithImpl(
      _$InitialEventImpl _value, $Res Function(_$InitialEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialEventImpl implements _InitialEvent {
  const _$InitialEventImpl();

  @override
  String toString() {
    return 'ConfigureContactsEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String text) searchContact,
    required TResult Function() checkPermission,
    required TResult Function(ContactEntity contact) selectContact,
    required TResult Function() assignContacts,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String text)? searchContact,
    TResult? Function()? checkPermission,
    TResult? Function(ContactEntity contact)? selectContact,
    TResult? Function()? assignContacts,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String text)? searchContact,
    TResult Function()? checkPermission,
    TResult Function(ContactEntity contact)? selectContact,
    TResult Function()? assignContacts,
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
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_SearchContact value) searchContact,
    required TResult Function(_CheckPermission value) checkPermission,
    required TResult Function(_SelectContact value) selectContact,
    required TResult Function(_AssignContacts value) assignContacts,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_CheckPermission value)? checkPermission,
    TResult? Function(_SelectContact value)? selectContact,
    TResult? Function(_AssignContacts value)? assignContacts,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_CheckPermission value)? checkPermission,
    TResult Function(_SelectContact value)? selectContact,
    TResult Function(_AssignContacts value)? assignContacts,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialEvent implements ConfigureContactsEvent {
  const factory _InitialEvent() = _$InitialEventImpl;
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
    extends _$ConfigureContactsEventCopyWithImpl<$Res, _$SearchContactImpl>
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
    return 'ConfigureContactsEvent.searchContact(text: $text)';
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
    required TResult Function() initial,
    required TResult Function(String text) searchContact,
    required TResult Function() checkPermission,
    required TResult Function(ContactEntity contact) selectContact,
    required TResult Function() assignContacts,
  }) {
    return searchContact(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String text)? searchContact,
    TResult? Function()? checkPermission,
    TResult? Function(ContactEntity contact)? selectContact,
    TResult? Function()? assignContacts,
  }) {
    return searchContact?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String text)? searchContact,
    TResult Function()? checkPermission,
    TResult Function(ContactEntity contact)? selectContact,
    TResult Function()? assignContacts,
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
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_SearchContact value) searchContact,
    required TResult Function(_CheckPermission value) checkPermission,
    required TResult Function(_SelectContact value) selectContact,
    required TResult Function(_AssignContacts value) assignContacts,
  }) {
    return searchContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_CheckPermission value)? checkPermission,
    TResult? Function(_SelectContact value)? selectContact,
    TResult? Function(_AssignContacts value)? assignContacts,
  }) {
    return searchContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_CheckPermission value)? checkPermission,
    TResult Function(_SelectContact value)? selectContact,
    TResult Function(_AssignContacts value)? assignContacts,
    required TResult orElse(),
  }) {
    if (searchContact != null) {
      return searchContact(this);
    }
    return orElse();
  }
}

abstract class _SearchContact implements ConfigureContactsEvent {
  const factory _SearchContact(final String text) = _$SearchContactImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$SearchContactImplCopyWith<_$SearchContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckPermissionImplCopyWith<$Res> {
  factory _$$CheckPermissionImplCopyWith(_$CheckPermissionImpl value,
          $Res Function(_$CheckPermissionImpl) then) =
      __$$CheckPermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckPermissionImplCopyWithImpl<$Res>
    extends _$ConfigureContactsEventCopyWithImpl<$Res, _$CheckPermissionImpl>
    implements _$$CheckPermissionImplCopyWith<$Res> {
  __$$CheckPermissionImplCopyWithImpl(
      _$CheckPermissionImpl _value, $Res Function(_$CheckPermissionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckPermissionImpl implements _CheckPermission {
  const _$CheckPermissionImpl();

  @override
  String toString() {
    return 'ConfigureContactsEvent.checkPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckPermissionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String text) searchContact,
    required TResult Function() checkPermission,
    required TResult Function(ContactEntity contact) selectContact,
    required TResult Function() assignContacts,
  }) {
    return checkPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String text)? searchContact,
    TResult? Function()? checkPermission,
    TResult? Function(ContactEntity contact)? selectContact,
    TResult? Function()? assignContacts,
  }) {
    return checkPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String text)? searchContact,
    TResult Function()? checkPermission,
    TResult Function(ContactEntity contact)? selectContact,
    TResult Function()? assignContacts,
    required TResult orElse(),
  }) {
    if (checkPermission != null) {
      return checkPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_SearchContact value) searchContact,
    required TResult Function(_CheckPermission value) checkPermission,
    required TResult Function(_SelectContact value) selectContact,
    required TResult Function(_AssignContacts value) assignContacts,
  }) {
    return checkPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_CheckPermission value)? checkPermission,
    TResult? Function(_SelectContact value)? selectContact,
    TResult? Function(_AssignContacts value)? assignContacts,
  }) {
    return checkPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_CheckPermission value)? checkPermission,
    TResult Function(_SelectContact value)? selectContact,
    TResult Function(_AssignContacts value)? assignContacts,
    required TResult orElse(),
  }) {
    if (checkPermission != null) {
      return checkPermission(this);
    }
    return orElse();
  }
}

abstract class _CheckPermission implements ConfigureContactsEvent {
  const factory _CheckPermission() = _$CheckPermissionImpl;
}

/// @nodoc
abstract class _$$SelectContactImplCopyWith<$Res> {
  factory _$$SelectContactImplCopyWith(
          _$SelectContactImpl value, $Res Function(_$SelectContactImpl) then) =
      __$$SelectContactImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ContactEntity contact});

  $ContactEntityCopyWith<$Res> get contact;
}

/// @nodoc
class __$$SelectContactImplCopyWithImpl<$Res>
    extends _$ConfigureContactsEventCopyWithImpl<$Res, _$SelectContactImpl>
    implements _$$SelectContactImplCopyWith<$Res> {
  __$$SelectContactImplCopyWithImpl(
      _$SelectContactImpl _value, $Res Function(_$SelectContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = null,
  }) {
    return _then(_$SelectContactImpl(
      null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as ContactEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactEntityCopyWith<$Res> get contact {
    return $ContactEntityCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value));
    });
  }
}

/// @nodoc

class _$SelectContactImpl implements _SelectContact {
  const _$SelectContactImpl(this.contact);

  @override
  final ContactEntity contact;

  @override
  String toString() {
    return 'ConfigureContactsEvent.selectContact(contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectContactImpl &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectContactImplCopyWith<_$SelectContactImpl> get copyWith =>
      __$$SelectContactImplCopyWithImpl<_$SelectContactImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String text) searchContact,
    required TResult Function() checkPermission,
    required TResult Function(ContactEntity contact) selectContact,
    required TResult Function() assignContacts,
  }) {
    return selectContact(contact);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String text)? searchContact,
    TResult? Function()? checkPermission,
    TResult? Function(ContactEntity contact)? selectContact,
    TResult? Function()? assignContacts,
  }) {
    return selectContact?.call(contact);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String text)? searchContact,
    TResult Function()? checkPermission,
    TResult Function(ContactEntity contact)? selectContact,
    TResult Function()? assignContacts,
    required TResult orElse(),
  }) {
    if (selectContact != null) {
      return selectContact(contact);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_SearchContact value) searchContact,
    required TResult Function(_CheckPermission value) checkPermission,
    required TResult Function(_SelectContact value) selectContact,
    required TResult Function(_AssignContacts value) assignContacts,
  }) {
    return selectContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_CheckPermission value)? checkPermission,
    TResult? Function(_SelectContact value)? selectContact,
    TResult? Function(_AssignContacts value)? assignContacts,
  }) {
    return selectContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_CheckPermission value)? checkPermission,
    TResult Function(_SelectContact value)? selectContact,
    TResult Function(_AssignContacts value)? assignContacts,
    required TResult orElse(),
  }) {
    if (selectContact != null) {
      return selectContact(this);
    }
    return orElse();
  }
}

abstract class _SelectContact implements ConfigureContactsEvent {
  const factory _SelectContact(final ContactEntity contact) =
      _$SelectContactImpl;

  ContactEntity get contact;
  @JsonKey(ignore: true)
  _$$SelectContactImplCopyWith<_$SelectContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssignContactsImplCopyWith<$Res> {
  factory _$$AssignContactsImplCopyWith(_$AssignContactsImpl value,
          $Res Function(_$AssignContactsImpl) then) =
      __$$AssignContactsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AssignContactsImplCopyWithImpl<$Res>
    extends _$ConfigureContactsEventCopyWithImpl<$Res, _$AssignContactsImpl>
    implements _$$AssignContactsImplCopyWith<$Res> {
  __$$AssignContactsImplCopyWithImpl(
      _$AssignContactsImpl _value, $Res Function(_$AssignContactsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AssignContactsImpl implements _AssignContacts {
  const _$AssignContactsImpl();

  @override
  String toString() {
    return 'ConfigureContactsEvent.assignContacts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AssignContactsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String text) searchContact,
    required TResult Function() checkPermission,
    required TResult Function(ContactEntity contact) selectContact,
    required TResult Function() assignContacts,
  }) {
    return assignContacts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String text)? searchContact,
    TResult? Function()? checkPermission,
    TResult? Function(ContactEntity contact)? selectContact,
    TResult? Function()? assignContacts,
  }) {
    return assignContacts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String text)? searchContact,
    TResult Function()? checkPermission,
    TResult Function(ContactEntity contact)? selectContact,
    TResult Function()? assignContacts,
    required TResult orElse(),
  }) {
    if (assignContacts != null) {
      return assignContacts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_SearchContact value) searchContact,
    required TResult Function(_CheckPermission value) checkPermission,
    required TResult Function(_SelectContact value) selectContact,
    required TResult Function(_AssignContacts value) assignContacts,
  }) {
    return assignContacts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_SearchContact value)? searchContact,
    TResult? Function(_CheckPermission value)? checkPermission,
    TResult? Function(_SelectContact value)? selectContact,
    TResult? Function(_AssignContacts value)? assignContacts,
  }) {
    return assignContacts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_SearchContact value)? searchContact,
    TResult Function(_CheckPermission value)? checkPermission,
    TResult Function(_SelectContact value)? selectContact,
    TResult Function(_AssignContacts value)? assignContacts,
    required TResult orElse(),
  }) {
    if (assignContacts != null) {
      return assignContacts(this);
    }
    return orElse();
  }
}

abstract class _AssignContacts implements ConfigureContactsEvent {
  const factory _AssignContacts() = _$AssignContactsImpl;
}
