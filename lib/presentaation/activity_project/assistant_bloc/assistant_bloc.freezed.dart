// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistant_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AssistantEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(AddAssistantRequest request) addAssistant,
    required TResult Function(ImageSource source) uploadImage,
    required TResult Function(int id, int index) deleteAssistant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(AddAssistantRequest request)? addAssistant,
    TResult? Function(ImageSource source)? uploadImage,
    TResult? Function(int id, int index)? deleteAssistant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(AddAssistantRequest request)? addAssistant,
    TResult Function(ImageSource source)? uploadImage,
    TResult Function(int id, int index)? deleteAssistant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_addAssistant value) addAssistant,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_deleteAssistant value) deleteAssistant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_addAssistant value)? addAssistant,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_deleteAssistant value)? deleteAssistant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_addAssistant value)? addAssistant,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_deleteAssistant value)? deleteAssistant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssistantEventCopyWith<$Res> {
  factory $AssistantEventCopyWith(
          AssistantEvent value, $Res Function(AssistantEvent) then) =
      _$AssistantEventCopyWithImpl<$Res, AssistantEvent>;
}

/// @nodoc
class _$AssistantEventCopyWithImpl<$Res, $Val extends AssistantEvent>
    implements $AssistantEventCopyWith<$Res> {
  _$AssistantEventCopyWithImpl(this._value, this._then);

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
    extends _$AssistantEventCopyWithImpl<$Res, _$_load>
    implements _$$_loadCopyWith<$Res> {
  __$$_loadCopyWithImpl(_$_load _value, $Res Function(_$_load) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_load implements _load {
  const _$_load();

  @override
  String toString() {
    return 'AssistantEvent.load()';
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
    required TResult Function(AddAssistantRequest request) addAssistant,
    required TResult Function(ImageSource source) uploadImage,
    required TResult Function(int id, int index) deleteAssistant,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(AddAssistantRequest request)? addAssistant,
    TResult? Function(ImageSource source)? uploadImage,
    TResult? Function(int id, int index)? deleteAssistant,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(AddAssistantRequest request)? addAssistant,
    TResult Function(ImageSource source)? uploadImage,
    TResult Function(int id, int index)? deleteAssistant,
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
    required TResult Function(_addAssistant value) addAssistant,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_deleteAssistant value) deleteAssistant,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_addAssistant value)? addAssistant,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_deleteAssistant value)? deleteAssistant,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_addAssistant value)? addAssistant,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_deleteAssistant value)? deleteAssistant,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _load implements AssistantEvent {
  const factory _load() = _$_load;
}

/// @nodoc
abstract class _$$_addAssistantCopyWith<$Res> {
  factory _$$_addAssistantCopyWith(
          _$_addAssistant value, $Res Function(_$_addAssistant) then) =
      __$$_addAssistantCopyWithImpl<$Res>;
  @useResult
  $Res call({AddAssistantRequest request});
}

/// @nodoc
class __$$_addAssistantCopyWithImpl<$Res>
    extends _$AssistantEventCopyWithImpl<$Res, _$_addAssistant>
    implements _$$_addAssistantCopyWith<$Res> {
  __$$_addAssistantCopyWithImpl(
      _$_addAssistant _value, $Res Function(_$_addAssistant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$_addAssistant(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as AddAssistantRequest,
    ));
  }
}

/// @nodoc

class _$_addAssistant implements _addAssistant {
  const _$_addAssistant({required this.request});

  @override
  final AddAssistantRequest request;

  @override
  String toString() {
    return 'AssistantEvent.addAssistant(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addAssistant &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_addAssistantCopyWith<_$_addAssistant> get copyWith =>
      __$$_addAssistantCopyWithImpl<_$_addAssistant>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(AddAssistantRequest request) addAssistant,
    required TResult Function(ImageSource source) uploadImage,
    required TResult Function(int id, int index) deleteAssistant,
  }) {
    return addAssistant(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(AddAssistantRequest request)? addAssistant,
    TResult? Function(ImageSource source)? uploadImage,
    TResult? Function(int id, int index)? deleteAssistant,
  }) {
    return addAssistant?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(AddAssistantRequest request)? addAssistant,
    TResult Function(ImageSource source)? uploadImage,
    TResult Function(int id, int index)? deleteAssistant,
    required TResult orElse(),
  }) {
    if (addAssistant != null) {
      return addAssistant(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_addAssistant value) addAssistant,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_deleteAssistant value) deleteAssistant,
  }) {
    return addAssistant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_addAssistant value)? addAssistant,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_deleteAssistant value)? deleteAssistant,
  }) {
    return addAssistant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_addAssistant value)? addAssistant,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_deleteAssistant value)? deleteAssistant,
    required TResult orElse(),
  }) {
    if (addAssistant != null) {
      return addAssistant(this);
    }
    return orElse();
  }
}

abstract class _addAssistant implements AssistantEvent {
  const factory _addAssistant({required final AddAssistantRequest request}) =
      _$_addAssistant;

  AddAssistantRequest get request;
  @JsonKey(ignore: true)
  _$$_addAssistantCopyWith<_$_addAssistant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadImageCopyWith<$Res> {
  factory _$$_UploadImageCopyWith(
          _$_UploadImage value, $Res Function(_$_UploadImage) then) =
      __$$_UploadImageCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSource source});
}

/// @nodoc
class __$$_UploadImageCopyWithImpl<$Res>
    extends _$AssistantEventCopyWithImpl<$Res, _$_UploadImage>
    implements _$$_UploadImageCopyWith<$Res> {
  __$$_UploadImageCopyWithImpl(
      _$_UploadImage _value, $Res Function(_$_UploadImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$_UploadImage(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageSource,
    ));
  }
}

/// @nodoc

class _$_UploadImage implements _UploadImage {
  const _$_UploadImage({required this.source});

  @override
  final ImageSource source;

  @override
  String toString() {
    return 'AssistantEvent.uploadImage(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadImage &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadImageCopyWith<_$_UploadImage> get copyWith =>
      __$$_UploadImageCopyWithImpl<_$_UploadImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(AddAssistantRequest request) addAssistant,
    required TResult Function(ImageSource source) uploadImage,
    required TResult Function(int id, int index) deleteAssistant,
  }) {
    return uploadImage(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(AddAssistantRequest request)? addAssistant,
    TResult? Function(ImageSource source)? uploadImage,
    TResult? Function(int id, int index)? deleteAssistant,
  }) {
    return uploadImage?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(AddAssistantRequest request)? addAssistant,
    TResult Function(ImageSource source)? uploadImage,
    TResult Function(int id, int index)? deleteAssistant,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_addAssistant value) addAssistant,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_deleteAssistant value) deleteAssistant,
  }) {
    return uploadImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_addAssistant value)? addAssistant,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_deleteAssistant value)? deleteAssistant,
  }) {
    return uploadImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_addAssistant value)? addAssistant,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_deleteAssistant value)? deleteAssistant,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(this);
    }
    return orElse();
  }
}

abstract class _UploadImage implements AssistantEvent {
  const factory _UploadImage({required final ImageSource source}) =
      _$_UploadImage;

  ImageSource get source;
  @JsonKey(ignore: true)
  _$$_UploadImageCopyWith<_$_UploadImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_deleteAssistantCopyWith<$Res> {
  factory _$$_deleteAssistantCopyWith(
          _$_deleteAssistant value, $Res Function(_$_deleteAssistant) then) =
      __$$_deleteAssistantCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, int index});
}

/// @nodoc
class __$$_deleteAssistantCopyWithImpl<$Res>
    extends _$AssistantEventCopyWithImpl<$Res, _$_deleteAssistant>
    implements _$$_deleteAssistantCopyWith<$Res> {
  __$$_deleteAssistantCopyWithImpl(
      _$_deleteAssistant _value, $Res Function(_$_deleteAssistant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
  }) {
    return _then(_$_deleteAssistant(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_deleteAssistant implements _deleteAssistant {
  const _$_deleteAssistant({required this.id, required this.index});

  @override
  final int id;
  @override
  final int index;

  @override
  String toString() {
    return 'AssistantEvent.deleteAssistant(id: $id, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_deleteAssistant &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_deleteAssistantCopyWith<_$_deleteAssistant> get copyWith =>
      __$$_deleteAssistantCopyWithImpl<_$_deleteAssistant>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(AddAssistantRequest request) addAssistant,
    required TResult Function(ImageSource source) uploadImage,
    required TResult Function(int id, int index) deleteAssistant,
  }) {
    return deleteAssistant(id, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(AddAssistantRequest request)? addAssistant,
    TResult? Function(ImageSource source)? uploadImage,
    TResult? Function(int id, int index)? deleteAssistant,
  }) {
    return deleteAssistant?.call(id, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(AddAssistantRequest request)? addAssistant,
    TResult Function(ImageSource source)? uploadImage,
    TResult Function(int id, int index)? deleteAssistant,
    required TResult orElse(),
  }) {
    if (deleteAssistant != null) {
      return deleteAssistant(id, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_addAssistant value) addAssistant,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_deleteAssistant value) deleteAssistant,
  }) {
    return deleteAssistant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_load value)? load,
    TResult? Function(_addAssistant value)? addAssistant,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_deleteAssistant value)? deleteAssistant,
  }) {
    return deleteAssistant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_addAssistant value)? addAssistant,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_deleteAssistant value)? deleteAssistant,
    required TResult orElse(),
  }) {
    if (deleteAssistant != null) {
      return deleteAssistant(this);
    }
    return orElse();
  }
}

abstract class _deleteAssistant implements AssistantEvent {
  const factory _deleteAssistant(
      {required final int id, required final int index}) = _$_deleteAssistant;

  int get id;
  int get index;
  @JsonKey(ignore: true)
  _$$_deleteAssistantCopyWith<_$_deleteAssistant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AssistantState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssistantStateCopyWith<$Res> {
  factory $AssistantStateCopyWith(
          AssistantState value, $Res Function(AssistantState) then) =
      _$AssistantStateCopyWithImpl<$Res, AssistantState>;
}

/// @nodoc
class _$AssistantStateCopyWithImpl<$Res, $Val extends AssistantState>
    implements $AssistantStateCopyWith<$Res> {
  _$AssistantStateCopyWithImpl(this._value, this._then);

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
    extends _$AssistantStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AssistantState.initial()';
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
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
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
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AssistantState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_dataLoadedCopyWith<$Res> {
  factory _$$_dataLoadedCopyWith(
          _$_dataLoaded value, $Res Function(_$_dataLoaded) then) =
      __$$_dataLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProfileEntity> data});
}

/// @nodoc
class __$$_dataLoadedCopyWithImpl<$Res>
    extends _$AssistantStateCopyWithImpl<$Res, _$_dataLoaded>
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
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProfileEntity>,
    ));
  }
}

/// @nodoc

class _$_dataLoaded implements _dataLoaded {
  const _$_dataLoaded({required final List<ProfileEntity> data}) : _data = data;

  final List<ProfileEntity> _data;
  @override
  List<ProfileEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AssistantState.dataLoaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_dataLoaded &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_dataLoadedCopyWith<_$_dataLoaded> get copyWith =>
      __$$_dataLoadedCopyWithImpl<_$_dataLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) {
    return dataLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return dataLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
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
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return dataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return dataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (dataLoaded != null) {
      return dataLoaded(this);
    }
    return orElse();
  }
}

abstract class _dataLoaded implements AssistantState {
  const factory _dataLoaded({required final List<ProfileEntity> data}) =
      _$_dataLoaded;

  List<ProfileEntity> get data;
  @JsonKey(ignore: true)
  _$$_dataLoadedCopyWith<_$_dataLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_loadingDeleteCopyWith<$Res> {
  factory _$$_loadingDeleteCopyWith(
          _$_loadingDelete value, $Res Function(_$_loadingDelete) then) =
      __$$_loadingDeleteCopyWithImpl<$Res>;
  @useResult
  $Res call({int indx});
}

/// @nodoc
class __$$_loadingDeleteCopyWithImpl<$Res>
    extends _$AssistantStateCopyWithImpl<$Res, _$_loadingDelete>
    implements _$$_loadingDeleteCopyWith<$Res> {
  __$$_loadingDeleteCopyWithImpl(
      _$_loadingDelete _value, $Res Function(_$_loadingDelete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indx = null,
  }) {
    return _then(_$_loadingDelete(
      indx: null == indx
          ? _value.indx
          : indx // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_loadingDelete implements _loadingDelete {
  const _$_loadingDelete({required this.indx});

  @override
  final int indx;

  @override
  String toString() {
    return 'AssistantState.loadingDelete(indx: $indx)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadingDelete &&
            (identical(other.indx, indx) || other.indx == indx));
  }

  @override
  int get hashCode => Object.hash(runtimeType, indx);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadingDeleteCopyWith<_$_loadingDelete> get copyWith =>
      __$$_loadingDeleteCopyWithImpl<_$_loadingDelete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) {
    return loadingDelete(indx);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return loadingDelete?.call(indx);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
    required TResult orElse(),
  }) {
    if (loadingDelete != null) {
      return loadingDelete(indx);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return loadingDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return loadingDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (loadingDelete != null) {
      return loadingDelete(this);
    }
    return orElse();
  }
}

abstract class _loadingDelete implements AssistantState {
  const factory _loadingDelete({required final int indx}) = _$_loadingDelete;

  int get indx;
  @JsonKey(ignore: true)
  _$$_loadingDeleteCopyWith<_$_loadingDelete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_successDeleteCopyWith<$Res> {
  factory _$$_successDeleteCopyWith(
          _$_successDelete value, $Res Function(_$_successDelete) then) =
      __$$_successDeleteCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_successDeleteCopyWithImpl<$Res>
    extends _$AssistantStateCopyWithImpl<$Res, _$_successDelete>
    implements _$$_successDeleteCopyWith<$Res> {
  __$$_successDeleteCopyWithImpl(
      _$_successDelete _value, $Res Function(_$_successDelete) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_successDelete implements _successDelete {
  const _$_successDelete();

  @override
  String toString() {
    return 'AssistantState.successDelete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_successDelete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) {
    return successDelete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return successDelete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
    required TResult orElse(),
  }) {
    if (successDelete != null) {
      return successDelete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return successDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return successDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (successDelete != null) {
      return successDelete(this);
    }
    return orElse();
  }
}

abstract class _successDelete implements AssistantState {
  const factory _successDelete() = _$_successDelete;
}

/// @nodoc
abstract class _$$_loadingCopyWith<$Res> {
  factory _$$_loadingCopyWith(
          _$_loading value, $Res Function(_$_loading) then) =
      __$$_loadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingCopyWithImpl<$Res>
    extends _$AssistantStateCopyWithImpl<$Res, _$_loading>
    implements _$$_loadingCopyWith<$Res> {
  __$$_loadingCopyWithImpl(_$_loading _value, $Res Function(_$_loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'AssistantState.loading()';
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
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
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
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements AssistantState {
  const factory _loading() = _$_loading;
}

/// @nodoc
abstract class _$$_loadingAddCopyWith<$Res> {
  factory _$$_loadingAddCopyWith(
          _$_loadingAdd value, $Res Function(_$_loadingAdd) then) =
      __$$_loadingAddCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingAddCopyWithImpl<$Res>
    extends _$AssistantStateCopyWithImpl<$Res, _$_loadingAdd>
    implements _$$_loadingAddCopyWith<$Res> {
  __$$_loadingAddCopyWithImpl(
      _$_loadingAdd _value, $Res Function(_$_loadingAdd) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loadingAdd implements _loadingAdd {
  const _$_loadingAdd();

  @override
  String toString() {
    return 'AssistantState.loadingAdd()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_loadingAdd);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) {
    return loadingAdd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return loadingAdd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
    required TResult orElse(),
  }) {
    if (loadingAdd != null) {
      return loadingAdd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return loadingAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return loadingAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (loadingAdd != null) {
      return loadingAdd(this);
    }
    return orElse();
  }
}

abstract class _loadingAdd implements AssistantState {
  const factory _loadingAdd() = _$_loadingAdd;
}

/// @nodoc
abstract class _$$_succesCopyWith<$Res> {
  factory _$$_succesCopyWith(_$_succes value, $Res Function(_$_succes) then) =
      __$$_succesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_succesCopyWithImpl<$Res>
    extends _$AssistantStateCopyWithImpl<$Res, _$_succes>
    implements _$$_succesCopyWith<$Res> {
  __$$_succesCopyWithImpl(_$_succes _value, $Res Function(_$_succes) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_succes implements _succes {
  const _$_succes();

  @override
  String toString() {
    return 'AssistantState.succes()';
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
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) {
    return succes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return succes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
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
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return succes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return succes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(this);
    }
    return orElse();
  }
}

abstract class _succes implements AssistantState {
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
    extends _$AssistantStateCopyWithImpl<$Res, _$_error>
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
    return 'AssistantState.error(error: $error)';
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
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
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
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _error implements AssistantState {
  const factory _error({final String? error}) = _$_error;

  String? get error;
  @JsonKey(ignore: true)
  _$$_errorCopyWith<_$_error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImagePickedCopyWith<$Res> {
  factory _$$_ImagePickedCopyWith(
          _$_ImagePicked value, $Res Function(_$_ImagePicked) then) =
      __$$_ImagePickedCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile image});
}

/// @nodoc
class __$$_ImagePickedCopyWithImpl<$Res>
    extends _$AssistantStateCopyWithImpl<$Res, _$_ImagePicked>
    implements _$$_ImagePickedCopyWith<$Res> {
  __$$_ImagePickedCopyWithImpl(
      _$_ImagePicked _value, $Res Function(_$_ImagePicked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_ImagePicked(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$_ImagePicked implements _ImagePicked {
  const _$_ImagePicked({required this.image});

  @override
  final XFile image;

  @override
  String toString() {
    return 'AssistantState.imagePicked(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagePicked &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagePickedCopyWith<_$_ImagePicked> get copyWith =>
      __$$_ImagePickedCopyWithImpl<_$_ImagePicked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProfileEntity> data) dataLoaded,
    required TResult Function(int indx) loadingDelete,
    required TResult Function() successDelete,
    required TResult Function() loading,
    required TResult Function() loadingAdd,
    required TResult Function() succes,
    required TResult Function(String? error) error,
    required TResult Function(XFile image) imagePicked,
  }) {
    return imagePicked(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProfileEntity> data)? dataLoaded,
    TResult? Function(int indx)? loadingDelete,
    TResult? Function()? successDelete,
    TResult? Function()? loading,
    TResult? Function()? loadingAdd,
    TResult? Function()? succes,
    TResult? Function(String? error)? error,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return imagePicked?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProfileEntity> data)? dataLoaded,
    TResult Function(int indx)? loadingDelete,
    TResult Function()? successDelete,
    TResult Function()? loading,
    TResult Function()? loadingAdd,
    TResult Function()? succes,
    TResult Function(String? error)? error,
    TResult Function(XFile image)? imagePicked,
    required TResult orElse(),
  }) {
    if (imagePicked != null) {
      return imagePicked(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_loadingDelete value) loadingDelete,
    required TResult Function(_successDelete value) successDelete,
    required TResult Function(_loading value) loading,
    required TResult Function(_loadingAdd value) loadingAdd,
    required TResult Function(_succes value) succes,
    required TResult Function(_error value) error,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return imagePicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_loadingDelete value)? loadingDelete,
    TResult? Function(_successDelete value)? successDelete,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loadingAdd value)? loadingAdd,
    TResult? Function(_succes value)? succes,
    TResult? Function(_error value)? error,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return imagePicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_loadingDelete value)? loadingDelete,
    TResult Function(_successDelete value)? successDelete,
    TResult Function(_loading value)? loading,
    TResult Function(_loadingAdd value)? loadingAdd,
    TResult Function(_succes value)? succes,
    TResult Function(_error value)? error,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (imagePicked != null) {
      return imagePicked(this);
    }
    return orElse();
  }
}

abstract class _ImagePicked implements AssistantState {
  const factory _ImagePicked({required final XFile image}) = _$_ImagePicked;

  XFile get image;
  @JsonKey(ignore: true)
  _$$_ImagePickedCopyWith<_$_ImagePicked> get copyWith =>
      throw _privateConstructorUsedError;
}
