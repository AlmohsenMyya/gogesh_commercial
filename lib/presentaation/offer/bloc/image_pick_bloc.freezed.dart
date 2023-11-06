// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_pick_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImagePickEvent {
  String get url => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) uploadImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? uploadImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? uploadImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_uploadImage value) uploadImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_uploadImage value)? uploadImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_uploadImage value)? uploadImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImagePickEventCopyWith<ImagePickEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePickEventCopyWith<$Res> {
  factory $ImagePickEventCopyWith(
          ImagePickEvent value, $Res Function(ImagePickEvent) then) =
      _$ImagePickEventCopyWithImpl<$Res, ImagePickEvent>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$ImagePickEventCopyWithImpl<$Res, $Val extends ImagePickEvent>
    implements $ImagePickEventCopyWith<$Res> {
  _$ImagePickEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_uploadImageCopyWith<$Res>
    implements $ImagePickEventCopyWith<$Res> {
  factory _$$_uploadImageCopyWith(
          _$_uploadImage value, $Res Function(_$_uploadImage) then) =
      __$$_uploadImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$_uploadImageCopyWithImpl<$Res>
    extends _$ImagePickEventCopyWithImpl<$Res, _$_uploadImage>
    implements _$$_uploadImageCopyWith<$Res> {
  __$$_uploadImageCopyWithImpl(
      _$_uploadImage _value, $Res Function(_$_uploadImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_uploadImage(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_uploadImage implements _uploadImage {
  const _$_uploadImage({required this.url});

  @override
  final String url;

  @override
  String toString() {
    return 'ImagePickEvent.uploadImage(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_uploadImage &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_uploadImageCopyWith<_$_uploadImage> get copyWith =>
      __$$_uploadImageCopyWithImpl<_$_uploadImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) uploadImage,
  }) {
    return uploadImage(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? uploadImage,
  }) {
    return uploadImage?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? uploadImage,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_uploadImage value) uploadImage,
  }) {
    return uploadImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_uploadImage value)? uploadImage,
  }) {
    return uploadImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_uploadImage value)? uploadImage,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(this);
    }
    return orElse();
  }
}

abstract class _uploadImage implements ImagePickEvent {
  const factory _uploadImage({required final String url}) = _$_uploadImage;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_uploadImageCopyWith<_$_uploadImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ImagePickState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(XFile image, String url) loadedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(XFile image, String url)? loadedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(XFile image, String url)? loadedImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadedImage value) loadedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadedImage value)? loadedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadedImage value)? loadedImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePickStateCopyWith<$Res> {
  factory $ImagePickStateCopyWith(
          ImagePickState value, $Res Function(ImagePickState) then) =
      _$ImagePickStateCopyWithImpl<$Res, ImagePickState>;
}

/// @nodoc
class _$ImagePickStateCopyWithImpl<$Res, $Val extends ImagePickState>
    implements $ImagePickStateCopyWith<$Res> {
  _$ImagePickStateCopyWithImpl(this._value, this._then);

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
    extends _$ImagePickStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ImagePickState.initial()';
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
    required TResult Function(XFile image, String url) loadedImage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(XFile image, String url)? loadedImage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(XFile image, String url)? loadedImage,
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
    required TResult Function(_loadedImage value) loadedImage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadedImage value)? loadedImage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadedImage value)? loadedImage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ImagePickState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_loadedImageCopyWith<$Res> {
  factory _$$_loadedImageCopyWith(
          _$_loadedImage value, $Res Function(_$_loadedImage) then) =
      __$$_loadedImageCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile image, String url});
}

/// @nodoc
class __$$_loadedImageCopyWithImpl<$Res>
    extends _$ImagePickStateCopyWithImpl<$Res, _$_loadedImage>
    implements _$$_loadedImageCopyWith<$Res> {
  __$$_loadedImageCopyWithImpl(
      _$_loadedImage _value, $Res Function(_$_loadedImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? url = null,
  }) {
    return _then(_$_loadedImage(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_loadedImage implements _loadedImage {
  const _$_loadedImage({required this.image, required this.url});

  @override
  final XFile image;
  @override
  final String url;

  @override
  String toString() {
    return 'ImagePickState.loadedImage(image: $image, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadedImage &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadedImageCopyWith<_$_loadedImage> get copyWith =>
      __$$_loadedImageCopyWithImpl<_$_loadedImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(XFile image, String url) loadedImage,
  }) {
    return loadedImage(image, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(XFile image, String url)? loadedImage,
  }) {
    return loadedImage?.call(image, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(XFile image, String url)? loadedImage,
    required TResult orElse(),
  }) {
    if (loadedImage != null) {
      return loadedImage(image, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadedImage value) loadedImage,
  }) {
    return loadedImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadedImage value)? loadedImage,
  }) {
    return loadedImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadedImage value)? loadedImage,
    required TResult orElse(),
  }) {
    if (loadedImage != null) {
      return loadedImage(this);
    }
    return orElse();
  }
}

abstract class _loadedImage implements ImagePickState {
  const factory _loadedImage(
      {required final XFile image, required final String url}) = _$_loadedImage;

  XFile get image;
  String get url;
  @JsonKey(ignore: true)
  _$$_loadedImageCopyWith<_$_loadedImage> get copyWith =>
      throw _privateConstructorUsedError;
}
