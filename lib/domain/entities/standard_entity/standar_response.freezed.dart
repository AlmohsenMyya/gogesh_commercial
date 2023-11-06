// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'standar_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StandarResponse _$StandarResponseFromJson(Map<String, dynamic> json) {
  return _StandarResponse.fromJson(json);
}

/// @nodoc
mixin _$StandarResponse {
  List<StandarEntity>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StandarResponseCopyWith<StandarResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandarResponseCopyWith<$Res> {
  factory $StandarResponseCopyWith(
          StandarResponse value, $Res Function(StandarResponse) then) =
      _$StandarResponseCopyWithImpl<$Res, StandarResponse>;
  @useResult
  $Res call({List<StandarEntity>? data});
}

/// @nodoc
class _$StandarResponseCopyWithImpl<$Res, $Val extends StandarResponse>
    implements $StandarResponseCopyWith<$Res> {
  _$StandarResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StandarResponseCopyWith<$Res>
    implements $StandarResponseCopyWith<$Res> {
  factory _$$_StandarResponseCopyWith(
          _$_StandarResponse value, $Res Function(_$_StandarResponse) then) =
      __$$_StandarResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StandarEntity>? data});
}

/// @nodoc
class __$$_StandarResponseCopyWithImpl<$Res>
    extends _$StandarResponseCopyWithImpl<$Res, _$_StandarResponse>
    implements _$$_StandarResponseCopyWith<$Res> {
  __$$_StandarResponseCopyWithImpl(
      _$_StandarResponse _value, $Res Function(_$_StandarResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_StandarResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StandarResponse implements _StandarResponse {
  _$_StandarResponse({required final List<StandarEntity>? data}) : _data = data;

  factory _$_StandarResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StandarResponseFromJson(json);

  final List<StandarEntity>? _data;
  @override
  List<StandarEntity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StandarResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StandarResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StandarResponseCopyWith<_$_StandarResponse> get copyWith =>
      __$$_StandarResponseCopyWithImpl<_$_StandarResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StandarResponseToJson(
      this,
    );
  }
}

abstract class _StandarResponse implements StandarResponse {
  factory _StandarResponse({required final List<StandarEntity>? data}) =
      _$_StandarResponse;

  factory _StandarResponse.fromJson(Map<String, dynamic> json) =
      _$_StandarResponse.fromJson;

  @override
  List<StandarEntity>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_StandarResponseCopyWith<_$_StandarResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
