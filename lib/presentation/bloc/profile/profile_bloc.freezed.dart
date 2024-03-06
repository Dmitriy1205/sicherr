// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentUserId) setProfileFields,
    required TResult Function() getProfileFields,
    required TResult Function(Map<String, dynamic> data)
        updateSpecificProfileField,
    required TResult Function(UserProfile profileFields) loadProfileFields,
    required TResult Function(String error) catchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentUserId)? setProfileFields,
    TResult? Function()? getProfileFields,
    TResult? Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult? Function(UserProfile profileFields)? loadProfileFields,
    TResult? Function(String error)? catchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentUserId)? setProfileFields,
    TResult Function()? getProfileFields,
    TResult Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult Function(UserProfile profileFields)? loadProfileFields,
    TResult Function(String error)? catchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetProfileFields value) setProfileFields,
    required TResult Function(_GetProfileFields value) getProfileFields,
    required TResult Function(_UpdateSpecificProfileField value)
        updateSpecificProfileField,
    required TResult Function(_LoadProfileFields value) loadProfileFields,
    required TResult Function(_CatchError value) catchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetProfileFields value)? setProfileFields,
    TResult? Function(_GetProfileFields value)? getProfileFields,
    TResult? Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult? Function(_LoadProfileFields value)? loadProfileFields,
    TResult? Function(_CatchError value)? catchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetProfileFields value)? setProfileFields,
    TResult Function(_GetProfileFields value)? getProfileFields,
    TResult Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult Function(_LoadProfileFields value)? loadProfileFields,
    TResult Function(_CatchError value)? catchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetProfileFieldsImplCopyWith<$Res> {
  factory _$$SetProfileFieldsImplCopyWith(_$SetProfileFieldsImpl value,
          $Res Function(_$SetProfileFieldsImpl) then) =
      __$$SetProfileFieldsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currentUserId});
}

/// @nodoc
class __$$SetProfileFieldsImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$SetProfileFieldsImpl>
    implements _$$SetProfileFieldsImplCopyWith<$Res> {
  __$$SetProfileFieldsImplCopyWithImpl(_$SetProfileFieldsImpl _value,
      $Res Function(_$SetProfileFieldsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUserId = null,
  }) {
    return _then(_$SetProfileFieldsImpl(
      currentUserId: null == currentUserId
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetProfileFieldsImpl implements _SetProfileFields {
  const _$SetProfileFieldsImpl({required this.currentUserId});

  @override
  final String currentUserId;

  @override
  String toString() {
    return 'ProfileEvent.setProfileFields(currentUserId: $currentUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetProfileFieldsImpl &&
            (identical(other.currentUserId, currentUserId) ||
                other.currentUserId == currentUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetProfileFieldsImplCopyWith<_$SetProfileFieldsImpl> get copyWith =>
      __$$SetProfileFieldsImplCopyWithImpl<_$SetProfileFieldsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentUserId) setProfileFields,
    required TResult Function() getProfileFields,
    required TResult Function(Map<String, dynamic> data)
        updateSpecificProfileField,
    required TResult Function(UserProfile profileFields) loadProfileFields,
    required TResult Function(String error) catchError,
  }) {
    return setProfileFields(currentUserId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentUserId)? setProfileFields,
    TResult? Function()? getProfileFields,
    TResult? Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult? Function(UserProfile profileFields)? loadProfileFields,
    TResult? Function(String error)? catchError,
  }) {
    return setProfileFields?.call(currentUserId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentUserId)? setProfileFields,
    TResult Function()? getProfileFields,
    TResult Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult Function(UserProfile profileFields)? loadProfileFields,
    TResult Function(String error)? catchError,
    required TResult orElse(),
  }) {
    if (setProfileFields != null) {
      return setProfileFields(currentUserId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetProfileFields value) setProfileFields,
    required TResult Function(_GetProfileFields value) getProfileFields,
    required TResult Function(_UpdateSpecificProfileField value)
        updateSpecificProfileField,
    required TResult Function(_LoadProfileFields value) loadProfileFields,
    required TResult Function(_CatchError value) catchError,
  }) {
    return setProfileFields(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetProfileFields value)? setProfileFields,
    TResult? Function(_GetProfileFields value)? getProfileFields,
    TResult? Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult? Function(_LoadProfileFields value)? loadProfileFields,
    TResult? Function(_CatchError value)? catchError,
  }) {
    return setProfileFields?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetProfileFields value)? setProfileFields,
    TResult Function(_GetProfileFields value)? getProfileFields,
    TResult Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult Function(_LoadProfileFields value)? loadProfileFields,
    TResult Function(_CatchError value)? catchError,
    required TResult orElse(),
  }) {
    if (setProfileFields != null) {
      return setProfileFields(this);
    }
    return orElse();
  }
}

abstract class _SetProfileFields implements ProfileEvent {
  const factory _SetProfileFields({required final String currentUserId}) =
      _$SetProfileFieldsImpl;

  String get currentUserId;
  @JsonKey(ignore: true)
  _$$SetProfileFieldsImplCopyWith<_$SetProfileFieldsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProfileFieldsImplCopyWith<$Res> {
  factory _$$GetProfileFieldsImplCopyWith(_$GetProfileFieldsImpl value,
          $Res Function(_$GetProfileFieldsImpl) then) =
      __$$GetProfileFieldsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProfileFieldsImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$GetProfileFieldsImpl>
    implements _$$GetProfileFieldsImplCopyWith<$Res> {
  __$$GetProfileFieldsImplCopyWithImpl(_$GetProfileFieldsImpl _value,
      $Res Function(_$GetProfileFieldsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetProfileFieldsImpl implements _GetProfileFields {
  const _$GetProfileFieldsImpl();

  @override
  String toString() {
    return 'ProfileEvent.getProfileFields()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProfileFieldsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentUserId) setProfileFields,
    required TResult Function() getProfileFields,
    required TResult Function(Map<String, dynamic> data)
        updateSpecificProfileField,
    required TResult Function(UserProfile profileFields) loadProfileFields,
    required TResult Function(String error) catchError,
  }) {
    return getProfileFields();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentUserId)? setProfileFields,
    TResult? Function()? getProfileFields,
    TResult? Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult? Function(UserProfile profileFields)? loadProfileFields,
    TResult? Function(String error)? catchError,
  }) {
    return getProfileFields?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentUserId)? setProfileFields,
    TResult Function()? getProfileFields,
    TResult Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult Function(UserProfile profileFields)? loadProfileFields,
    TResult Function(String error)? catchError,
    required TResult orElse(),
  }) {
    if (getProfileFields != null) {
      return getProfileFields();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetProfileFields value) setProfileFields,
    required TResult Function(_GetProfileFields value) getProfileFields,
    required TResult Function(_UpdateSpecificProfileField value)
        updateSpecificProfileField,
    required TResult Function(_LoadProfileFields value) loadProfileFields,
    required TResult Function(_CatchError value) catchError,
  }) {
    return getProfileFields(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetProfileFields value)? setProfileFields,
    TResult? Function(_GetProfileFields value)? getProfileFields,
    TResult? Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult? Function(_LoadProfileFields value)? loadProfileFields,
    TResult? Function(_CatchError value)? catchError,
  }) {
    return getProfileFields?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetProfileFields value)? setProfileFields,
    TResult Function(_GetProfileFields value)? getProfileFields,
    TResult Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult Function(_LoadProfileFields value)? loadProfileFields,
    TResult Function(_CatchError value)? catchError,
    required TResult orElse(),
  }) {
    if (getProfileFields != null) {
      return getProfileFields(this);
    }
    return orElse();
  }
}

abstract class _GetProfileFields implements ProfileEvent {
  const factory _GetProfileFields() = _$GetProfileFieldsImpl;
}

/// @nodoc
abstract class _$$UpdateSpecificProfileFieldImplCopyWith<$Res> {
  factory _$$UpdateSpecificProfileFieldImplCopyWith(
          _$UpdateSpecificProfileFieldImpl value,
          $Res Function(_$UpdateSpecificProfileFieldImpl) then) =
      __$$UpdateSpecificProfileFieldImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$UpdateSpecificProfileFieldImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateSpecificProfileFieldImpl>
    implements _$$UpdateSpecificProfileFieldImplCopyWith<$Res> {
  __$$UpdateSpecificProfileFieldImplCopyWithImpl(
      _$UpdateSpecificProfileFieldImpl _value,
      $Res Function(_$UpdateSpecificProfileFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UpdateSpecificProfileFieldImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UpdateSpecificProfileFieldImpl implements _UpdateSpecificProfileField {
  const _$UpdateSpecificProfileFieldImpl(
      {required final Map<String, dynamic> data})
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ProfileEvent.updateSpecificProfileField(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSpecificProfileFieldImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSpecificProfileFieldImplCopyWith<_$UpdateSpecificProfileFieldImpl>
      get copyWith => __$$UpdateSpecificProfileFieldImplCopyWithImpl<
          _$UpdateSpecificProfileFieldImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentUserId) setProfileFields,
    required TResult Function() getProfileFields,
    required TResult Function(Map<String, dynamic> data)
        updateSpecificProfileField,
    required TResult Function(UserProfile profileFields) loadProfileFields,
    required TResult Function(String error) catchError,
  }) {
    return updateSpecificProfileField(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentUserId)? setProfileFields,
    TResult? Function()? getProfileFields,
    TResult? Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult? Function(UserProfile profileFields)? loadProfileFields,
    TResult? Function(String error)? catchError,
  }) {
    return updateSpecificProfileField?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentUserId)? setProfileFields,
    TResult Function()? getProfileFields,
    TResult Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult Function(UserProfile profileFields)? loadProfileFields,
    TResult Function(String error)? catchError,
    required TResult orElse(),
  }) {
    if (updateSpecificProfileField != null) {
      return updateSpecificProfileField(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetProfileFields value) setProfileFields,
    required TResult Function(_GetProfileFields value) getProfileFields,
    required TResult Function(_UpdateSpecificProfileField value)
        updateSpecificProfileField,
    required TResult Function(_LoadProfileFields value) loadProfileFields,
    required TResult Function(_CatchError value) catchError,
  }) {
    return updateSpecificProfileField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetProfileFields value)? setProfileFields,
    TResult? Function(_GetProfileFields value)? getProfileFields,
    TResult? Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult? Function(_LoadProfileFields value)? loadProfileFields,
    TResult? Function(_CatchError value)? catchError,
  }) {
    return updateSpecificProfileField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetProfileFields value)? setProfileFields,
    TResult Function(_GetProfileFields value)? getProfileFields,
    TResult Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult Function(_LoadProfileFields value)? loadProfileFields,
    TResult Function(_CatchError value)? catchError,
    required TResult orElse(),
  }) {
    if (updateSpecificProfileField != null) {
      return updateSpecificProfileField(this);
    }
    return orElse();
  }
}

abstract class _UpdateSpecificProfileField implements ProfileEvent {
  const factory _UpdateSpecificProfileField(
          {required final Map<String, dynamic> data}) =
      _$UpdateSpecificProfileFieldImpl;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$UpdateSpecificProfileFieldImplCopyWith<_$UpdateSpecificProfileFieldImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadProfileFieldsImplCopyWith<$Res> {
  factory _$$LoadProfileFieldsImplCopyWith(_$LoadProfileFieldsImpl value,
          $Res Function(_$LoadProfileFieldsImpl) then) =
      __$$LoadProfileFieldsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfile profileFields});

  $UserProfileCopyWith<$Res> get profileFields;
}

/// @nodoc
class __$$LoadProfileFieldsImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$LoadProfileFieldsImpl>
    implements _$$LoadProfileFieldsImplCopyWith<$Res> {
  __$$LoadProfileFieldsImplCopyWithImpl(_$LoadProfileFieldsImpl _value,
      $Res Function(_$LoadProfileFieldsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileFields = null,
  }) {
    return _then(_$LoadProfileFieldsImpl(
      profileFields: null == profileFields
          ? _value.profileFields
          : profileFields // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get profileFields {
    return $UserProfileCopyWith<$Res>(_value.profileFields, (value) {
      return _then(_value.copyWith(profileFields: value));
    });
  }
}

/// @nodoc

class _$LoadProfileFieldsImpl implements _LoadProfileFields {
  const _$LoadProfileFieldsImpl({required this.profileFields});

  @override
  final UserProfile profileFields;

  @override
  String toString() {
    return 'ProfileEvent.loadProfileFields(profileFields: $profileFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProfileFieldsImpl &&
            (identical(other.profileFields, profileFields) ||
                other.profileFields == profileFields));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileFields);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProfileFieldsImplCopyWith<_$LoadProfileFieldsImpl> get copyWith =>
      __$$LoadProfileFieldsImplCopyWithImpl<_$LoadProfileFieldsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentUserId) setProfileFields,
    required TResult Function() getProfileFields,
    required TResult Function(Map<String, dynamic> data)
        updateSpecificProfileField,
    required TResult Function(UserProfile profileFields) loadProfileFields,
    required TResult Function(String error) catchError,
  }) {
    return loadProfileFields(profileFields);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentUserId)? setProfileFields,
    TResult? Function()? getProfileFields,
    TResult? Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult? Function(UserProfile profileFields)? loadProfileFields,
    TResult? Function(String error)? catchError,
  }) {
    return loadProfileFields?.call(profileFields);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentUserId)? setProfileFields,
    TResult Function()? getProfileFields,
    TResult Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult Function(UserProfile profileFields)? loadProfileFields,
    TResult Function(String error)? catchError,
    required TResult orElse(),
  }) {
    if (loadProfileFields != null) {
      return loadProfileFields(profileFields);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetProfileFields value) setProfileFields,
    required TResult Function(_GetProfileFields value) getProfileFields,
    required TResult Function(_UpdateSpecificProfileField value)
        updateSpecificProfileField,
    required TResult Function(_LoadProfileFields value) loadProfileFields,
    required TResult Function(_CatchError value) catchError,
  }) {
    return loadProfileFields(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetProfileFields value)? setProfileFields,
    TResult? Function(_GetProfileFields value)? getProfileFields,
    TResult? Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult? Function(_LoadProfileFields value)? loadProfileFields,
    TResult? Function(_CatchError value)? catchError,
  }) {
    return loadProfileFields?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetProfileFields value)? setProfileFields,
    TResult Function(_GetProfileFields value)? getProfileFields,
    TResult Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult Function(_LoadProfileFields value)? loadProfileFields,
    TResult Function(_CatchError value)? catchError,
    required TResult orElse(),
  }) {
    if (loadProfileFields != null) {
      return loadProfileFields(this);
    }
    return orElse();
  }
}

abstract class _LoadProfileFields implements ProfileEvent {
  const factory _LoadProfileFields({required final UserProfile profileFields}) =
      _$LoadProfileFieldsImpl;

  UserProfile get profileFields;
  @JsonKey(ignore: true)
  _$$LoadProfileFieldsImplCopyWith<_$LoadProfileFieldsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CatchErrorImplCopyWith<$Res> {
  factory _$$CatchErrorImplCopyWith(
          _$CatchErrorImpl value, $Res Function(_$CatchErrorImpl) then) =
      __$$CatchErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CatchErrorImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$CatchErrorImpl>
    implements _$$CatchErrorImplCopyWith<$Res> {
  __$$CatchErrorImplCopyWithImpl(
      _$CatchErrorImpl _value, $Res Function(_$CatchErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CatchErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CatchErrorImpl implements _CatchError {
  const _$CatchErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProfileEvent.catchError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatchErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatchErrorImplCopyWith<_$CatchErrorImpl> get copyWith =>
      __$$CatchErrorImplCopyWithImpl<_$CatchErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentUserId) setProfileFields,
    required TResult Function() getProfileFields,
    required TResult Function(Map<String, dynamic> data)
        updateSpecificProfileField,
    required TResult Function(UserProfile profileFields) loadProfileFields,
    required TResult Function(String error) catchError,
  }) {
    return catchError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentUserId)? setProfileFields,
    TResult? Function()? getProfileFields,
    TResult? Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult? Function(UserProfile profileFields)? loadProfileFields,
    TResult? Function(String error)? catchError,
  }) {
    return catchError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentUserId)? setProfileFields,
    TResult Function()? getProfileFields,
    TResult Function(Map<String, dynamic> data)? updateSpecificProfileField,
    TResult Function(UserProfile profileFields)? loadProfileFields,
    TResult Function(String error)? catchError,
    required TResult orElse(),
  }) {
    if (catchError != null) {
      return catchError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetProfileFields value) setProfileFields,
    required TResult Function(_GetProfileFields value) getProfileFields,
    required TResult Function(_UpdateSpecificProfileField value)
        updateSpecificProfileField,
    required TResult Function(_LoadProfileFields value) loadProfileFields,
    required TResult Function(_CatchError value) catchError,
  }) {
    return catchError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetProfileFields value)? setProfileFields,
    TResult? Function(_GetProfileFields value)? getProfileFields,
    TResult? Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult? Function(_LoadProfileFields value)? loadProfileFields,
    TResult? Function(_CatchError value)? catchError,
  }) {
    return catchError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetProfileFields value)? setProfileFields,
    TResult Function(_GetProfileFields value)? getProfileFields,
    TResult Function(_UpdateSpecificProfileField value)?
        updateSpecificProfileField,
    TResult Function(_LoadProfileFields value)? loadProfileFields,
    TResult Function(_CatchError value)? catchError,
    required TResult orElse(),
  }) {
    if (catchError != null) {
      return catchError(this);
    }
    return orElse();
  }
}

abstract class _CatchError implements ProfileEvent {
  const factory _CatchError({required final String error}) = _$CatchErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$CatchErrorImplCopyWith<_$CatchErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile? profileInfo) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile? profileInfo)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile? profileInfo)? loaded,
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
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

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
    extends _$ProfileStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ProfileState.initial()';
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
    required TResult Function(UserProfile? profileInfo) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile? profileInfo)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile? profileInfo)? loaded,
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

abstract class _Initial extends ProfileState {
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
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ProfileState.loading()';
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
    required TResult Function(UserProfile? profileInfo) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile? profileInfo)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile? profileInfo)? loaded,
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

abstract class _Loading extends ProfileState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfile? profileInfo});

  $UserProfileCopyWith<$Res>? get profileInfo;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileInfo = freezed,
  }) {
    return _then(_$LoadedImpl(
      profileInfo: freezed == profileInfo
          ? _value.profileInfo
          : profileInfo // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get profileInfo {
    if (_value.profileInfo == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.profileInfo!, (value) {
      return _then(_value.copyWith(profileInfo: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl({required this.profileInfo}) : super._();

  @override
  final UserProfile? profileInfo;

  @override
  String toString() {
    return 'ProfileState.loaded(profileInfo: $profileInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.profileInfo, profileInfo) ||
                other.profileInfo == profileInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileInfo);

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
    required TResult Function(UserProfile? profileInfo) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(profileInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile? profileInfo)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(profileInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile? profileInfo)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(profileInfo);
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

abstract class _Loaded extends ProfileState {
  const factory _Loaded({required final UserProfile? profileInfo}) =
      _$LoadedImpl;
  const _Loaded._() : super._();

  UserProfile? get profileInfo;
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
    extends _$ProfileStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'ProfileState.error(error: $error)';
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
    required TResult Function(UserProfile? profileInfo) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile? profileInfo)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile? profileInfo)? loaded,
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

abstract class _Error extends ProfileState {
  const factory _Error({required final String error}) = _$ErrorImpl;
  const _Error._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
