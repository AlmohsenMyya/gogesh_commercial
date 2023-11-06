// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'standar_paginated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StandarPaginated _$StandarPaginatedFromJson(Map<String, dynamic> json) {
  return _SectorsPaginated.fromJson(json);
}

/// @nodoc
mixin _$StandarPaginated {
  List<StandarEntity> get data => throw _privateConstructorUsedError;
  Meta? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StandarPaginatedCopyWith<StandarPaginated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandarPaginatedCopyWith<$Res> {
  factory $StandarPaginatedCopyWith(
          StandarPaginated value, $Res Function(StandarPaginated) then) =
      _$StandarPaginatedCopyWithImpl<$Res, StandarPaginated>;
  @useResult
  $Res call({List<StandarEntity> data, Meta? meta});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$StandarPaginatedCopyWithImpl<$Res, $Val extends StandarPaginated>
    implements $StandarPaginatedCopyWith<$Res> {
  _$StandarPaginatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SectorsPaginatedCopyWith<$Res>
    implements $StandarPaginatedCopyWith<$Res> {
  factory _$$_SectorsPaginatedCopyWith(
          _$_SectorsPaginated value, $Res Function(_$_SectorsPaginated) then) =
      __$$_SectorsPaginatedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StandarEntity> data, Meta? meta});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$_SectorsPaginatedCopyWithImpl<$Res>
    extends _$StandarPaginatedCopyWithImpl<$Res, _$_SectorsPaginated>
    implements _$$_SectorsPaginatedCopyWith<$Res> {
  __$$_SectorsPaginatedCopyWithImpl(
      _$_SectorsPaginated _value, $Res Function(_$_SectorsPaginated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = freezed,
  }) {
    return _then(_$_SectorsPaginated(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SectorsPaginated implements _SectorsPaginated {
  _$_SectorsPaginated(
      {required final List<StandarEntity> data, required this.meta})
      : _data = data;

  factory _$_SectorsPaginated.fromJson(Map<String, dynamic> json) =>
      _$$_SectorsPaginatedFromJson(json);

  final List<StandarEntity> _data;
  @override
  List<StandarEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final Meta? meta;

  @override
  String toString() {
    return 'StandarPaginated(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SectorsPaginated &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SectorsPaginatedCopyWith<_$_SectorsPaginated> get copyWith =>
      __$$_SectorsPaginatedCopyWithImpl<_$_SectorsPaginated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SectorsPaginatedToJson(
      this,
    );
  }
}

abstract class _SectorsPaginated implements StandarPaginated {
  factory _SectorsPaginated(
      {required final List<StandarEntity> data,
      required final Meta? meta}) = _$_SectorsPaginated;

  factory _SectorsPaginated.fromJson(Map<String, dynamic> json) =
      _$_SectorsPaginated.fromJson;

  @override
  List<StandarEntity> get data;
  @override
  Meta? get meta;
  @override
  @JsonKey(ignore: true)
  _$$_SectorsPaginatedCopyWith<_$_SectorsPaginated> get copyWith =>
      throw _privateConstructorUsedError;
}
