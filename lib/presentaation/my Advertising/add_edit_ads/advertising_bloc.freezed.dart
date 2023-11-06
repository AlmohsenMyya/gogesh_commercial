// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advertising_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddEditAdsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AdsRequest request) addAds,
    required TResult Function(AdsRequest request) editAds,
    required TResult Function(int id, String path) loadAdsDetails,
    required TResult Function(int id) deleteAds,
    required TResult Function(ImageSource source) uploadImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AdsRequest request)? addAds,
    TResult? Function(AdsRequest request)? editAds,
    TResult? Function(int id, String path)? loadAdsDetails,
    TResult? Function(int id)? deleteAds,
    TResult? Function(ImageSource source)? uploadImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AdsRequest request)? addAds,
    TResult Function(AdsRequest request)? editAds,
    TResult Function(int id, String path)? loadAdsDetails,
    TResult Function(int id)? deleteAds,
    TResult Function(ImageSource source)? uploadImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addAds value) addAds,
    required TResult Function(_editAds value) editAds,
    required TResult Function(_loadAdsDetails value) loadAdsDetails,
    required TResult Function(_deleteAds value) deleteAds,
    required TResult Function(_UploadImage value) uploadImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addAds value)? addAds,
    TResult? Function(_editAds value)? editAds,
    TResult? Function(_loadAdsDetails value)? loadAdsDetails,
    TResult? Function(_deleteAds value)? deleteAds,
    TResult? Function(_UploadImage value)? uploadImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addAds value)? addAds,
    TResult Function(_editAds value)? editAds,
    TResult Function(_loadAdsDetails value)? loadAdsDetails,
    TResult Function(_deleteAds value)? deleteAds,
    TResult Function(_UploadImage value)? uploadImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditAdsEventCopyWith<$Res> {
  factory $AddEditAdsEventCopyWith(
          AddEditAdsEvent value, $Res Function(AddEditAdsEvent) then) =
      _$AddEditAdsEventCopyWithImpl<$Res, AddEditAdsEvent>;
}

/// @nodoc
class _$AddEditAdsEventCopyWithImpl<$Res, $Val extends AddEditAdsEvent>
    implements $AddEditAdsEventCopyWith<$Res> {
  _$AddEditAdsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_addAdsCopyWith<$Res> {
  factory _$$_addAdsCopyWith(_$_addAds value, $Res Function(_$_addAds) then) =
      __$$_addAdsCopyWithImpl<$Res>;
  @useResult
  $Res call({AdsRequest request});
}

/// @nodoc
class __$$_addAdsCopyWithImpl<$Res>
    extends _$AddEditAdsEventCopyWithImpl<$Res, _$_addAds>
    implements _$$_addAdsCopyWith<$Res> {
  __$$_addAdsCopyWithImpl(_$_addAds _value, $Res Function(_$_addAds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$_addAds(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as AdsRequest,
    ));
  }
}

/// @nodoc

class _$_addAds implements _addAds {
  const _$_addAds({required this.request});

  @override
  final AdsRequest request;

  @override
  String toString() {
    return 'AddEditAdsEvent.addAds(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addAds &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_addAdsCopyWith<_$_addAds> get copyWith =>
      __$$_addAdsCopyWithImpl<_$_addAds>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AdsRequest request) addAds,
    required TResult Function(AdsRequest request) editAds,
    required TResult Function(int id, String path) loadAdsDetails,
    required TResult Function(int id) deleteAds,
    required TResult Function(ImageSource source) uploadImage,
  }) {
    return addAds(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AdsRequest request)? addAds,
    TResult? Function(AdsRequest request)? editAds,
    TResult? Function(int id, String path)? loadAdsDetails,
    TResult? Function(int id)? deleteAds,
    TResult? Function(ImageSource source)? uploadImage,
  }) {
    return addAds?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AdsRequest request)? addAds,
    TResult Function(AdsRequest request)? editAds,
    TResult Function(int id, String path)? loadAdsDetails,
    TResult Function(int id)? deleteAds,
    TResult Function(ImageSource source)? uploadImage,
    required TResult orElse(),
  }) {
    if (addAds != null) {
      return addAds(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addAds value) addAds,
    required TResult Function(_editAds value) editAds,
    required TResult Function(_loadAdsDetails value) loadAdsDetails,
    required TResult Function(_deleteAds value) deleteAds,
    required TResult Function(_UploadImage value) uploadImage,
  }) {
    return addAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addAds value)? addAds,
    TResult? Function(_editAds value)? editAds,
    TResult? Function(_loadAdsDetails value)? loadAdsDetails,
    TResult? Function(_deleteAds value)? deleteAds,
    TResult? Function(_UploadImage value)? uploadImage,
  }) {
    return addAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addAds value)? addAds,
    TResult Function(_editAds value)? editAds,
    TResult Function(_loadAdsDetails value)? loadAdsDetails,
    TResult Function(_deleteAds value)? deleteAds,
    TResult Function(_UploadImage value)? uploadImage,
    required TResult orElse(),
  }) {
    if (addAds != null) {
      return addAds(this);
    }
    return orElse();
  }
}

abstract class _addAds implements AddEditAdsEvent {
  const factory _addAds({required final AdsRequest request}) = _$_addAds;

  AdsRequest get request;
  @JsonKey(ignore: true)
  _$$_addAdsCopyWith<_$_addAds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_editAdsCopyWith<$Res> {
  factory _$$_editAdsCopyWith(
          _$_editAds value, $Res Function(_$_editAds) then) =
      __$$_editAdsCopyWithImpl<$Res>;
  @useResult
  $Res call({AdsRequest request});
}

/// @nodoc
class __$$_editAdsCopyWithImpl<$Res>
    extends _$AddEditAdsEventCopyWithImpl<$Res, _$_editAds>
    implements _$$_editAdsCopyWith<$Res> {
  __$$_editAdsCopyWithImpl(_$_editAds _value, $Res Function(_$_editAds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$_editAds(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as AdsRequest,
    ));
  }
}

/// @nodoc

class _$_editAds implements _editAds {
  const _$_editAds({required this.request});

  @override
  final AdsRequest request;

  @override
  String toString() {
    return 'AddEditAdsEvent.editAds(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_editAds &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_editAdsCopyWith<_$_editAds> get copyWith =>
      __$$_editAdsCopyWithImpl<_$_editAds>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AdsRequest request) addAds,
    required TResult Function(AdsRequest request) editAds,
    required TResult Function(int id, String path) loadAdsDetails,
    required TResult Function(int id) deleteAds,
    required TResult Function(ImageSource source) uploadImage,
  }) {
    return editAds(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AdsRequest request)? addAds,
    TResult? Function(AdsRequest request)? editAds,
    TResult? Function(int id, String path)? loadAdsDetails,
    TResult? Function(int id)? deleteAds,
    TResult? Function(ImageSource source)? uploadImage,
  }) {
    return editAds?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AdsRequest request)? addAds,
    TResult Function(AdsRequest request)? editAds,
    TResult Function(int id, String path)? loadAdsDetails,
    TResult Function(int id)? deleteAds,
    TResult Function(ImageSource source)? uploadImage,
    required TResult orElse(),
  }) {
    if (editAds != null) {
      return editAds(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addAds value) addAds,
    required TResult Function(_editAds value) editAds,
    required TResult Function(_loadAdsDetails value) loadAdsDetails,
    required TResult Function(_deleteAds value) deleteAds,
    required TResult Function(_UploadImage value) uploadImage,
  }) {
    return editAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addAds value)? addAds,
    TResult? Function(_editAds value)? editAds,
    TResult? Function(_loadAdsDetails value)? loadAdsDetails,
    TResult? Function(_deleteAds value)? deleteAds,
    TResult? Function(_UploadImage value)? uploadImage,
  }) {
    return editAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addAds value)? addAds,
    TResult Function(_editAds value)? editAds,
    TResult Function(_loadAdsDetails value)? loadAdsDetails,
    TResult Function(_deleteAds value)? deleteAds,
    TResult Function(_UploadImage value)? uploadImage,
    required TResult orElse(),
  }) {
    if (editAds != null) {
      return editAds(this);
    }
    return orElse();
  }
}

abstract class _editAds implements AddEditAdsEvent {
  const factory _editAds({required final AdsRequest request}) = _$_editAds;

  AdsRequest get request;
  @JsonKey(ignore: true)
  _$$_editAdsCopyWith<_$_editAds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_loadAdsDetailsCopyWith<$Res> {
  factory _$$_loadAdsDetailsCopyWith(
          _$_loadAdsDetails value, $Res Function(_$_loadAdsDetails) then) =
      __$$_loadAdsDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String path});
}

/// @nodoc
class __$$_loadAdsDetailsCopyWithImpl<$Res>
    extends _$AddEditAdsEventCopyWithImpl<$Res, _$_loadAdsDetails>
    implements _$$_loadAdsDetailsCopyWith<$Res> {
  __$$_loadAdsDetailsCopyWithImpl(
      _$_loadAdsDetails _value, $Res Function(_$_loadAdsDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
  }) {
    return _then(_$_loadAdsDetails(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_loadAdsDetails implements _loadAdsDetails {
  const _$_loadAdsDetails({required this.id, required this.path});

  @override
  final int id;
  @override
  final String path;

  @override
  String toString() {
    return 'AddEditAdsEvent.loadAdsDetails(id: $id, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadAdsDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadAdsDetailsCopyWith<_$_loadAdsDetails> get copyWith =>
      __$$_loadAdsDetailsCopyWithImpl<_$_loadAdsDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AdsRequest request) addAds,
    required TResult Function(AdsRequest request) editAds,
    required TResult Function(int id, String path) loadAdsDetails,
    required TResult Function(int id) deleteAds,
    required TResult Function(ImageSource source) uploadImage,
  }) {
    return loadAdsDetails(id, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AdsRequest request)? addAds,
    TResult? Function(AdsRequest request)? editAds,
    TResult? Function(int id, String path)? loadAdsDetails,
    TResult? Function(int id)? deleteAds,
    TResult? Function(ImageSource source)? uploadImage,
  }) {
    return loadAdsDetails?.call(id, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AdsRequest request)? addAds,
    TResult Function(AdsRequest request)? editAds,
    TResult Function(int id, String path)? loadAdsDetails,
    TResult Function(int id)? deleteAds,
    TResult Function(ImageSource source)? uploadImage,
    required TResult orElse(),
  }) {
    if (loadAdsDetails != null) {
      return loadAdsDetails(id, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addAds value) addAds,
    required TResult Function(_editAds value) editAds,
    required TResult Function(_loadAdsDetails value) loadAdsDetails,
    required TResult Function(_deleteAds value) deleteAds,
    required TResult Function(_UploadImage value) uploadImage,
  }) {
    return loadAdsDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addAds value)? addAds,
    TResult? Function(_editAds value)? editAds,
    TResult? Function(_loadAdsDetails value)? loadAdsDetails,
    TResult? Function(_deleteAds value)? deleteAds,
    TResult? Function(_UploadImage value)? uploadImage,
  }) {
    return loadAdsDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addAds value)? addAds,
    TResult Function(_editAds value)? editAds,
    TResult Function(_loadAdsDetails value)? loadAdsDetails,
    TResult Function(_deleteAds value)? deleteAds,
    TResult Function(_UploadImage value)? uploadImage,
    required TResult orElse(),
  }) {
    if (loadAdsDetails != null) {
      return loadAdsDetails(this);
    }
    return orElse();
  }
}

abstract class _loadAdsDetails implements AddEditAdsEvent {
  const factory _loadAdsDetails(
      {required final int id, required final String path}) = _$_loadAdsDetails;

  int get id;
  String get path;
  @JsonKey(ignore: true)
  _$$_loadAdsDetailsCopyWith<_$_loadAdsDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_deleteAdsCopyWith<$Res> {
  factory _$$_deleteAdsCopyWith(
          _$_deleteAds value, $Res Function(_$_deleteAds) then) =
      __$$_deleteAdsCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_deleteAdsCopyWithImpl<$Res>
    extends _$AddEditAdsEventCopyWithImpl<$Res, _$_deleteAds>
    implements _$$_deleteAdsCopyWith<$Res> {
  __$$_deleteAdsCopyWithImpl(
      _$_deleteAds _value, $Res Function(_$_deleteAds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_deleteAds(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_deleteAds implements _deleteAds {
  const _$_deleteAds({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'AddEditAdsEvent.deleteAds(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_deleteAds &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_deleteAdsCopyWith<_$_deleteAds> get copyWith =>
      __$$_deleteAdsCopyWithImpl<_$_deleteAds>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AdsRequest request) addAds,
    required TResult Function(AdsRequest request) editAds,
    required TResult Function(int id, String path) loadAdsDetails,
    required TResult Function(int id) deleteAds,
    required TResult Function(ImageSource source) uploadImage,
  }) {
    return deleteAds(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AdsRequest request)? addAds,
    TResult? Function(AdsRequest request)? editAds,
    TResult? Function(int id, String path)? loadAdsDetails,
    TResult? Function(int id)? deleteAds,
    TResult? Function(ImageSource source)? uploadImage,
  }) {
    return deleteAds?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AdsRequest request)? addAds,
    TResult Function(AdsRequest request)? editAds,
    TResult Function(int id, String path)? loadAdsDetails,
    TResult Function(int id)? deleteAds,
    TResult Function(ImageSource source)? uploadImage,
    required TResult orElse(),
  }) {
    if (deleteAds != null) {
      return deleteAds(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addAds value) addAds,
    required TResult Function(_editAds value) editAds,
    required TResult Function(_loadAdsDetails value) loadAdsDetails,
    required TResult Function(_deleteAds value) deleteAds,
    required TResult Function(_UploadImage value) uploadImage,
  }) {
    return deleteAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addAds value)? addAds,
    TResult? Function(_editAds value)? editAds,
    TResult? Function(_loadAdsDetails value)? loadAdsDetails,
    TResult? Function(_deleteAds value)? deleteAds,
    TResult? Function(_UploadImage value)? uploadImage,
  }) {
    return deleteAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addAds value)? addAds,
    TResult Function(_editAds value)? editAds,
    TResult Function(_loadAdsDetails value)? loadAdsDetails,
    TResult Function(_deleteAds value)? deleteAds,
    TResult Function(_UploadImage value)? uploadImage,
    required TResult orElse(),
  }) {
    if (deleteAds != null) {
      return deleteAds(this);
    }
    return orElse();
  }
}

abstract class _deleteAds implements AddEditAdsEvent {
  const factory _deleteAds({required final int id}) = _$_deleteAds;

  int get id;
  @JsonKey(ignore: true)
  _$$_deleteAdsCopyWith<_$_deleteAds> get copyWith =>
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
    extends _$AddEditAdsEventCopyWithImpl<$Res, _$_UploadImage>
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
    return 'AddEditAdsEvent.uploadImage(source: $source)';
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
    required TResult Function(AdsRequest request) addAds,
    required TResult Function(AdsRequest request) editAds,
    required TResult Function(int id, String path) loadAdsDetails,
    required TResult Function(int id) deleteAds,
    required TResult Function(ImageSource source) uploadImage,
  }) {
    return uploadImage(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AdsRequest request)? addAds,
    TResult? Function(AdsRequest request)? editAds,
    TResult? Function(int id, String path)? loadAdsDetails,
    TResult? Function(int id)? deleteAds,
    TResult? Function(ImageSource source)? uploadImage,
  }) {
    return uploadImage?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AdsRequest request)? addAds,
    TResult Function(AdsRequest request)? editAds,
    TResult Function(int id, String path)? loadAdsDetails,
    TResult Function(int id)? deleteAds,
    TResult Function(ImageSource source)? uploadImage,
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
    required TResult Function(_addAds value) addAds,
    required TResult Function(_editAds value) editAds,
    required TResult Function(_loadAdsDetails value) loadAdsDetails,
    required TResult Function(_deleteAds value) deleteAds,
    required TResult Function(_UploadImage value) uploadImage,
  }) {
    return uploadImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addAds value)? addAds,
    TResult? Function(_editAds value)? editAds,
    TResult? Function(_loadAdsDetails value)? loadAdsDetails,
    TResult? Function(_deleteAds value)? deleteAds,
    TResult? Function(_UploadImage value)? uploadImage,
  }) {
    return uploadImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addAds value)? addAds,
    TResult Function(_editAds value)? editAds,
    TResult Function(_loadAdsDetails value)? loadAdsDetails,
    TResult Function(_deleteAds value)? deleteAds,
    TResult Function(_UploadImage value)? uploadImage,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(this);
    }
    return orElse();
  }
}

abstract class _UploadImage implements AddEditAdsEvent {
  const factory _UploadImage({required final ImageSource source}) =
      _$_UploadImage;

  ImageSource get source;
  @JsonKey(ignore: true)
  _$$_UploadImageCopyWith<_$_UploadImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddEditAdsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) succes,
    required TResult Function(AdsEntity ads) dataLoaded,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(XFile image) imagePicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? succes,
    TResult? Function(AdsEntity ads)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(XFile image)? imagePicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? succes,
    TResult Function(AdsEntity ads)? dataLoaded,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(XFile image)? imagePicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_succes value) succes,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_ImagePicked value) imagePicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_succes value)? succes,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_succes value)? succes,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditAdsStateCopyWith<$Res> {
  factory $AddEditAdsStateCopyWith(
          AddEditAdsState value, $Res Function(AddEditAdsState) then) =
      _$AddEditAdsStateCopyWithImpl<$Res, AddEditAdsState>;
}

/// @nodoc
class _$AddEditAdsStateCopyWithImpl<$Res, $Val extends AddEditAdsState>
    implements $AddEditAdsStateCopyWith<$Res> {
  _$AddEditAdsStateCopyWithImpl(this._value, this._then);

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
    extends _$AddEditAdsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AddEditAdsState.initial()';
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
    required TResult Function(String? msg) succes,
    required TResult Function(AdsEntity ads) dataLoaded,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(XFile image) imagePicked,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? succes,
    TResult? Function(AdsEntity ads)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? succes,
    TResult Function(AdsEntity ads)? dataLoaded,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
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
    required TResult Function(_succes value) succes,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_succes value)? succes,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_succes value)? succes,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddEditAdsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_succesCopyWith<$Res> {
  factory _$$_succesCopyWith(_$_succes value, $Res Function(_$_succes) then) =
      __$$_succesCopyWithImpl<$Res>;
  @useResult
  $Res call({String? msg});
}

/// @nodoc
class __$$_succesCopyWithImpl<$Res>
    extends _$AddEditAdsStateCopyWithImpl<$Res, _$_succes>
    implements _$$_succesCopyWith<$Res> {
  __$$_succesCopyWithImpl(_$_succes _value, $Res Function(_$_succes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$_succes(
      freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_succes implements _succes {
  const _$_succes(this.msg);

  @override
  final String? msg;

  @override
  String toString() {
    return 'AddEditAdsState.succes(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_succes &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_succesCopyWith<_$_succes> get copyWith =>
      __$$_succesCopyWithImpl<_$_succes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) succes,
    required TResult Function(AdsEntity ads) dataLoaded,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(XFile image) imagePicked,
  }) {
    return succes(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? succes,
    TResult? Function(AdsEntity ads)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return succes?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? succes,
    TResult Function(AdsEntity ads)? dataLoaded,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(XFile image)? imagePicked,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_succes value) succes,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return succes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_succes value)? succes,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return succes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_succes value)? succes,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(this);
    }
    return orElse();
  }
}

abstract class _succes implements AddEditAdsState {
  const factory _succes(final String? msg) = _$_succes;

  String? get msg;
  @JsonKey(ignore: true)
  _$$_succesCopyWith<_$_succes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_dataLoadedCopyWith<$Res> {
  factory _$$_dataLoadedCopyWith(
          _$_dataLoaded value, $Res Function(_$_dataLoaded) then) =
      __$$_dataLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({AdsEntity ads});
}

/// @nodoc
class __$$_dataLoadedCopyWithImpl<$Res>
    extends _$AddEditAdsStateCopyWithImpl<$Res, _$_dataLoaded>
    implements _$$_dataLoadedCopyWith<$Res> {
  __$$_dataLoadedCopyWithImpl(
      _$_dataLoaded _value, $Res Function(_$_dataLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ads = null,
  }) {
    return _then(_$_dataLoaded(
      ads: null == ads
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as AdsEntity,
    ));
  }
}

/// @nodoc

class _$_dataLoaded implements _dataLoaded {
  const _$_dataLoaded({required this.ads});

  @override
  final AdsEntity ads;

  @override
  String toString() {
    return 'AddEditAdsState.dataLoaded(ads: $ads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_dataLoaded &&
            (identical(other.ads, ads) || other.ads == ads));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ads);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_dataLoadedCopyWith<_$_dataLoaded> get copyWith =>
      __$$_dataLoadedCopyWithImpl<_$_dataLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) succes,
    required TResult Function(AdsEntity ads) dataLoaded,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(XFile image) imagePicked,
  }) {
    return dataLoaded(ads);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? succes,
    TResult? Function(AdsEntity ads)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return dataLoaded?.call(ads);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? succes,
    TResult Function(AdsEntity ads)? dataLoaded,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(XFile image)? imagePicked,
    required TResult orElse(),
  }) {
    if (dataLoaded != null) {
      return dataLoaded(ads);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_succes value) succes,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return dataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_succes value)? succes,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return dataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_succes value)? succes,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (dataLoaded != null) {
      return dataLoaded(this);
    }
    return orElse();
  }
}

abstract class _dataLoaded implements AddEditAdsState {
  const factory _dataLoaded({required final AdsEntity ads}) = _$_dataLoaded;

  AdsEntity get ads;
  @JsonKey(ignore: true)
  _$$_dataLoadedCopyWith<_$_dataLoaded> get copyWith =>
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
    extends _$AddEditAdsStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AddEditAdsState.loading()';
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
    required TResult Function() initial,
    required TResult Function(String? msg) succes,
    required TResult Function(AdsEntity ads) dataLoaded,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(XFile image) imagePicked,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? succes,
    TResult? Function(AdsEntity ads)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? succes,
    TResult Function(AdsEntity ads)? dataLoaded,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
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
    required TResult Function(_succes value) succes,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_succes value)? succes,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_succes value)? succes,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AddEditAdsState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$AddEditAdsStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Error(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final String? error;

  @override
  String toString() {
    return 'AddEditAdsState.error(error: $error)';
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
    required TResult Function() initial,
    required TResult Function(String? msg) succes,
    required TResult Function(AdsEntity ads) dataLoaded,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(XFile image) imagePicked,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? succes,
    TResult? Function(AdsEntity ads)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? succes,
    TResult Function(AdsEntity ads)? dataLoaded,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
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
    required TResult Function(_succes value) succes,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_succes value)? succes,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_succes value)? succes,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AddEditAdsState {
  const factory _Error(final String? error) = _$_Error;

  String? get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
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
    extends _$AddEditAdsStateCopyWithImpl<$Res, _$_loadingEdit>
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
    return 'AddEditAdsState.loadingEdit()';
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
    required TResult Function(String? msg) succes,
    required TResult Function(AdsEntity ads) dataLoaded,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(XFile image) imagePicked,
  }) {
    return loadingEdit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? succes,
    TResult? Function(AdsEntity ads)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return loadingEdit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? succes,
    TResult Function(AdsEntity ads)? dataLoaded,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
    TResult Function(XFile image)? imagePicked,
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
    required TResult Function(_succes value) succes,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return loadingEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_succes value)? succes,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return loadingEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_succes value)? succes,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (loadingEdit != null) {
      return loadingEdit(this);
    }
    return orElse();
  }
}

abstract class _loadingEdit implements AddEditAdsState {
  const factory _loadingEdit() = _$_loadingEdit;
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
    extends _$AddEditAdsStateCopyWithImpl<$Res, _$_ImagePicked>
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
    return 'AddEditAdsState.imagePicked(image: $image)';
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
    required TResult Function(String? msg) succes,
    required TResult Function(AdsEntity ads) dataLoaded,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function() loadingEdit,
    required TResult Function(XFile image) imagePicked,
  }) {
    return imagePicked(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? succes,
    TResult? Function(AdsEntity ads)? dataLoaded,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function()? loadingEdit,
    TResult? Function(XFile image)? imagePicked,
  }) {
    return imagePicked?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? succes,
    TResult Function(AdsEntity ads)? dataLoaded,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function()? loadingEdit,
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
    required TResult Function(_succes value) succes,
    required TResult Function(_dataLoaded value) dataLoaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_loadingEdit value) loadingEdit,
    required TResult Function(_ImagePicked value) imagePicked,
  }) {
    return imagePicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_succes value)? succes,
    TResult? Function(_dataLoaded value)? dataLoaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_loadingEdit value)? loadingEdit,
    TResult? Function(_ImagePicked value)? imagePicked,
  }) {
    return imagePicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_succes value)? succes,
    TResult Function(_dataLoaded value)? dataLoaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_loadingEdit value)? loadingEdit,
    TResult Function(_ImagePicked value)? imagePicked,
    required TResult orElse(),
  }) {
    if (imagePicked != null) {
      return imagePicked(this);
    }
    return orElse();
  }
}

abstract class _ImagePicked implements AddEditAdsState {
  const factory _ImagePicked({required final XFile image}) = _$_ImagePicked;

  XFile get image;
  @JsonKey(ignore: true)
  _$$_ImagePickedCopyWith<_$_ImagePicked> get copyWith =>
      throw _privateConstructorUsedError;
}
