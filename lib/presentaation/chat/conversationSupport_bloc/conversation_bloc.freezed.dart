// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConversationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) loadConversationSupport,
    required TResult Function() refresh,
    required TResult Function(Filter filter) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? loadConversationSupport,
    TResult? Function()? refresh,
    TResult? Function(Filter filter)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? loadConversationSupport,
    TResult Function()? refresh,
    TResult Function(Filter filter)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadConversation value) loadConversationSupport,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadConversation value)? loadConversationSupport,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadConversation value)? loadConversationSupport,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationEventCopyWith<$Res> {
  factory $ConversationEventCopyWith(
          ConversationEvent value, $Res Function(ConversationEvent) then) =
      _$ConversationEventCopyWithImpl<$Res, ConversationEvent>;
}

/// @nodoc
class _$ConversationEventCopyWithImpl<$Res, $Val extends ConversationEvent>
    implements $ConversationEventCopyWith<$Res> {
  _$ConversationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_loadConversationCopyWith<$Res> {
  factory _$$_loadConversationCopyWith(
          _$_loadConversation value, $Res Function(_$_loadConversation) then) =
      __$$_loadConversationCopyWithImpl<$Res>;
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class __$$_loadConversationCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res, _$_loadConversation>
    implements _$$_loadConversationCopyWith<$Res> {
  __$$_loadConversationCopyWithImpl(
      _$_loadConversation _value, $Res Function(_$_loadConversation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$_loadConversation(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$_loadConversation implements _loadConversation {
  const _$_loadConversation({required this.filter});

  @override
  final Filter filter;

  @override
  String toString() {
    return 'ConversationEvent.loadConversationSupport(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadConversation &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadConversationCopyWith<_$_loadConversation> get copyWith =>
      __$$_loadConversationCopyWithImpl<_$_loadConversation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) loadConversationSupport,
    required TResult Function() refresh,
    required TResult Function(Filter filter) loadMore,
  }) {
    return loadConversationSupport(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? loadConversationSupport,
    TResult? Function()? refresh,
    TResult? Function(Filter filter)? loadMore,
  }) {
    return loadConversationSupport?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? loadConversationSupport,
    TResult Function()? refresh,
    TResult Function(Filter filter)? loadMore,
    required TResult orElse(),
  }) {
    if (loadConversationSupport != null) {
      return loadConversationSupport(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadConversation value) loadConversationSupport,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadConversationSupport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadConversation value)? loadConversationSupport,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadConversationSupport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadConversation value)? loadConversationSupport,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadConversationSupport != null) {
      return loadConversationSupport(this);
    }
    return orElse();
  }
}

abstract class _loadConversation implements ConversationEvent {
  const factory _loadConversation({required final Filter filter}) =
      _$_loadConversation;

  Filter get filter;
  @JsonKey(ignore: true)
  _$$_loadConversationCopyWith<_$_loadConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshCopyWith<$Res> {
  factory _$$_RefreshCopyWith(
          _$_Refresh value, $Res Function(_$_Refresh) then) =
      __$$_RefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res, _$_Refresh>
    implements _$$_RefreshCopyWith<$Res> {
  __$$_RefreshCopyWithImpl(_$_Refresh _value, $Res Function(_$_Refresh) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Refresh implements _Refresh {
  const _$_Refresh();

  @override
  String toString() {
    return 'ConversationEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Refresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) loadConversationSupport,
    required TResult Function() refresh,
    required TResult Function(Filter filter) loadMore,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? loadConversationSupport,
    TResult? Function()? refresh,
    TResult? Function(Filter filter)? loadMore,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? loadConversationSupport,
    TResult Function()? refresh,
    TResult Function(Filter filter)? loadMore,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadConversation value) loadConversationSupport,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadConversation value)? loadConversationSupport,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadConversation value)? loadConversationSupport,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements ConversationEvent {
  const factory _Refresh() = _$_Refresh;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$_LoadMore(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore({required this.filter});

  @override
  final Filter filter;

  @override
  String toString() {
    return 'ConversationEvent.loadMore(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMore &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      __$$_LoadMoreCopyWithImpl<_$_LoadMore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) loadConversationSupport,
    required TResult Function() refresh,
    required TResult Function(Filter filter) loadMore,
  }) {
    return loadMore(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? loadConversationSupport,
    TResult? Function()? refresh,
    TResult? Function(Filter filter)? loadMore,
  }) {
    return loadMore?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? loadConversationSupport,
    TResult Function()? refresh,
    TResult Function(Filter filter)? loadMore,
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
    required TResult Function(_loadConversation value) loadConversationSupport,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadConversation value)? loadConversationSupport,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadConversation value)? loadConversationSupport,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements ConversationEvent {
  const factory _LoadMore({required final Filter filter}) = _$_LoadMore;

  Filter get filter;
  @JsonKey(ignore: true)
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConversationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(ErrorState error) error,
    required TResult Function(
            List<ConversationEntity> conversation, bool isLastPage)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(ErrorState error)? error,
    TResult? Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(ErrorState error)? error,
    TResult Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationStateCopyWith<$Res> {
  factory $ConversationStateCopyWith(
          ConversationState value, $Res Function(ConversationState) then) =
      _$ConversationStateCopyWithImpl<$Res, ConversationState>;
}

/// @nodoc
class _$ConversationStateCopyWithImpl<$Res, $Val extends ConversationState>
    implements $ConversationStateCopyWith<$Res> {
  _$ConversationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_loadingCopyWith<$Res> {
  factory _$$_loadingCopyWith(
          _$_loading value, $Res Function(_$_loading) then) =
      __$$_loadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res, _$_loading>
    implements _$$_loadingCopyWith<$Res> {
  __$$_loadingCopyWithImpl(_$_loading _value, $Res Function(_$_loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'ConversationState.loading()';
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
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(ErrorState error) error,
    required TResult Function(
            List<ConversationEntity> conversation, bool isLastPage)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(ErrorState error)? error,
    TResult? Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(ErrorState error)? error,
    TResult Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
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
    required TResult Function(_loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements ConversationState {
  const factory _loading() = _$_loading;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<$Res> {
  factory _$$_EmptyCopyWith(_$_Empty value, $Res Function(_$_Empty) then) =
      __$$_EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res, _$_Empty>
    implements _$$_EmptyCopyWith<$Res> {
  __$$_EmptyCopyWithImpl(_$_Empty _value, $Res Function(_$_Empty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'ConversationState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(ErrorState error) error,
    required TResult Function(
            List<ConversationEntity> conversation, bool isLastPage)
        loaded,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(ErrorState error)? error,
    TResult? Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(ErrorState error)? error,
    TResult Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
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
    required TResult Function(_loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements ConversationState {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorState error});

  $ErrorStateCopyWith<$Res> get error;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Error(
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

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final ErrorState error;

  @override
  String toString() {
    return 'ConversationState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(ErrorState error) error,
    required TResult Function(
            List<ConversationEntity> conversation, bool isLastPage)
        loaded,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(ErrorState error)? error,
    TResult? Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(ErrorState error)? error,
    TResult Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
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
    required TResult Function(_loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ConversationState {
  const factory _Error(final ErrorState error) = _$_Error;

  ErrorState get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ConversationEntity> conversation, bool isLastPage});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversation = null,
    Object? isLastPage = null,
  }) {
    return _then(_$_Loaded(
      conversation: null == conversation
          ? _value._conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as List<ConversationEntity>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required final List<ConversationEntity> conversation,
      required this.isLastPage})
      : _conversation = conversation;

  final List<ConversationEntity> _conversation;
  @override
  List<ConversationEntity> get conversation {
    if (_conversation is EqualUnmodifiableListView) return _conversation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversation);
  }

  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'ConversationState.loaded(conversation: $conversation, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality()
                .equals(other._conversation, _conversation) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_conversation), isLastPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(ErrorState error) error,
    required TResult Function(
            List<ConversationEntity> conversation, bool isLastPage)
        loaded,
  }) {
    return loaded(conversation, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(ErrorState error)? error,
    TResult? Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
  }) {
    return loaded?.call(conversation, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(ErrorState error)? error,
    TResult Function(List<ConversationEntity> conversation, bool isLastPage)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(conversation, isLastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ConversationState {
  const factory _Loaded(
      {required final List<ConversationEntity> conversation,
      required final bool isLastPage}) = _$_Loaded;

  List<ConversationEntity> get conversation;
  bool get isLastPage;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}
