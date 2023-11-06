// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) loadMore,
    required TResult Function(Filter filter) loadData,
    required TResult Function(List<StandarEntity> items) changeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? loadMore,
    TResult? Function(Filter filter)? loadData,
    TResult? Function(List<StandarEntity> items)? changeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? loadMore,
    TResult Function(Filter filter)? loadData,
    TResult Function(List<StandarEntity> items)? changeItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadMore value) loadMore,
    required TResult Function(_loadData value) loadData,
    required TResult Function(_ChangeItem value) changeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadMore value)? loadMore,
    TResult? Function(_loadData value)? loadData,
    TResult? Function(_ChangeItem value)? changeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadMore value)? loadMore,
    TResult Function(_loadData value)? loadData,
    TResult Function(_ChangeItem value)? changeItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceEventCopyWith<$Res> {
  factory $ServiceEventCopyWith(
          ServiceEvent value, $Res Function(ServiceEvent) then) =
      _$ServiceEventCopyWithImpl<$Res, ServiceEvent>;
}

/// @nodoc
class _$ServiceEventCopyWithImpl<$Res, $Val extends ServiceEvent>
    implements $ServiceEventCopyWith<$Res> {
  _$ServiceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_loadMoreCopyWith<$Res> {
  factory _$$_loadMoreCopyWith(
          _$_loadMore value, $Res Function(_$_loadMore) then) =
      __$$_loadMoreCopyWithImpl<$Res>;
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class __$$_loadMoreCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$_loadMore>
    implements _$$_loadMoreCopyWith<$Res> {
  __$$_loadMoreCopyWithImpl(
      _$_loadMore _value, $Res Function(_$_loadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$_loadMore(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$_loadMore implements _loadMore {
  const _$_loadMore({required this.filter});

  @override
  final Filter filter;

  @override
  String toString() {
    return 'ServiceEvent.loadMore(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadMore &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadMoreCopyWith<_$_loadMore> get copyWith =>
      __$$_loadMoreCopyWithImpl<_$_loadMore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) loadMore,
    required TResult Function(Filter filter) loadData,
    required TResult Function(List<StandarEntity> items) changeItem,
  }) {
    return loadMore(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? loadMore,
    TResult? Function(Filter filter)? loadData,
    TResult? Function(List<StandarEntity> items)? changeItem,
  }) {
    return loadMore?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? loadMore,
    TResult Function(Filter filter)? loadData,
    TResult Function(List<StandarEntity> items)? changeItem,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadMore value) loadMore,
    required TResult Function(_loadData value) loadData,
    required TResult Function(_ChangeItem value) changeItem,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadMore value)? loadMore,
    TResult? Function(_loadData value)? loadData,
    TResult? Function(_ChangeItem value)? changeItem,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadMore value)? loadMore,
    TResult Function(_loadData value)? loadData,
    TResult Function(_ChangeItem value)? changeItem,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _loadMore implements ServiceEvent {
  const factory _loadMore({required final Filter filter}) = _$_loadMore;

  Filter get filter;
  @JsonKey(ignore: true)
  _$$_loadMoreCopyWith<_$_loadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_loadDataCopyWith<$Res> {
  factory _$$_loadDataCopyWith(
          _$_loadData value, $Res Function(_$_loadData) then) =
      __$$_loadDataCopyWithImpl<$Res>;
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class __$$_loadDataCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$_loadData>
    implements _$$_loadDataCopyWith<$Res> {
  __$$_loadDataCopyWithImpl(
      _$_loadData _value, $Res Function(_$_loadData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$_loadData(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$_loadData implements _loadData {
  const _$_loadData({required this.filter});

  @override
  final Filter filter;

  @override
  String toString() {
    return 'ServiceEvent.loadData(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadData &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadDataCopyWith<_$_loadData> get copyWith =>
      __$$_loadDataCopyWithImpl<_$_loadData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) loadMore,
    required TResult Function(Filter filter) loadData,
    required TResult Function(List<StandarEntity> items) changeItem,
  }) {
    return loadData(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? loadMore,
    TResult? Function(Filter filter)? loadData,
    TResult? Function(List<StandarEntity> items)? changeItem,
  }) {
    return loadData?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? loadMore,
    TResult Function(Filter filter)? loadData,
    TResult Function(List<StandarEntity> items)? changeItem,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadMore value) loadMore,
    required TResult Function(_loadData value) loadData,
    required TResult Function(_ChangeItem value) changeItem,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadMore value)? loadMore,
    TResult? Function(_loadData value)? loadData,
    TResult? Function(_ChangeItem value)? changeItem,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadMore value)? loadMore,
    TResult Function(_loadData value)? loadData,
    TResult Function(_ChangeItem value)? changeItem,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class _loadData implements ServiceEvent {
  const factory _loadData({required final Filter filter}) = _$_loadData;

  Filter get filter;
  @JsonKey(ignore: true)
  _$$_loadDataCopyWith<_$_loadData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeItemCopyWith<$Res> {
  factory _$$_ChangeItemCopyWith(
          _$_ChangeItem value, $Res Function(_$_ChangeItem) then) =
      __$$_ChangeItemCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StandarEntity> items});
}

/// @nodoc
class __$$_ChangeItemCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$_ChangeItem>
    implements _$$_ChangeItemCopyWith<$Res> {
  __$$_ChangeItemCopyWithImpl(
      _$_ChangeItem _value, $Res Function(_$_ChangeItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_ChangeItem(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>,
    ));
  }
}

/// @nodoc

class _$_ChangeItem implements _ChangeItem {
  const _$_ChangeItem({required final List<StandarEntity> items})
      : _items = items;

  final List<StandarEntity> _items;
  @override
  List<StandarEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ServiceEvent.changeItem(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeItem &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeItemCopyWith<_$_ChangeItem> get copyWith =>
      __$$_ChangeItemCopyWithImpl<_$_ChangeItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) loadMore,
    required TResult Function(Filter filter) loadData,
    required TResult Function(List<StandarEntity> items) changeItem,
  }) {
    return changeItem(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? loadMore,
    TResult? Function(Filter filter)? loadData,
    TResult? Function(List<StandarEntity> items)? changeItem,
  }) {
    return changeItem?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? loadMore,
    TResult Function(Filter filter)? loadData,
    TResult Function(List<StandarEntity> items)? changeItem,
    required TResult orElse(),
  }) {
    if (changeItem != null) {
      return changeItem(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadMore value) loadMore,
    required TResult Function(_loadData value) loadData,
    required TResult Function(_ChangeItem value) changeItem,
  }) {
    return changeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadMore value)? loadMore,
    TResult? Function(_loadData value)? loadData,
    TResult? Function(_ChangeItem value)? changeItem,
  }) {
    return changeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadMore value)? loadMore,
    TResult Function(_loadData value)? loadData,
    TResult Function(_ChangeItem value)? changeItem,
    required TResult orElse(),
  }) {
    if (changeItem != null) {
      return changeItem(this);
    }
    return orElse();
  }
}

abstract class _ChangeItem implements ServiceEvent {
  const factory _ChangeItem({required final List<StandarEntity> items}) =
      _$_ChangeItem;

  List<StandarEntity> get items;
  @JsonKey(ignore: true)
  _$$_ChangeItemCopyWith<_$_ChangeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() loadingMoreFailed,
    required TResult Function(ErrorState error) error,
    required TResult Function() loadingMore,
    required TResult Function(
            List<StandarEntity> data, dynamic pageKey, bool lastPage)
        loaded,
    required TResult Function(List<StandarEntity> data) itemChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? loadingMoreFailed,
    TResult? Function(ErrorState error)? error,
    TResult? Function()? loadingMore,
    TResult? Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult? Function(List<StandarEntity> data)? itemChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? loadingMoreFailed,
    TResult Function(ErrorState error)? error,
    TResult Function()? loadingMore,
    TResult Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult Function(List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_empty value) empty,
    required TResult Function(_LoadingMoreFailed value) loadingMoreFailed,
    required TResult Function(_error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Loadad value) loaded,
    required TResult Function(_ItemChanged value) itemChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_empty value)? empty,
    TResult? Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult? Function(_error value)? error,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Loadad value)? loaded,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_empty value)? empty,
    TResult Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult Function(_error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Loadad value)? loaded,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStateCopyWith<$Res> {
  factory $ServiceStateCopyWith(
          ServiceState value, $Res Function(ServiceState) then) =
      _$ServiceStateCopyWithImpl<$Res, ServiceState>;
}

/// @nodoc
class _$ServiceStateCopyWithImpl<$Res, $Val extends ServiceState>
    implements $ServiceStateCopyWith<$Res> {
  _$ServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initialCopyWith<$Res> {
  factory _$$_initialCopyWith(
          _$_initial value, $Res Function(_$_initial) then) =
      __$$_initialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_initialCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$_initial>
    implements _$$_initialCopyWith<$Res> {
  __$$_initialCopyWithImpl(_$_initial _value, $Res Function(_$_initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initial implements _initial {
  const _$_initial();

  @override
  String toString() {
    return 'ServiceState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() loadingMoreFailed,
    required TResult Function(ErrorState error) error,
    required TResult Function() loadingMore,
    required TResult Function(
            List<StandarEntity> data, dynamic pageKey, bool lastPage)
        loaded,
    required TResult Function(List<StandarEntity> data) itemChanged,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? loadingMoreFailed,
    TResult? Function(ErrorState error)? error,
    TResult? Function()? loadingMore,
    TResult? Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult? Function(List<StandarEntity> data)? itemChanged,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? loadingMoreFailed,
    TResult Function(ErrorState error)? error,
    TResult Function()? loadingMore,
    TResult Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult Function(List<StandarEntity> data)? itemChanged,
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
    required TResult Function(_initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_empty value) empty,
    required TResult Function(_LoadingMoreFailed value) loadingMoreFailed,
    required TResult Function(_error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Loadad value) loaded,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_empty value)? empty,
    TResult? Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult? Function(_error value)? error,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Loadad value)? loaded,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_empty value)? empty,
    TResult Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult Function(_error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Loadad value)? loaded,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initial implements ServiceState {
  const factory _initial() = _$_initial;
}

/// @nodoc
abstract class _$$_loadingCopyWith<$Res> {
  factory _$$_loadingCopyWith(
          _$_loading value, $Res Function(_$_loading) then) =
      __$$_loadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$_loading>
    implements _$$_loadingCopyWith<$Res> {
  __$$_loadingCopyWithImpl(_$_loading _value, $Res Function(_$_loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'ServiceState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() loadingMoreFailed,
    required TResult Function(ErrorState error) error,
    required TResult Function() loadingMore,
    required TResult Function(
            List<StandarEntity> data, dynamic pageKey, bool lastPage)
        loaded,
    required TResult Function(List<StandarEntity> data) itemChanged,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? loadingMoreFailed,
    TResult? Function(ErrorState error)? error,
    TResult? Function()? loadingMore,
    TResult? Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult? Function(List<StandarEntity> data)? itemChanged,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? loadingMoreFailed,
    TResult Function(ErrorState error)? error,
    TResult Function()? loadingMore,
    TResult Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult Function(List<StandarEntity> data)? itemChanged,
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
    required TResult Function(_initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_empty value) empty,
    required TResult Function(_LoadingMoreFailed value) loadingMoreFailed,
    required TResult Function(_error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Loadad value) loaded,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_empty value)? empty,
    TResult? Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult? Function(_error value)? error,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Loadad value)? loaded,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_empty value)? empty,
    TResult Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult Function(_error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Loadad value)? loaded,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements ServiceState {
  const factory _loading() = _$_loading;
}

/// @nodoc
abstract class _$$_emptyCopyWith<$Res> {
  factory _$$_emptyCopyWith(_$_empty value, $Res Function(_$_empty) then) =
      __$$_emptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_emptyCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$_empty>
    implements _$$_emptyCopyWith<$Res> {
  __$$_emptyCopyWithImpl(_$_empty _value, $Res Function(_$_empty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_empty implements _empty {
  const _$_empty();

  @override
  String toString() {
    return 'ServiceState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() loadingMoreFailed,
    required TResult Function(ErrorState error) error,
    required TResult Function() loadingMore,
    required TResult Function(
            List<StandarEntity> data, dynamic pageKey, bool lastPage)
        loaded,
    required TResult Function(List<StandarEntity> data) itemChanged,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? loadingMoreFailed,
    TResult? Function(ErrorState error)? error,
    TResult? Function()? loadingMore,
    TResult? Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult? Function(List<StandarEntity> data)? itemChanged,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? loadingMoreFailed,
    TResult Function(ErrorState error)? error,
    TResult Function()? loadingMore,
    TResult Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult Function(List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_empty value) empty,
    required TResult Function(_LoadingMoreFailed value) loadingMoreFailed,
    required TResult Function(_error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Loadad value) loaded,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_empty value)? empty,
    TResult? Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult? Function(_error value)? error,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Loadad value)? loaded,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_empty value)? empty,
    TResult Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult Function(_error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Loadad value)? loaded,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _empty implements ServiceState {
  const factory _empty() = _$_empty;
}

/// @nodoc
abstract class _$$_LoadingMoreFailedCopyWith<$Res> {
  factory _$$_LoadingMoreFailedCopyWith(_$_LoadingMoreFailed value,
          $Res Function(_$_LoadingMoreFailed) then) =
      __$$_LoadingMoreFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingMoreFailedCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$_LoadingMoreFailed>
    implements _$$_LoadingMoreFailedCopyWith<$Res> {
  __$$_LoadingMoreFailedCopyWithImpl(
      _$_LoadingMoreFailed _value, $Res Function(_$_LoadingMoreFailed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingMoreFailed implements _LoadingMoreFailed {
  const _$_LoadingMoreFailed();

  @override
  String toString() {
    return 'ServiceState.loadingMoreFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingMoreFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() loadingMoreFailed,
    required TResult Function(ErrorState error) error,
    required TResult Function() loadingMore,
    required TResult Function(
            List<StandarEntity> data, dynamic pageKey, bool lastPage)
        loaded,
    required TResult Function(List<StandarEntity> data) itemChanged,
  }) {
    return loadingMoreFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? loadingMoreFailed,
    TResult? Function(ErrorState error)? error,
    TResult? Function()? loadingMore,
    TResult? Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult? Function(List<StandarEntity> data)? itemChanged,
  }) {
    return loadingMoreFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? loadingMoreFailed,
    TResult Function(ErrorState error)? error,
    TResult Function()? loadingMore,
    TResult Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult Function(List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) {
    if (loadingMoreFailed != null) {
      return loadingMoreFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_empty value) empty,
    required TResult Function(_LoadingMoreFailed value) loadingMoreFailed,
    required TResult Function(_error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Loadad value) loaded,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return loadingMoreFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_empty value)? empty,
    TResult? Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult? Function(_error value)? error,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Loadad value)? loaded,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return loadingMoreFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_empty value)? empty,
    TResult Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult Function(_error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Loadad value)? loaded,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (loadingMoreFailed != null) {
      return loadingMoreFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadingMoreFailed implements ServiceState {
  const factory _LoadingMoreFailed() = _$_LoadingMoreFailed;
}

/// @nodoc
abstract class _$$_errorCopyWith<$Res> {
  factory _$$_errorCopyWith(_$_error value, $Res Function(_$_error) then) =
      __$$_errorCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorState error});

  $ErrorStateCopyWith<$Res> get error;
}

/// @nodoc
class __$$_errorCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$_error>
    implements _$$_errorCopyWith<$Res> {
  __$$_errorCopyWithImpl(_$_error _value, $Res Function(_$_error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_error(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorStateCopyWith<$Res> get error {
    return $ErrorStateCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$_error implements _error {
  const _$_error(this.error);

  @override
  final ErrorState error;

  @override
  String toString() {
    return 'ServiceState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_errorCopyWith<_$_error> get copyWith =>
      __$$_errorCopyWithImpl<_$_error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() loadingMoreFailed,
    required TResult Function(ErrorState error) error,
    required TResult Function() loadingMore,
    required TResult Function(
            List<StandarEntity> data, dynamic pageKey, bool lastPage)
        loaded,
    required TResult Function(List<StandarEntity> data) itemChanged,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? loadingMoreFailed,
    TResult? Function(ErrorState error)? error,
    TResult? Function()? loadingMore,
    TResult? Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult? Function(List<StandarEntity> data)? itemChanged,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? loadingMoreFailed,
    TResult Function(ErrorState error)? error,
    TResult Function()? loadingMore,
    TResult Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult Function(List<StandarEntity> data)? itemChanged,
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
    required TResult Function(_initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_empty value) empty,
    required TResult Function(_LoadingMoreFailed value) loadingMoreFailed,
    required TResult Function(_error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Loadad value) loaded,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_empty value)? empty,
    TResult? Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult? Function(_error value)? error,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Loadad value)? loaded,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_empty value)? empty,
    TResult Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult Function(_error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Loadad value)? loaded,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _error implements ServiceState {
  const factory _error(final ErrorState error) = _$_error;

  ErrorState get error;
  @JsonKey(ignore: true)
  _$$_errorCopyWith<_$_error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingMoreCopyWith<$Res> {
  factory _$$_LoadingMoreCopyWith(
          _$_LoadingMore value, $Res Function(_$_LoadingMore) then) =
      __$$_LoadingMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingMoreCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$_LoadingMore>
    implements _$$_LoadingMoreCopyWith<$Res> {
  __$$_LoadingMoreCopyWithImpl(
      _$_LoadingMore _value, $Res Function(_$_LoadingMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingMore implements _LoadingMore {
  const _$_LoadingMore();

  @override
  String toString() {
    return 'ServiceState.loadingMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() loadingMoreFailed,
    required TResult Function(ErrorState error) error,
    required TResult Function() loadingMore,
    required TResult Function(
            List<StandarEntity> data, dynamic pageKey, bool lastPage)
        loaded,
    required TResult Function(List<StandarEntity> data) itemChanged,
  }) {
    return loadingMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? loadingMoreFailed,
    TResult? Function(ErrorState error)? error,
    TResult? Function()? loadingMore,
    TResult? Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult? Function(List<StandarEntity> data)? itemChanged,
  }) {
    return loadingMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? loadingMoreFailed,
    TResult Function(ErrorState error)? error,
    TResult Function()? loadingMore,
    TResult Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult Function(List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_empty value) empty,
    required TResult Function(_LoadingMoreFailed value) loadingMoreFailed,
    required TResult Function(_error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Loadad value) loaded,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_empty value)? empty,
    TResult? Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult? Function(_error value)? error,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Loadad value)? loaded,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_empty value)? empty,
    TResult Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult Function(_error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Loadad value)? loaded,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class _LoadingMore implements ServiceState {
  const factory _LoadingMore() = _$_LoadingMore;
}

/// @nodoc
abstract class _$$_LoadadCopyWith<$Res> {
  factory _$$_LoadadCopyWith(_$_Loadad value, $Res Function(_$_Loadad) then) =
      __$$_LoadadCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StandarEntity> data, dynamic pageKey, bool lastPage});
}

/// @nodoc
class __$$_LoadadCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$_Loadad>
    implements _$$_LoadadCopyWith<$Res> {
  __$$_LoadadCopyWithImpl(_$_Loadad _value, $Res Function(_$_Loadad) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? pageKey = freezed,
    Object? lastPage = null,
  }) {
    return _then(_$_Loadad(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>,
      pageKey: freezed == pageKey ? _value.pageKey! : pageKey,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Loadad implements _Loadad {
  const _$_Loadad(
      {required final List<StandarEntity> data,
      this.pageKey,
      required this.lastPage})
      : _data = data;

  final List<StandarEntity> _data;
  @override
  List<StandarEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final dynamic pageKey;
  @override
  final bool lastPage;

  @override
  String toString() {
    return 'ServiceState.loaded(data: $data, pageKey: $pageKey, lastPage: $lastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loadad &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other.pageKey, pageKey) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(pageKey),
      lastPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadadCopyWith<_$_Loadad> get copyWith =>
      __$$_LoadadCopyWithImpl<_$_Loadad>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() loadingMoreFailed,
    required TResult Function(ErrorState error) error,
    required TResult Function() loadingMore,
    required TResult Function(
            List<StandarEntity> data, dynamic pageKey, bool lastPage)
        loaded,
    required TResult Function(List<StandarEntity> data) itemChanged,
  }) {
    return loaded(data, pageKey, lastPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? loadingMoreFailed,
    TResult? Function(ErrorState error)? error,
    TResult? Function()? loadingMore,
    TResult? Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult? Function(List<StandarEntity> data)? itemChanged,
  }) {
    return loaded?.call(data, pageKey, lastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? loadingMoreFailed,
    TResult Function(ErrorState error)? error,
    TResult Function()? loadingMore,
    TResult Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult Function(List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, pageKey, lastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_empty value) empty,
    required TResult Function(_LoadingMoreFailed value) loadingMoreFailed,
    required TResult Function(_error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Loadad value) loaded,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_empty value)? empty,
    TResult? Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult? Function(_error value)? error,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Loadad value)? loaded,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_empty value)? empty,
    TResult Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult Function(_error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Loadad value)? loaded,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loadad implements ServiceState {
  const factory _Loadad(
      {required final List<StandarEntity> data,
      final dynamic pageKey,
      required final bool lastPage}) = _$_Loadad;

  List<StandarEntity> get data;
  dynamic get pageKey;
  bool get lastPage;
  @JsonKey(ignore: true)
  _$$_LoadadCopyWith<_$_Loadad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ItemChangedCopyWith<$Res> {
  factory _$$_ItemChangedCopyWith(
          _$_ItemChanged value, $Res Function(_$_ItemChanged) then) =
      __$$_ItemChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StandarEntity> data});
}

/// @nodoc
class __$$_ItemChangedCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$_ItemChanged>
    implements _$$_ItemChangedCopyWith<$Res> {
  __$$_ItemChangedCopyWithImpl(
      _$_ItemChanged _value, $Res Function(_$_ItemChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_ItemChanged(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>,
    ));
  }
}

/// @nodoc

class _$_ItemChanged implements _ItemChanged {
  const _$_ItemChanged({required final List<StandarEntity> data})
      : _data = data;

  final List<StandarEntity> _data;
  @override
  List<StandarEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ServiceState.itemChanged(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemChanged &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemChangedCopyWith<_$_ItemChanged> get copyWith =>
      __$$_ItemChangedCopyWithImpl<_$_ItemChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() loadingMoreFailed,
    required TResult Function(ErrorState error) error,
    required TResult Function() loadingMore,
    required TResult Function(
            List<StandarEntity> data, dynamic pageKey, bool lastPage)
        loaded,
    required TResult Function(List<StandarEntity> data) itemChanged,
  }) {
    return itemChanged(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? loadingMoreFailed,
    TResult? Function(ErrorState error)? error,
    TResult? Function()? loadingMore,
    TResult? Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult? Function(List<StandarEntity> data)? itemChanged,
  }) {
    return itemChanged?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? loadingMoreFailed,
    TResult Function(ErrorState error)? error,
    TResult Function()? loadingMore,
    TResult Function(List<StandarEntity> data, dynamic pageKey, bool lastPage)?
        loaded,
    TResult Function(List<StandarEntity> data)? itemChanged,
    required TResult orElse(),
  }) {
    if (itemChanged != null) {
      return itemChanged(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_empty value) empty,
    required TResult Function(_LoadingMoreFailed value) loadingMoreFailed,
    required TResult Function(_error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Loadad value) loaded,
    required TResult Function(_ItemChanged value) itemChanged,
  }) {
    return itemChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_empty value)? empty,
    TResult? Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult? Function(_error value)? error,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Loadad value)? loaded,
    TResult? Function(_ItemChanged value)? itemChanged,
  }) {
    return itemChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_empty value)? empty,
    TResult Function(_LoadingMoreFailed value)? loadingMoreFailed,
    TResult Function(_error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Loadad value)? loaded,
    TResult Function(_ItemChanged value)? itemChanged,
    required TResult orElse(),
  }) {
    if (itemChanged != null) {
      return itemChanged(this);
    }
    return orElse();
  }
}

abstract class _ItemChanged implements ServiceState {
  const factory _ItemChanged({required final List<StandarEntity> data}) =
      _$_ItemChanged;

  List<StandarEntity> get data;
  @JsonKey(ignore: true)
  _$$_ItemChangedCopyWith<_$_ItemChanged> get copyWith =>
      throw _privateConstructorUsedError;
}
