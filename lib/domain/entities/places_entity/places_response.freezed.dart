// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'places_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacesResponse _$PlacesResponseFromJson(Map<String, dynamic> json) {
  return _PlacesResponse.fromJson(json);
}

/// @nodoc
mixin _$PlacesResponse {
  List<PlacesEntity> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacesResponseCopyWith<PlacesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesResponseCopyWith<$Res> {
  factory $PlacesResponseCopyWith(
          PlacesResponse value, $Res Function(PlacesResponse) then) =
      _$PlacesResponseCopyWithImpl<$Res, PlacesResponse>;
  @useResult
  $Res call({List<PlacesEntity> data});
}

/// @nodoc
class _$PlacesResponseCopyWithImpl<$Res, $Val extends PlacesResponse>
    implements $PlacesResponseCopyWith<$Res> {
  _$PlacesResponseCopyWithImpl(this._value, this._then);

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
              as List<PlacesEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlacesResponseCopyWith<$Res>
    implements $PlacesResponseCopyWith<$Res> {
  factory _$$_PlacesResponseCopyWith(
          _$_PlacesResponse value, $Res Function(_$_PlacesResponse) then) =
      __$$_PlacesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlacesEntity> data});
}

/// @nodoc
class __$$_PlacesResponseCopyWithImpl<$Res>
    extends _$PlacesResponseCopyWithImpl<$Res, _$_PlacesResponse>
    implements _$$_PlacesResponseCopyWith<$Res> {
  __$$_PlacesResponseCopyWithImpl(
      _$_PlacesResponse _value, $Res Function(_$_PlacesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_PlacesResponse(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PlacesEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlacesResponse implements _PlacesResponse {
  _$_PlacesResponse({required final List<PlacesEntity> data}) : _data = data;

  factory _$_PlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PlacesResponseFromJson(json);

  final List<PlacesEntity> _data;
  @override
  List<PlacesEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PlacesResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlacesResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlacesResponseCopyWith<_$_PlacesResponse> get copyWith =>
      __$$_PlacesResponseCopyWithImpl<_$_PlacesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacesResponseToJson(
      this,
    );
  }
}

abstract class _PlacesResponse implements PlacesResponse {
  factory _PlacesResponse({required final List<PlacesEntity> data}) =
      _$_PlacesResponse;

  factory _PlacesResponse.fromJson(Map<String, dynamic> json) =
      _$_PlacesResponse.fromJson;

  @override
  List<PlacesEntity> get data;
  @override
  @JsonKey(ignore: true)
  _$$_PlacesResponseCopyWith<_$_PlacesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
