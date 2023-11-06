// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SocialAccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(EditSocialAccounttRequest request)
        editSocialAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(EditSocialAccounttRequest request)? editSocialAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(EditSocialAccounttRequest request)? editSocialAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_editSocialAccount value) editSocialAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_editSocialAccount value)? editSocialAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_editSocialAccount value)? editSocialAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialAccountEventCopyWith<$Res> {
  factory $SocialAccountEventCopyWith(
          SocialAccountEvent value, $Res Function(SocialAccountEvent) then) =
      _$SocialAccountEventCopyWithImpl<$Res, SocialAccountEvent>;
}

/// @nodoc
class _$SocialAccountEventCopyWithImpl<$Res, $Val extends SocialAccountEvent>
    implements $SocialAccountEventCopyWith<$Res> {
  _$SocialAccountEventCopyWithImpl(this._value, this._then);

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
    extends _$SocialAccountEventCopyWithImpl<$Res, _$_load>
    implements _$$_loadCopyWith<$Res> {
  __$$_loadCopyWithImpl(_$_load _value, $Res Function(_$_load) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_load implements _load {
  const _$_load();

  @override
  String toString() {
    return 'SocialAccountEvent.load()';
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
    required TResult Function(EditSocialAccounttRequest request)
        editSocialAccount,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(EditSocialAccounttRequest request)? editSocialAccount,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(EditSocialAccounttRequest request)? editSocialAccount,
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
    required TResult Function(_editSocialAccount value) editSocialAccount,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_editSocialAccount value)? editSocialAccount,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_editSocialAccount value)? editSocialAccount,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _load implements SocialAccountEvent {
  const factory _load() = _$_load;
}

/// @nodoc
abstract class _$$_editSocialAccountCopyWith<$Res> {
  factory _$$_editSocialAccountCopyWith(_$_editSocialAccount value,
          $Res Function(_$_editSocialAccount) then) =
      __$$_editSocialAccountCopyWithImpl<$Res>;
  @useResult
  $Res call({EditSocialAccounttRequest request});
}

/// @nodoc
class __$$_editSocialAccountCopyWithImpl<$Res>
    extends _$SocialAccountEventCopyWithImpl<$Res, _$_editSocialAccount>
    implements _$$_editSocialAccountCopyWith<$Res> {
  __$$_editSocialAccountCopyWithImpl(
      _$_editSocialAccount _value, $Res Function(_$_editSocialAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$_editSocialAccount(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as EditSocialAccounttRequest,
    ));
  }
}

/// @nodoc

class _$_editSocialAccount implements _editSocialAccount {
  const _$_editSocialAccount({required this.request});

  @override
  final EditSocialAccounttRequest request;

  @override
  String toString() {
    return 'SocialAccountEvent.editSocialAccount(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_editSocialAccount &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_editSocialAccountCopyWith<_$_editSocialAccount> get copyWith =>
      __$$_editSocialAccountCopyWithImpl<_$_editSocialAccount>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(EditSocialAccounttRequest request)
        editSocialAccount,
  }) {
    return editSocialAccount(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(EditSocialAccounttRequest request)? editSocialAccount,
  }) {
    return editSocialAccount?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(EditSocialAccounttRequest request)? editSocialAccount,
    required TResult orElse(),
  }) {
    if (editSocialAccount != null) {
      return editSocialAccount(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_editSocialAccount value) editSocialAccount,
  }) {
    return editSocialAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_editSocialAccount value)? editSocialAccount,
  }) {
    return editSocialAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_editSocialAccount value)? editSocialAccount,
    required TResult orElse(),
  }) {
    if (editSocialAccount != null) {
      return editSocialAccount(this);
    }
    return orElse();
  }
}

abstract class _editSocialAccount implements SocialAccountEvent {
  const factory _editSocialAccount(
          {required final EditSocialAccounttRequest request}) =
      _$_editSocialAccount;

  EditSocialAccounttRequest get request;
  @JsonKey(ignore: true)
  _$$_editSocialAccountCopyWith<_$_editSocialAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SocialAccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(SocialAccountResponse data) dataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(SocialAccountResponse data)? dataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(SocialAccountResponse data)? dataLoaded,
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
abstract class $SocialAccountStateCopyWith<$Res> {
  factory $SocialAccountStateCopyWith(
          SocialAccountState value, $Res Function(SocialAccountState) then) =
      _$SocialAccountStateCopyWithImpl<$Res, SocialAccountState>;
}

/// @nodoc
class _$SocialAccountStateCopyWithImpl<$Res, $Val extends SocialAccountState>
    implements $SocialAccountStateCopyWith<$Res> {
  _$SocialAccountStateCopyWithImpl(this._value, this._then);

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
    extends _$SocialAccountStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SocialAccountState.initial()';
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
    required TResult Function(SocialAccountResponse data) dataLoaded,
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
    TResult? Function(SocialAccountResponse data)? dataLoaded,
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
    TResult Function(SocialAccountResponse data)? dataLoaded,
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

abstract class _Initial implements SocialAccountState {
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
    extends _$SocialAccountStateCopyWithImpl<$Res, _$_loading>
    implements _$$_loadingCopyWith<$Res> {
  __$$_loadingCopyWithImpl(_$_loading _value, $Res Function(_$_loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'SocialAccountState.loading()';
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
    required TResult Function(SocialAccountResponse data) dataLoaded,
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
    TResult? Function(SocialAccountResponse data)? dataLoaded,
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
    TResult Function(SocialAccountResponse data)? dataLoaded,
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

abstract class _loading implements SocialAccountState {
  const factory _loading() = _$_loading;
}

/// @nodoc
abstract class _$$_succesCopyWith<$Res> {
  factory _$$_succesCopyWith(_$_succes value, $Res Function(_$_succes) then) =
      __$$_succesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_succesCopyWithImpl<$Res>
    extends _$SocialAccountStateCopyWithImpl<$Res, _$_succes>
    implements _$$_succesCopyWith<$Res> {
  __$$_succesCopyWithImpl(_$_succes _value, $Res Function(_$_succes) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_succes implements _succes {
  const _$_succes();

  @override
  String toString() {
    return 'SocialAccountState.succes()';
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
    required TResult Function(SocialAccountResponse data) dataLoaded,
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
    TResult? Function(SocialAccountResponse data)? dataLoaded,
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
    TResult Function(SocialAccountResponse data)? dataLoaded,
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

abstract class _succes implements SocialAccountState {
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
    extends _$SocialAccountStateCopyWithImpl<$Res, _$_error>
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
    return 'SocialAccountState.error(error: $error)';
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
    required TResult Function(SocialAccountResponse data) dataLoaded,
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
    TResult? Function(SocialAccountResponse data)? dataLoaded,
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
    TResult Function(SocialAccountResponse data)? dataLoaded,
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

abstract class _error implements SocialAccountState {
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
    extends _$SocialAccountStateCopyWithImpl<$Res, _$_loadingEdit>
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
    return 'SocialAccountState.loadingEdit()';
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
    required TResult Function(SocialAccountResponse data) dataLoaded,
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
    TResult? Function(SocialAccountResponse data)? dataLoaded,
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
    TResult Function(SocialAccountResponse data)? dataLoaded,
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

abstract class _loadingEdit implements SocialAccountState {
  const factory _loadingEdit() = _$_loadingEdit;
}

/// @nodoc
abstract class _$$_dataLoadedCopyWith<$Res> {
  factory _$$_dataLoadedCopyWith(
          _$_dataLoaded value, $Res Function(_$_dataLoaded) then) =
      __$$_dataLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({SocialAccountResponse data});

  $SocialAccountResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$_dataLoadedCopyWithImpl<$Res>
    extends _$SocialAccountStateCopyWithImpl<$Res, _$_dataLoaded>
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
              as SocialAccountResponse,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SocialAccountResponseCopyWith<$Res> get data {
    return $SocialAccountResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$_dataLoaded implements _dataLoaded {
  const _$_dataLoaded({required this.data});

  @override
  final SocialAccountResponse data;

  @override
  String toString() {
    return 'SocialAccountState.dataLoaded(data: $data)';
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
    required TResult Function(SocialAccountResponse data) dataLoaded,
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
    TResult? Function(SocialAccountResponse data)? dataLoaded,
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
    TResult Function(SocialAccountResponse data)? dataLoaded,
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

abstract class _dataLoaded implements SocialAccountState {
  const factory _dataLoaded({required final SocialAccountResponse data}) =
      _$_dataLoaded;

  SocialAccountResponse get data;
  @JsonKey(ignore: true)
  _$$_dataLoadedCopyWith<_$_dataLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
