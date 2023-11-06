// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ActivityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) load,
    required TResult Function(StandarEntity item) changeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? load,
    TResult? Function(StandarEntity item)? changeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? load,
    TResult Function(StandarEntity item)? changeItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_ChangeItem value) changeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_ChangeItem value)? changeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_ChangeItem value)? changeItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityEventCopyWith<$Res> {
  factory $ActivityEventCopyWith(
          ActivityEvent value, $Res Function(ActivityEvent) then) =
      _$ActivityEventCopyWithImpl<$Res, ActivityEvent>;
}

/// @nodoc
class _$ActivityEventCopyWithImpl<$Res, $Val extends ActivityEvent>
    implements $ActivityEventCopyWith<$Res> {
  _$ActivityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadCopyWith<$Res> {
  factory _$$_LoadCopyWith(_$_Load value, $Res Function(_$_Load) then) =
      __$$_LoadCopyWithImpl<$Res>;
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class __$$_LoadCopyWithImpl<$Res>
    extends _$ActivityEventCopyWithImpl<$Res, _$_Load>
    implements _$$_LoadCopyWith<$Res> {
  __$$_LoadCopyWithImpl(_$_Load _value, $Res Function(_$_Load) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$_Load(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$_Load implements _Load {
  const _$_Load({required this.filter});

  @override
  final Filter filter;

  @override
  String toString() {
    return 'ActivityEvent.load(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Load &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadCopyWith<_$_Load> get copyWith =>
      __$$_LoadCopyWithImpl<_$_Load>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) load,
    required TResult Function(StandarEntity item) changeItem,
  }) {
    return load(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? load,
    TResult? Function(StandarEntity item)? changeItem,
  }) {
    return load?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? load,
    TResult Function(StandarEntity item)? changeItem,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_ChangeItem value) changeItem,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_ChangeItem value)? changeItem,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_ChangeItem value)? changeItem,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements ActivityEvent {
  const factory _Load({required final Filter filter}) = _$_Load;

  Filter get filter;
  @JsonKey(ignore: true)
  _$$_LoadCopyWith<_$_Load> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeItemCopyWith<$Res> {
  factory _$$_ChangeItemCopyWith(
          _$_ChangeItem value, $Res Function(_$_ChangeItem) then) =
      __$$_ChangeItemCopyWithImpl<$Res>;
  @useResult
  $Res call({StandarEntity item});
}

/// @nodoc
class __$$_ChangeItemCopyWithImpl<$Res>
    extends _$ActivityEventCopyWithImpl<$Res, _$_ChangeItem>
    implements _$$_ChangeItemCopyWith<$Res> {
  __$$_ChangeItemCopyWithImpl(
      _$_ChangeItem _value, $Res Function(_$_ChangeItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_ChangeItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as StandarEntity,
    ));
  }
}

/// @nodoc

class _$_ChangeItem implements _ChangeItem {
  const _$_ChangeItem({required this.item});

  @override
  final StandarEntity item;

  @override
  String toString() {
    return 'ActivityEvent.changeItem(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeItem &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeItemCopyWith<_$_ChangeItem> get copyWith =>
      __$$_ChangeItemCopyWithImpl<_$_ChangeItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) load,
    required TResult Function(StandarEntity item) changeItem,
  }) {
    return changeItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? load,
    TResult? Function(StandarEntity item)? changeItem,
  }) {
    return changeItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? load,
    TResult Function(StandarEntity item)? changeItem,
    required TResult orElse(),
  }) {
    if (changeItem != null) {
      return changeItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_ChangeItem value) changeItem,
  }) {
    return changeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_ChangeItem value)? changeItem,
  }) {
    return changeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_ChangeItem value)? changeItem,
    required TResult orElse(),
  }) {
    if (changeItem != null) {
      return changeItem(this);
    }
    return orElse();
  }
}

abstract class _ChangeItem implements ActivityEvent {
  const factory _ChangeItem({required final StandarEntity item}) =
      _$_ChangeItem;

  StandarEntity get item;
  @JsonKey(ignore: true)
  _$$_ChangeItemCopyWith<_$_ChangeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ActivityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
    required TResult Function(StandarEntity item, List<StandarEntity> data)
        itemChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
    TResult? Function(StandarEntity item, List<StandarEntity> data)?
        itemChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    TResult Function(StandarEntity item, List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_ItemChanged value) itemChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityStateCopyWith<$Res> {
  factory $ActivityStateCopyWith(
          ActivityState value, $Res Function(ActivityState) then) =
      _$ActivityStateCopyWithImpl<$Res, ActivityState>;
}

/// @nodoc
class _$ActivityStateCopyWithImpl<$Res, $Val extends ActivityState>
    implements $ActivityStateCopyWith<$Res> {
  _$ActivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DataLoadedCopyWith<$Res> {
  factory _$$_DataLoadedCopyWith(
          _$_DataLoaded value, $Res Function(_$_DataLoaded) then) =
      __$$_DataLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StandarEntity> data});
}

/// @nodoc
class __$$_DataLoadedCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$_DataLoaded>
    implements _$$_DataLoadedCopyWith<$Res> {
  __$$_DataLoadedCopyWithImpl(
      _$_DataLoaded _value, $Res Function(_$_DataLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_DataLoaded(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>,
    ));
  }
}

/// @nodoc

class _$_DataLoaded implements _DataLoaded {
  const _$_DataLoaded({required final List<StandarEntity> data}) : _data = data;

  final List<StandarEntity> _data;
  @override
  List<StandarEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ActivityState.dataLoaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataLoaded &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataLoadedCopyWith<_$_DataLoaded> get copyWith =>
      __$$_DataLoadedCopyWithImpl<_$_DataLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
    required TResult Function(StandarEntity item, List<StandarEntity> data)
        itemChanged,
  }) {
    return dataLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
    TResult? Function(StandarEntity item, List<StandarEntity> data)?
        itemChanged,
  }) {
    return dataLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    TResult Function(StandarEntity item, List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) {
    if (dataLoaded != null) {
      return dataLoaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return dataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return dataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (dataLoaded != null) {
      return dataLoaded(this);
    }
    return orElse();
  }
}

abstract class _DataLoaded implements ActivityState {
  const factory _DataLoaded({required final List<StandarEntity> data}) =
      _$_DataLoaded;

  List<StandarEntity> get data;
  @JsonKey(ignore: true)
  _$$_DataLoadedCopyWith<_$_DataLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'ActivityState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
    required TResult Function(StandarEntity item, List<StandarEntity> data)
        itemChanged,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
    TResult? Function(StandarEntity item, List<StandarEntity> data)?
        itemChanged,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    TResult Function(StandarEntity item, List<StandarEntity> data)? itemChanged,
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
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ActivityState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'ActivityState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
    required TResult Function(StandarEntity item, List<StandarEntity> data)
        itemChanged,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
    TResult? Function(StandarEntity item, List<StandarEntity> data)?
        itemChanged,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    TResult Function(StandarEntity item, List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ActivityState {
  const factory _Error() = _$_Error;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ActivityState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
    required TResult Function(StandarEntity item, List<StandarEntity> data)
        itemChanged,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
    TResult? Function(StandarEntity item, List<StandarEntity> data)?
        itemChanged,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    TResult Function(StandarEntity item, List<StandarEntity> data)? itemChanged,
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
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ActivityState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_ItemChangedCopyWith<$Res> {
  factory _$$_ItemChangedCopyWith(
          _$_ItemChanged value, $Res Function(_$_ItemChanged) then) =
      __$$_ItemChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({StandarEntity item, List<StandarEntity> data});
}

/// @nodoc
class __$$_ItemChangedCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$_ItemChanged>
    implements _$$_ItemChangedCopyWith<$Res> {
  __$$_ItemChangedCopyWithImpl(
      _$_ItemChanged _value, $Res Function(_$_ItemChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? data = null,
  }) {
    return _then(_$_ItemChanged(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as StandarEntity,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>,
    ));
  }
}

/// @nodoc

class _$_ItemChanged implements _ItemChanged {
  const _$_ItemChanged(
      {required this.item, required final List<StandarEntity> data})
      : _data = data;

  @override
  final StandarEntity item;
  final List<StandarEntity> _data;
  @override
  List<StandarEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ActivityState.itemChanged(item: $item, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemChanged &&
            (identical(other.item, item) || other.item == item) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, item, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemChangedCopyWith<_$_ItemChanged> get copyWith =>
      __$$_ItemChangedCopyWithImpl<_$_ItemChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
    required TResult Function(StandarEntity item, List<StandarEntity> data)
        itemChanged,
  }) {
    return itemChanged(item, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
    TResult? Function(StandarEntity item, List<StandarEntity> data)?
        itemChanged,
  }) {
    return itemChanged?.call(item, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    TResult Function(StandarEntity item, List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) {
    if (itemChanged != null) {
      return itemChanged(item, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return itemChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return itemChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (itemChanged != null) {
      return itemChanged(this);
    }
    return orElse();
  }
}

abstract class _ItemChanged implements ActivityState {
  const factory _ItemChanged(
      {required final StandarEntity item,
      required final List<StandarEntity> data}) = _$_ItemChanged;

  StandarEntity get item;
  List<StandarEntity> get data;
  @JsonKey(ignore: true)
  _$$_ItemChangedCopyWith<_$_ItemChanged> get copyWith =>
      throw _privateConstructorUsedError;
}
