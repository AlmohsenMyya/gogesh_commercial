// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_days_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkDaysEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(EditWorkDaysRequest request) editWorkDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(EditWorkDaysRequest request)? editWorkDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(EditWorkDaysRequest request)? editWorkDays,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_editWorkDays value) editWorkDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_editWorkDays value)? editWorkDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_editWorkDays value)? editWorkDays,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkDaysEventCopyWith<$Res> {
  factory $WorkDaysEventCopyWith(
          WorkDaysEvent value, $Res Function(WorkDaysEvent) then) =
      _$WorkDaysEventCopyWithImpl<$Res, WorkDaysEvent>;
}

/// @nodoc
class _$WorkDaysEventCopyWithImpl<$Res, $Val extends WorkDaysEvent>
    implements $WorkDaysEventCopyWith<$Res> {
  _$WorkDaysEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_loadCopyWith<$Res> {
  factory _$$_loadCopyWith(_$_load value, $Res Function(_$_load) then) =
      __$$_loadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadCopyWithImpl<$Res>
    extends _$WorkDaysEventCopyWithImpl<$Res, _$_load>
    implements _$$_loadCopyWith<$Res> {
  __$$_loadCopyWithImpl(_$_load _value, $Res Function(_$_load) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_load implements _load {
  const _$_load();

  @override
  String toString() {
    return 'WorkDaysEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(EditWorkDaysRequest request) editWorkDays,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(EditWorkDaysRequest request)? editWorkDays,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(EditWorkDaysRequest request)? editWorkDays,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_editWorkDays value) editWorkDays,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_editWorkDays value)? editWorkDays,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_editWorkDays value)? editWorkDays,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _load implements WorkDaysEvent {
  const factory _load() = _$_load;
}

/// @nodoc
abstract class _$$_editWorkDaysCopyWith<$Res> {
  factory _$$_editWorkDaysCopyWith(
          _$_editWorkDays value, $Res Function(_$_editWorkDays) then) =
      __$$_editWorkDaysCopyWithImpl<$Res>;
  @useResult
  $Res call({EditWorkDaysRequest request});
}

/// @nodoc
class __$$_editWorkDaysCopyWithImpl<$Res>
    extends _$WorkDaysEventCopyWithImpl<$Res, _$_editWorkDays>
    implements _$$_editWorkDaysCopyWith<$Res> {
  __$$_editWorkDaysCopyWithImpl(
      _$_editWorkDays _value, $Res Function(_$_editWorkDays) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$_editWorkDays(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as EditWorkDaysRequest,
    ));
  }
}

/// @nodoc

class _$_editWorkDays implements _editWorkDays {
  const _$_editWorkDays({required this.request});

  @override
  final EditWorkDaysRequest request;

  @override
  String toString() {
    return 'WorkDaysEvent.editWorkDays(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_editWorkDays &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_editWorkDaysCopyWith<_$_editWorkDays> get copyWith =>
      __$$_editWorkDaysCopyWithImpl<_$_editWorkDays>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(EditWorkDaysRequest request) editWorkDays,
  }) {
    return editWorkDays(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(EditWorkDaysRequest request)? editWorkDays,
  }) {
    return editWorkDays?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(EditWorkDaysRequest request)? editWorkDays,
    required TResult orElse(),
  }) {
    if (editWorkDays != null) {
      return editWorkDays(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_editWorkDays value) editWorkDays,
  }) {
    return editWorkDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_editWorkDays value)? editWorkDays,
  }) {
    return editWorkDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_editWorkDays value)? editWorkDays,
    required TResult orElse(),
  }) {
    if (editWorkDays != null) {
      return editWorkDays(this);
    }
    return orElse();
  }
}

abstract class _editWorkDays implements WorkDaysEvent {
  const factory _editWorkDays({required final EditWorkDaysRequest request}) =
      _$_editWorkDays;

  EditWorkDaysRequest get request;
  @JsonKey(ignore: true)
  _$$_editWorkDaysCopyWith<_$_editWorkDays> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WorkDaysState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(WorkDaysResponse data) dataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(WorkDaysResponse data)? dataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(WorkDaysResponse data)? dataLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_dataLoaded value) dataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_dataLoaded value)? dataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_dataLoaded value)? dataLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkDaysStateCopyWith<$Res> {
  factory $WorkDaysStateCopyWith(
          WorkDaysState value, $Res Function(WorkDaysState) then) =
      _$WorkDaysStateCopyWithImpl<$Res, WorkDaysState>;
}

/// @nodoc
class _$WorkDaysStateCopyWithImpl<$Res, $Val extends WorkDaysState>
    implements $WorkDaysStateCopyWith<$Res> {
  _$WorkDaysStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$WorkDaysStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'WorkDaysState.initial()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(WorkDaysResponse data) dataLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(WorkDaysResponse data)? dataLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(WorkDaysResponse data)? dataLoaded,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_dataLoaded value) dataLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_dataLoaded value)? dataLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_dataLoaded value)? dataLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WorkDaysState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_loadingCopyWith<$Res> {
  factory _$$_loadingCopyWith(
          _$_loading value, $Res Function(_$_loading) then) =
      __$$_loadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingCopyWithImpl<$Res>
    extends _$WorkDaysStateCopyWithImpl<$Res, _$_loading>
    implements _$$_loadingCopyWith<$Res> {
  __$$_loadingCopyWithImpl(_$_loading _value, $Res Function(_$_loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'WorkDaysState.loading()';
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
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(WorkDaysResponse data) dataLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(WorkDaysResponse data)? dataLoaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(WorkDaysResponse data)? dataLoaded,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_dataLoaded value) dataLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_dataLoaded value)? dataLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_dataLoaded value)? dataLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements WorkDaysState {
  const factory _loading() = _$_loading;
}

/// @nodoc
abstract class _$$_succesCopyWith<$Res> {
  factory _$$_succesCopyWith(_$_succes value, $Res Function(_$_succes) then) =
      __$$_succesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_succesCopyWithImpl<$Res>
    extends _$WorkDaysStateCopyWithImpl<$Res, _$_succes>
    implements _$$_succesCopyWith<$Res> {
  __$$_succesCopyWithImpl(_$_succes _value, $Res Function(_$_succes) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_succes implements _succes {
  const _$_succes();

  @override
  String toString() {
    return 'WorkDaysState.succes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_succes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(WorkDaysResponse data) dataLoaded,
  }) {
    return succes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(WorkDaysResponse data)? dataLoaded,
  }) {
    return succes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(WorkDaysResponse data)? dataLoaded,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_dataLoaded value) dataLoaded,
  }) {
    return succes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_dataLoaded value)? dataLoaded,
  }) {
    return succes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_dataLoaded value)? dataLoaded,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(this);
    }
    return orElse();
  }
}

abstract class _succes implements WorkDaysState {
  const factory _succes() = _$_succes;
}

/// @nodoc
abstract class _$$_errorCopyWith<$Res> {
  factory _$$_errorCopyWith(_$_error value, $Res Function(_$_error) then) =
      __$$_errorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$_errorCopyWithImpl<$Res>
    extends _$WorkDaysStateCopyWithImpl<$Res, _$_error>
    implements _$$_errorCopyWith<$Res> {
  __$$_errorCopyWithImpl(_$_error _value, $Res Function(_$_error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_error(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_error implements _error {
  const _$_error({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'WorkDaysState.error(error: $error)';
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
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(WorkDaysResponse data) dataLoaded,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(WorkDaysResponse data)? dataLoaded,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(WorkDaysResponse data)? dataLoaded,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_dataLoaded value) dataLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_dataLoaded value)? dataLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_dataLoaded value)? dataLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _error implements WorkDaysState {
  const factory _error({final String? error}) = _$_error;

  String? get error;
  @JsonKey(ignore: true)
  _$$_errorCopyWith<_$_error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_loadingEditCopyWith<$Res> {
  factory _$$_loadingEditCopyWith(
          _$_loadingEdit value, $Res Function(_$_loadingEdit) then) =
      __$$_loadingEditCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingEditCopyWithImpl<$Res>
    extends _$WorkDaysStateCopyWithImpl<$Res, _$_loadingEdit>
    implements _$$_loadingEditCopyWith<$Res> {
  __$$_loadingEditCopyWithImpl(
      _$_loadingEdit _value, $Res Function(_$_loadingEdit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loadingEdit implements _loadingEdit {
  const _$_loadingEdit();

  @override
  String toString() {
    return 'WorkDaysState.loadingEdit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_loadingEdit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(WorkDaysResponse data) dataLoaded,
  }) {
    return loadingEdit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(WorkDaysResponse data)? dataLoaded,
  }) {
    return loadingEdit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(WorkDaysResponse data)? dataLoaded,
    required TResult orElse(),
  }) {
    if (loadingEdit != null) {
      return loadingEdit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_dataLoaded value) dataLoaded,
  }) {
    return loadingEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_dataLoaded value)? dataLoaded,
  }) {
    return loadingEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_dataLoaded value)? dataLoaded,
    required TResult orElse(),
  }) {
    if (loadingEdit != null) {
      return loadingEdit(this);
    }
    return orElse();
  }
}

abstract class _loadingEdit implements WorkDaysState {
  const factory _loadingEdit() = _$_loadingEdit;
}

/// @nodoc
abstract class _$$_dataLoadedCopyWith<$Res> {
  factory _$$_dataLoadedCopyWith(
          _$_dataLoaded value, $Res Function(_$_dataLoaded) then) =
      __$$_dataLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({WorkDaysResponse data});

  $WorkDaysResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$_dataLoadedCopyWithImpl<$Res>
    extends _$WorkDaysStateCopyWithImpl<$Res, _$_dataLoaded>
    implements _$$_dataLoadedCopyWith<$Res> {
  __$$_dataLoadedCopyWithImpl(
      _$_dataLoaded _value, $Res Function(_$_dataLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_dataLoaded(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WorkDaysResponse,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkDaysResponseCopyWith<$Res> get data {
    return $WorkDaysResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$_dataLoaded implements _dataLoaded {
  const _$_dataLoaded({required this.data});

  @override
  final WorkDaysResponse data;

  @override
  String toString() {
    return 'WorkDaysState.dataLoaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_dataLoaded &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_dataLoadedCopyWith<_$_dataLoaded> get copyWith =>
      __$$_dataLoadedCopyWithImpl<_$_dataLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(WorkDaysResponse data) dataLoaded,
  }) {
    return dataLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(WorkDaysResponse data)? dataLoaded,
  }) {
    return dataLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(WorkDaysResponse data)? dataLoaded,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_dataLoaded value) dataLoaded,
  }) {
    return dataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_dataLoaded value)? dataLoaded,
  }) {
    return dataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_dataLoaded value)? dataLoaded,
    required TResult orElse(),
  }) {
    if (dataLoaded != null) {
      return dataLoaded(this);
    }
    return orElse();
  }
}

abstract class _dataLoaded implements WorkDaysState {
  const factory _dataLoaded({required final WorkDaysResponse data}) =
      _$_dataLoaded;

  WorkDaysResponse get data;
  @JsonKey(ignore: true)
  _$$_dataLoadedCopyWith<_$_dataLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
