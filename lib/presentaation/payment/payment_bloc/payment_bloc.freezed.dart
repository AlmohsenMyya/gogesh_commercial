// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentEvent {
  PaymentRequest get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentRequest request) addPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentRequest request)? addPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentRequest request)? addPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addPayment value) addPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addPayment value)? addPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addPayment value)? addPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentEventCopyWith<PaymentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res, PaymentEvent>;
  @useResult
  $Res call({PaymentRequest request});
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res, $Val extends PaymentEvent>
    implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as PaymentRequest,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_addPaymentCopyWith<$Res>
    implements $PaymentEventCopyWith<$Res> {
  factory _$$_addPaymentCopyWith(
          _$_addPayment value, $Res Function(_$_addPayment) then) =
      __$$_addPaymentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentRequest request});
}

/// @nodoc
class __$$_addPaymentCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$_addPayment>
    implements _$$_addPaymentCopyWith<$Res> {
  __$$_addPaymentCopyWithImpl(
      _$_addPayment _value, $Res Function(_$_addPayment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$_addPayment(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as PaymentRequest,
    ));
  }
}

/// @nodoc

class _$_addPayment implements _addPayment {
  const _$_addPayment({required this.request});

  @override
  final PaymentRequest request;

  @override
  String toString() {
    return 'PaymentEvent.addPayment(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addPayment &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_addPaymentCopyWith<_$_addPayment> get copyWith =>
      __$$_addPaymentCopyWithImpl<_$_addPayment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentRequest request) addPayment,
  }) {
    return addPayment(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentRequest request)? addPayment,
  }) {
    return addPayment?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentRequest request)? addPayment,
    required TResult orElse(),
  }) {
    if (addPayment != null) {
      return addPayment(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addPayment value) addPayment,
  }) {
    return addPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addPayment value)? addPayment,
  }) {
    return addPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addPayment value)? addPayment,
    required TResult orElse(),
  }) {
    if (addPayment != null) {
      return addPayment(this);
    }
    return orElse();
  }
}

abstract class _addPayment implements PaymentEvent {
  const factory _addPayment({required final PaymentRequest request}) =
      _$_addPayment;

  @override
  PaymentRequest get request;
  @override
  @JsonKey(ignore: true)
  _$$_addPaymentCopyWith<_$_addPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentResponse response) succes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentResponse response)? succes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentResponse response)? succes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_succes value) succes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

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
    extends _$PaymentStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'PaymentState.initial()';
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
    required TResult Function(PaymentResponse response) succes,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentResponse response)? succes,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentResponse response)? succes,
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
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PaymentState {
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
    extends _$PaymentStateCopyWithImpl<$Res, _$_loading>
    implements _$$_loadingCopyWith<$Res> {
  __$$_loadingCopyWithImpl(_$_loading _value, $Res Function(_$_loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'PaymentState.loading()';
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
    required TResult Function(PaymentResponse response) succes,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentResponse response)? succes,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentResponse response)? succes,
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
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements PaymentState {
  const factory _loading() = _$_loading;
}

/// @nodoc
abstract class _$$_succesCopyWith<$Res> {
  factory _$$_succesCopyWith(_$_succes value, $Res Function(_$_succes) then) =
      __$$_succesCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentResponse response});
}

/// @nodoc
class __$$_succesCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$_succes>
    implements _$$_succesCopyWith<$Res> {
  __$$_succesCopyWithImpl(_$_succes _value, $Res Function(_$_succes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$_succes(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as PaymentResponse,
    ));
  }
}

/// @nodoc

class _$_succes implements _succes {
  const _$_succes({required this.response});

  @override
  final PaymentResponse response;

  @override
  String toString() {
    return 'PaymentState.succes(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_succes &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_succesCopyWith<_$_succes> get copyWith =>
      __$$_succesCopyWithImpl<_$_succes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentResponse response) succes,
  }) {
    return succes(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentResponse response)? succes,
  }) {
    return succes?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentResponse response)? succes,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_succes value) succes,
  }) {
    return succes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_succes value)? succes,
  }) {
    return succes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_succes value)? succes,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(this);
    }
    return orElse();
  }
}

abstract class _succes implements PaymentState {
  const factory _succes({required final PaymentResponse response}) = _$_succes;

  PaymentResponse get response;
  @JsonKey(ignore: true)
  _$$_succesCopyWith<_$_succes> get copyWith =>
      throw _privateConstructorUsedError;
}
