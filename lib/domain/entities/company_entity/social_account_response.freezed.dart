// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_account_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocialAccountResponse _$SocialAccountResponseFromJson(
    Map<String, dynamic> json) {
  return _SocialAccountResponse.fromJson(json);
}

/// @nodoc
mixin _$SocialAccountResponse {
  SocialAccountEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialAccountResponseCopyWith<SocialAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialAccountResponseCopyWith<$Res> {
  factory $SocialAccountResponseCopyWith(SocialAccountResponse value,
          $Res Function(SocialAccountResponse) then) =
      _$SocialAccountResponseCopyWithImpl<$Res, SocialAccountResponse>;
  @useResult
  $Res call({SocialAccountEntity data});
}

/// @nodoc
class _$SocialAccountResponseCopyWithImpl<$Res,
        $Val extends SocialAccountResponse>
    implements $SocialAccountResponseCopyWith<$Res> {
  _$SocialAccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SocialAccountEntity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SocialAccountResponseCopyWith<$Res>
    implements $SocialAccountResponseCopyWith<$Res> {
  factory _$$_SocialAccountResponseCopyWith(_$_SocialAccountResponse value,
          $Res Function(_$_SocialAccountResponse) then) =
      __$$_SocialAccountResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SocialAccountEntity data});
}

/// @nodoc
class __$$_SocialAccountResponseCopyWithImpl<$Res>
    extends _$SocialAccountResponseCopyWithImpl<$Res, _$_SocialAccountResponse>
    implements _$$_SocialAccountResponseCopyWith<$Res> {
  __$$_SocialAccountResponseCopyWithImpl(_$_SocialAccountResponse _value,
      $Res Function(_$_SocialAccountResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_SocialAccountResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SocialAccountEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SocialAccountResponse implements _SocialAccountResponse {
  _$_SocialAccountResponse({required this.data});

  factory _$_SocialAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SocialAccountResponseFromJson(json);

  @override
  final SocialAccountEntity data;

  @override
  String toString() {
    return 'SocialAccountResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocialAccountResponse &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SocialAccountResponseCopyWith<_$_SocialAccountResponse> get copyWith =>
      __$$_SocialAccountResponseCopyWithImpl<_$_SocialAccountResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SocialAccountResponseToJson(
      this,
    );
  }
}

abstract class _SocialAccountResponse implements SocialAccountResponse {
  factory _SocialAccountResponse({required final SocialAccountEntity data}) =
      _$_SocialAccountResponse;

  factory _SocialAccountResponse.fromJson(Map<String, dynamic> json) =
      _$_SocialAccountResponse.fromJson;

  @override
  SocialAccountEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$_SocialAccountResponseCopyWith<_$_SocialAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
