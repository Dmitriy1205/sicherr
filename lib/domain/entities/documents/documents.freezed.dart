// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Documents _$DocumentsFromJson(Map<String, dynamic> json) {
  return _Documents.fromJson(json);
}

/// @nodoc
mixin _$Documents {
  String get termsHTML => throw _privateConstructorUsedError;
  String get supportHTML => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentsCopyWith<Documents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentsCopyWith<$Res> {
  factory $DocumentsCopyWith(Documents value, $Res Function(Documents) then) =
      _$DocumentsCopyWithImpl<$Res, Documents>;
  @useResult
  $Res call({String termsHTML, String supportHTML});
}

/// @nodoc
class _$DocumentsCopyWithImpl<$Res, $Val extends Documents>
    implements $DocumentsCopyWith<$Res> {
  _$DocumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsHTML = null,
    Object? supportHTML = null,
  }) {
    return _then(_value.copyWith(
      termsHTML: null == termsHTML
          ? _value.termsHTML
          : termsHTML // ignore: cast_nullable_to_non_nullable
              as String,
      supportHTML: null == supportHTML
          ? _value.supportHTML
          : supportHTML // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentsImplCopyWith<$Res>
    implements $DocumentsCopyWith<$Res> {
  factory _$$DocumentsImplCopyWith(
          _$DocumentsImpl value, $Res Function(_$DocumentsImpl) then) =
      __$$DocumentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String termsHTML, String supportHTML});
}

/// @nodoc
class __$$DocumentsImplCopyWithImpl<$Res>
    extends _$DocumentsCopyWithImpl<$Res, _$DocumentsImpl>
    implements _$$DocumentsImplCopyWith<$Res> {
  __$$DocumentsImplCopyWithImpl(
      _$DocumentsImpl _value, $Res Function(_$DocumentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsHTML = null,
    Object? supportHTML = null,
  }) {
    return _then(_$DocumentsImpl(
      termsHTML: null == termsHTML
          ? _value.termsHTML
          : termsHTML // ignore: cast_nullable_to_non_nullable
              as String,
      supportHTML: null == supportHTML
          ? _value.supportHTML
          : supportHTML // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentsImpl implements _Documents {
  const _$DocumentsImpl({this.termsHTML = "", this.supportHTML = ""});

  factory _$DocumentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentsImplFromJson(json);

  @override
  @JsonKey()
  final String termsHTML;
  @override
  @JsonKey()
  final String supportHTML;

  @override
  String toString() {
    return 'Documents(termsHTML: $termsHTML, supportHTML: $supportHTML)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentsImpl &&
            (identical(other.termsHTML, termsHTML) ||
                other.termsHTML == termsHTML) &&
            (identical(other.supportHTML, supportHTML) ||
                other.supportHTML == supportHTML));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, termsHTML, supportHTML);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentsImplCopyWith<_$DocumentsImpl> get copyWith =>
      __$$DocumentsImplCopyWithImpl<_$DocumentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentsImplToJson(
      this,
    );
  }
}

abstract class _Documents implements Documents {
  const factory _Documents({final String termsHTML, final String supportHTML}) =
      _$DocumentsImpl;

  factory _Documents.fromJson(Map<String, dynamic> json) =
      _$DocumentsImpl.fromJson;

  @override
  String get termsHTML;
  @override
  String get supportHTML;
  @override
  @JsonKey(ignore: true)
  _$$DocumentsImplCopyWith<_$DocumentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
