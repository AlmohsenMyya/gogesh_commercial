// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_days_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkDaysResponse _$WorkDaysResponseFromJson(Map<String, dynamic> json) {
  return _WorkDaysResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkDaysResponse {
  WorkDaysEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkDaysResponseCopyWith<WorkDaysResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkDaysResponseCopyWith<$Res> {
  factory $WorkDaysResponseCopyWith(
          WorkDaysResponse value, $Res Function(WorkDaysResponse) then) =
      _$WorkDaysResponseCopyWithImpl<$Res, WorkDaysResponse>;
  @useResult
  $Res call({WorkDaysEntity data});
}

/// @nodoc
class _$WorkDaysResponseCopyWithImpl<$Res, $Val extends WorkDaysResponse>
    implements $WorkDaysResponseCopyWith<$Res> {
  _$WorkDaysResponseCopyWithImpl(this._value, this._then);

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
              as WorkDaysEntity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkDaysResponseCopyWith<$Res>
    implements $WorkDaysResponseCopyWith<$Res> {
  factory _$$_WorkDaysResponseCopyWith(
          _$_WorkDaysResponse value, $Res Function(_$_WorkDaysResponse) then) =
      __$$_WorkDaysResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WorkDaysEntity data});
}

/// @nodoc
class __$$_WorkDaysResponseCopyWithImpl<$Res>
    extends _$WorkDaysResponseCopyWithImpl<$Res, _$_WorkDaysResponse>
    implements _$$_WorkDaysResponseCopyWith<$Res> {
  __$$_WorkDaysResponseCopyWithImpl(
      _$_WorkDaysResponse _value, $Res Function(_$_WorkDaysResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_WorkDaysResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WorkDaysEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkDaysResponse implements _WorkDaysResponse {
  _$_WorkDaysResponse({required this.data});

  factory _$_WorkDaysResponse.fromJson(Map<String, dynamic> json) =>
      _$$_WorkDaysResponseFromJson(json);

  @override
  final WorkDaysEntity data;

  @override
  String toString() {
    return 'WorkDaysResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkDaysResponse &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkDaysResponseCopyWith<_$_WorkDaysResponse> get copyWith =>
      __$$_WorkDaysResponseCopyWithImpl<_$_WorkDaysResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkDaysResponseToJson(
      this,
    );
  }
}

abstract class _WorkDaysResponse implements WorkDaysResponse {
  factory _WorkDaysResponse({required final WorkDaysEntity data}) =
      _$_WorkDaysResponse;

  factory _WorkDaysResponse.fromJson(Map<String, dynamic> json) =
      _$_WorkDaysResponse.fromJson;

  @override
  WorkDaysEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$_WorkDaysResponseCopyWith<_$_WorkDaysResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
