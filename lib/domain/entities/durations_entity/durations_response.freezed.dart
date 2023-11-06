// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'durations_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DurationsResponse _$DurationsResponseFromJson(Map<String, dynamic> json) {
  return _DurationsResponse.fromJson(json);
}

/// @nodoc
mixin _$DurationsResponse {
  List<DurationsEntity> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationsResponseCopyWith<DurationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationsResponseCopyWith<$Res> {
  factory $DurationsResponseCopyWith(
          DurationsResponse value, $Res Function(DurationsResponse) then) =
      _$DurationsResponseCopyWithImpl<$Res, DurationsResponse>;
  @useResult
  $Res call({List<DurationsEntity> data});
}

/// @nodoc
class _$DurationsResponseCopyWithImpl<$Res, $Val extends DurationsResponse>
    implements $DurationsResponseCopyWith<$Res> {
  _$DurationsResponseCopyWithImpl(this._value, this._then);

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
              as List<DurationsEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DurationsResponseCopyWith<$Res>
    implements $DurationsResponseCopyWith<$Res> {
  factory _$$_DurationsResponseCopyWith(_$_DurationsResponse value,
          $Res Function(_$_DurationsResponse) then) =
      __$$_DurationsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DurationsEntity> data});
}

/// @nodoc
class __$$_DurationsResponseCopyWithImpl<$Res>
    extends _$DurationsResponseCopyWithImpl<$Res, _$_DurationsResponse>
    implements _$$_DurationsResponseCopyWith<$Res> {
  __$$_DurationsResponseCopyWithImpl(
      _$_DurationsResponse _value, $Res Function(_$_DurationsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_DurationsResponse(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DurationsEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DurationsResponse implements _DurationsResponse {
  _$_DurationsResponse(final List<DurationsEntity> data) : _data = data;

  factory _$_DurationsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DurationsResponseFromJson(json);

  final List<DurationsEntity> _data;
  @override
  List<DurationsEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'DurationsResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DurationsResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DurationsResponseCopyWith<_$_DurationsResponse> get copyWith =>
      __$$_DurationsResponseCopyWithImpl<_$_DurationsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DurationsResponseToJson(
      this,
    );
  }
}

abstract class _DurationsResponse implements DurationsResponse {
  factory _DurationsResponse(final List<DurationsEntity> data) =
      _$_DurationsResponse;

  factory _DurationsResponse.fromJson(Map<String, dynamic> json) =
      _$_DurationsResponse.fromJson;

  @override
  List<DurationsEntity> get data;
  @override
  @JsonKey(ignore: true)
  _$$_DurationsResponseCopyWith<_$_DurationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
