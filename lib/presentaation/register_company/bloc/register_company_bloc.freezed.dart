// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_company_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterCompanyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TypeCompanty item) changeItem,
    required TResult Function(RegisterPartTwoSeller request) registerCompany,
    required TResult Function(ImageSource source) uploadImageLogo,
    required TResult Function(ImageSource source) uploadImagecardIntity,
    required TResult Function(ImageSource source) uploadImageSignature,
    required TResult Function(ImageSource source) uploadImageLisence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TypeCompanty item)? changeItem,
    TResult? Function(RegisterPartTwoSeller request)? registerCompany,
    TResult? Function(ImageSource source)? uploadImageLogo,
    TResult? Function(ImageSource source)? uploadImagecardIntity,
    TResult? Function(ImageSource source)? uploadImageSignature,
    TResult? Function(ImageSource source)? uploadImageLisence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TypeCompanty item)? changeItem,
    TResult Function(RegisterPartTwoSeller request)? registerCompany,
    TResult Function(ImageSource source)? uploadImageLogo,
    TResult Function(ImageSource source)? uploadImagecardIntity,
    TResult Function(ImageSource source)? uploadImageSignature,
    TResult Function(ImageSource source)? uploadImageLisence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeItem value) changeItem,
    required TResult Function(_RegisterCompany value) registerCompany,
    required TResult Function(_UploadImageLogo value) uploadImageLogo,
    required TResult Function(_UploadImagecardIntity value)
        uploadImagecardIntity,
    required TResult Function(_UploadImageSignature value) uploadImageSignature,
    required TResult Function(_UploadImageLisence value) uploadImageLisence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeItem value)? changeItem,
    TResult? Function(_RegisterCompany value)? registerCompany,
    TResult? Function(_UploadImageLogo value)? uploadImageLogo,
    TResult? Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult? Function(_UploadImageSignature value)? uploadImageSignature,
    TResult? Function(_UploadImageLisence value)? uploadImageLisence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeItem value)? changeItem,
    TResult Function(_RegisterCompany value)? registerCompany,
    TResult Function(_UploadImageLogo value)? uploadImageLogo,
    TResult Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult Function(_UploadImageSignature value)? uploadImageSignature,
    TResult Function(_UploadImageLisence value)? uploadImageLisence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterCompanyEventCopyWith<$Res> {
  factory $RegisterCompanyEventCopyWith(RegisterCompanyEvent value,
          $Res Function(RegisterCompanyEvent) then) =
      _$RegisterCompanyEventCopyWithImpl<$Res, RegisterCompanyEvent>;
}

/// @nodoc
class _$RegisterCompanyEventCopyWithImpl<$Res,
        $Val extends RegisterCompanyEvent>
    implements $RegisterCompanyEventCopyWith<$Res> {
  _$RegisterCompanyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ChangeItemCopyWith<$Res> {
  factory _$$_ChangeItemCopyWith(
          _$_ChangeItem value, $Res Function(_$_ChangeItem) then) =
      __$$_ChangeItemCopyWithImpl<$Res>;
  @useResult
  $Res call({TypeCompanty item});
}

/// @nodoc
class __$$_ChangeItemCopyWithImpl<$Res>
    extends _$RegisterCompanyEventCopyWithImpl<$Res, _$_ChangeItem>
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
              as TypeCompanty,
    ));
  }
}

/// @nodoc

class _$_ChangeItem implements _ChangeItem {
  const _$_ChangeItem({required this.item});

  @override
  final TypeCompanty item;

  @override
  String toString() {
    return 'RegisterCompanyEvent.changeItem(item: $item)';
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
    required TResult Function(TypeCompanty item) changeItem,
    required TResult Function(RegisterPartTwoSeller request) registerCompany,
    required TResult Function(ImageSource source) uploadImageLogo,
    required TResult Function(ImageSource source) uploadImagecardIntity,
    required TResult Function(ImageSource source) uploadImageSignature,
    required TResult Function(ImageSource source) uploadImageLisence,
  }) {
    return changeItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TypeCompanty item)? changeItem,
    TResult? Function(RegisterPartTwoSeller request)? registerCompany,
    TResult? Function(ImageSource source)? uploadImageLogo,
    TResult? Function(ImageSource source)? uploadImagecardIntity,
    TResult? Function(ImageSource source)? uploadImageSignature,
    TResult? Function(ImageSource source)? uploadImageLisence,
  }) {
    return changeItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TypeCompanty item)? changeItem,
    TResult Function(RegisterPartTwoSeller request)? registerCompany,
    TResult Function(ImageSource source)? uploadImageLogo,
    TResult Function(ImageSource source)? uploadImagecardIntity,
    TResult Function(ImageSource source)? uploadImageSignature,
    TResult Function(ImageSource source)? uploadImageLisence,
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
    required TResult Function(_ChangeItem value) changeItem,
    required TResult Function(_RegisterCompany value) registerCompany,
    required TResult Function(_UploadImageLogo value) uploadImageLogo,
    required TResult Function(_UploadImagecardIntity value)
        uploadImagecardIntity,
    required TResult Function(_UploadImageSignature value) uploadImageSignature,
    required TResult Function(_UploadImageLisence value) uploadImageLisence,
  }) {
    return changeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeItem value)? changeItem,
    TResult? Function(_RegisterCompany value)? registerCompany,
    TResult? Function(_UploadImageLogo value)? uploadImageLogo,
    TResult? Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult? Function(_UploadImageSignature value)? uploadImageSignature,
    TResult? Function(_UploadImageLisence value)? uploadImageLisence,
  }) {
    return changeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeItem value)? changeItem,
    TResult Function(_RegisterCompany value)? registerCompany,
    TResult Function(_UploadImageLogo value)? uploadImageLogo,
    TResult Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult Function(_UploadImageSignature value)? uploadImageSignature,
    TResult Function(_UploadImageLisence value)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (changeItem != null) {
      return changeItem(this);
    }
    return orElse();
  }
}

abstract class _ChangeItem implements RegisterCompanyEvent {
  const factory _ChangeItem({required final TypeCompanty item}) = _$_ChangeItem;

  TypeCompanty get item;
  @JsonKey(ignore: true)
  _$$_ChangeItemCopyWith<_$_ChangeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegisterCompanyCopyWith<$Res> {
  factory _$$_RegisterCompanyCopyWith(
          _$_RegisterCompany value, $Res Function(_$_RegisterCompany) then) =
      __$$_RegisterCompanyCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterPartTwoSeller request});
}

/// @nodoc
class __$$_RegisterCompanyCopyWithImpl<$Res>
    extends _$RegisterCompanyEventCopyWithImpl<$Res, _$_RegisterCompany>
    implements _$$_RegisterCompanyCopyWith<$Res> {
  __$$_RegisterCompanyCopyWithImpl(
      _$_RegisterCompany _value, $Res Function(_$_RegisterCompany) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$_RegisterCompany(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RegisterPartTwoSeller,
    ));
  }
}

/// @nodoc

class _$_RegisterCompany implements _RegisterCompany {
  const _$_RegisterCompany({required this.request});

  @override
  final RegisterPartTwoSeller request;

  @override
  String toString() {
    return 'RegisterCompanyEvent.registerCompany(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterCompany &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterCompanyCopyWith<_$_RegisterCompany> get copyWith =>
      __$$_RegisterCompanyCopyWithImpl<_$_RegisterCompany>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TypeCompanty item) changeItem,
    required TResult Function(RegisterPartTwoSeller request) registerCompany,
    required TResult Function(ImageSource source) uploadImageLogo,
    required TResult Function(ImageSource source) uploadImagecardIntity,
    required TResult Function(ImageSource source) uploadImageSignature,
    required TResult Function(ImageSource source) uploadImageLisence,
  }) {
    return registerCompany(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TypeCompanty item)? changeItem,
    TResult? Function(RegisterPartTwoSeller request)? registerCompany,
    TResult? Function(ImageSource source)? uploadImageLogo,
    TResult? Function(ImageSource source)? uploadImagecardIntity,
    TResult? Function(ImageSource source)? uploadImageSignature,
    TResult? Function(ImageSource source)? uploadImageLisence,
  }) {
    return registerCompany?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TypeCompanty item)? changeItem,
    TResult Function(RegisterPartTwoSeller request)? registerCompany,
    TResult Function(ImageSource source)? uploadImageLogo,
    TResult Function(ImageSource source)? uploadImagecardIntity,
    TResult Function(ImageSource source)? uploadImageSignature,
    TResult Function(ImageSource source)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (registerCompany != null) {
      return registerCompany(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeItem value) changeItem,
    required TResult Function(_RegisterCompany value) registerCompany,
    required TResult Function(_UploadImageLogo value) uploadImageLogo,
    required TResult Function(_UploadImagecardIntity value)
        uploadImagecardIntity,
    required TResult Function(_UploadImageSignature value) uploadImageSignature,
    required TResult Function(_UploadImageLisence value) uploadImageLisence,
  }) {
    return registerCompany(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeItem value)? changeItem,
    TResult? Function(_RegisterCompany value)? registerCompany,
    TResult? Function(_UploadImageLogo value)? uploadImageLogo,
    TResult? Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult? Function(_UploadImageSignature value)? uploadImageSignature,
    TResult? Function(_UploadImageLisence value)? uploadImageLisence,
  }) {
    return registerCompany?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeItem value)? changeItem,
    TResult Function(_RegisterCompany value)? registerCompany,
    TResult Function(_UploadImageLogo value)? uploadImageLogo,
    TResult Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult Function(_UploadImageSignature value)? uploadImageSignature,
    TResult Function(_UploadImageLisence value)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (registerCompany != null) {
      return registerCompany(this);
    }
    return orElse();
  }
}

abstract class _RegisterCompany implements RegisterCompanyEvent {
  const factory _RegisterCompany(
      {required final RegisterPartTwoSeller request}) = _$_RegisterCompany;

  RegisterPartTwoSeller get request;
  @JsonKey(ignore: true)
  _$$_RegisterCompanyCopyWith<_$_RegisterCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadImageLogoCopyWith<$Res> {
  factory _$$_UploadImageLogoCopyWith(
          _$_UploadImageLogo value, $Res Function(_$_UploadImageLogo) then) =
      __$$_UploadImageLogoCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSource source});
}

/// @nodoc
class __$$_UploadImageLogoCopyWithImpl<$Res>
    extends _$RegisterCompanyEventCopyWithImpl<$Res, _$_UploadImageLogo>
    implements _$$_UploadImageLogoCopyWith<$Res> {
  __$$_UploadImageLogoCopyWithImpl(
      _$_UploadImageLogo _value, $Res Function(_$_UploadImageLogo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$_UploadImageLogo(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageSource,
    ));
  }
}

/// @nodoc

class _$_UploadImageLogo implements _UploadImageLogo {
  const _$_UploadImageLogo({required this.source});

  @override
  final ImageSource source;

  @override
  String toString() {
    return 'RegisterCompanyEvent.uploadImageLogo(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadImageLogo &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadImageLogoCopyWith<_$_UploadImageLogo> get copyWith =>
      __$$_UploadImageLogoCopyWithImpl<_$_UploadImageLogo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TypeCompanty item) changeItem,
    required TResult Function(RegisterPartTwoSeller request) registerCompany,
    required TResult Function(ImageSource source) uploadImageLogo,
    required TResult Function(ImageSource source) uploadImagecardIntity,
    required TResult Function(ImageSource source) uploadImageSignature,
    required TResult Function(ImageSource source) uploadImageLisence,
  }) {
    return uploadImageLogo(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TypeCompanty item)? changeItem,
    TResult? Function(RegisterPartTwoSeller request)? registerCompany,
    TResult? Function(ImageSource source)? uploadImageLogo,
    TResult? Function(ImageSource source)? uploadImagecardIntity,
    TResult? Function(ImageSource source)? uploadImageSignature,
    TResult? Function(ImageSource source)? uploadImageLisence,
  }) {
    return uploadImageLogo?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TypeCompanty item)? changeItem,
    TResult Function(RegisterPartTwoSeller request)? registerCompany,
    TResult Function(ImageSource source)? uploadImageLogo,
    TResult Function(ImageSource source)? uploadImagecardIntity,
    TResult Function(ImageSource source)? uploadImageSignature,
    TResult Function(ImageSource source)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (uploadImageLogo != null) {
      return uploadImageLogo(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeItem value) changeItem,
    required TResult Function(_RegisterCompany value) registerCompany,
    required TResult Function(_UploadImageLogo value) uploadImageLogo,
    required TResult Function(_UploadImagecardIntity value)
        uploadImagecardIntity,
    required TResult Function(_UploadImageSignature value) uploadImageSignature,
    required TResult Function(_UploadImageLisence value) uploadImageLisence,
  }) {
    return uploadImageLogo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeItem value)? changeItem,
    TResult? Function(_RegisterCompany value)? registerCompany,
    TResult? Function(_UploadImageLogo value)? uploadImageLogo,
    TResult? Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult? Function(_UploadImageSignature value)? uploadImageSignature,
    TResult? Function(_UploadImageLisence value)? uploadImageLisence,
  }) {
    return uploadImageLogo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeItem value)? changeItem,
    TResult Function(_RegisterCompany value)? registerCompany,
    TResult Function(_UploadImageLogo value)? uploadImageLogo,
    TResult Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult Function(_UploadImageSignature value)? uploadImageSignature,
    TResult Function(_UploadImageLisence value)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (uploadImageLogo != null) {
      return uploadImageLogo(this);
    }
    return orElse();
  }
}

abstract class _UploadImageLogo implements RegisterCompanyEvent {
  const factory _UploadImageLogo({required final ImageSource source}) =
      _$_UploadImageLogo;

  ImageSource get source;
  @JsonKey(ignore: true)
  _$$_UploadImageLogoCopyWith<_$_UploadImageLogo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadImagecardIntityCopyWith<$Res> {
  factory _$$_UploadImagecardIntityCopyWith(_$_UploadImagecardIntity value,
          $Res Function(_$_UploadImagecardIntity) then) =
      __$$_UploadImagecardIntityCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSource source});
}

/// @nodoc
class __$$_UploadImagecardIntityCopyWithImpl<$Res>
    extends _$RegisterCompanyEventCopyWithImpl<$Res, _$_UploadImagecardIntity>
    implements _$$_UploadImagecardIntityCopyWith<$Res> {
  __$$_UploadImagecardIntityCopyWithImpl(_$_UploadImagecardIntity _value,
      $Res Function(_$_UploadImagecardIntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$_UploadImagecardIntity(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageSource,
    ));
  }
}

/// @nodoc

class _$_UploadImagecardIntity implements _UploadImagecardIntity {
  const _$_UploadImagecardIntity({required this.source});

  @override
  final ImageSource source;

  @override
  String toString() {
    return 'RegisterCompanyEvent.uploadImagecardIntity(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadImagecardIntity &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadImagecardIntityCopyWith<_$_UploadImagecardIntity> get copyWith =>
      __$$_UploadImagecardIntityCopyWithImpl<_$_UploadImagecardIntity>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TypeCompanty item) changeItem,
    required TResult Function(RegisterPartTwoSeller request) registerCompany,
    required TResult Function(ImageSource source) uploadImageLogo,
    required TResult Function(ImageSource source) uploadImagecardIntity,
    required TResult Function(ImageSource source) uploadImageSignature,
    required TResult Function(ImageSource source) uploadImageLisence,
  }) {
    return uploadImagecardIntity(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TypeCompanty item)? changeItem,
    TResult? Function(RegisterPartTwoSeller request)? registerCompany,
    TResult? Function(ImageSource source)? uploadImageLogo,
    TResult? Function(ImageSource source)? uploadImagecardIntity,
    TResult? Function(ImageSource source)? uploadImageSignature,
    TResult? Function(ImageSource source)? uploadImageLisence,
  }) {
    return uploadImagecardIntity?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TypeCompanty item)? changeItem,
    TResult Function(RegisterPartTwoSeller request)? registerCompany,
    TResult Function(ImageSource source)? uploadImageLogo,
    TResult Function(ImageSource source)? uploadImagecardIntity,
    TResult Function(ImageSource source)? uploadImageSignature,
    TResult Function(ImageSource source)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (uploadImagecardIntity != null) {
      return uploadImagecardIntity(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeItem value) changeItem,
    required TResult Function(_RegisterCompany value) registerCompany,
    required TResult Function(_UploadImageLogo value) uploadImageLogo,
    required TResult Function(_UploadImagecardIntity value)
        uploadImagecardIntity,
    required TResult Function(_UploadImageSignature value) uploadImageSignature,
    required TResult Function(_UploadImageLisence value) uploadImageLisence,
  }) {
    return uploadImagecardIntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeItem value)? changeItem,
    TResult? Function(_RegisterCompany value)? registerCompany,
    TResult? Function(_UploadImageLogo value)? uploadImageLogo,
    TResult? Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult? Function(_UploadImageSignature value)? uploadImageSignature,
    TResult? Function(_UploadImageLisence value)? uploadImageLisence,
  }) {
    return uploadImagecardIntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeItem value)? changeItem,
    TResult Function(_RegisterCompany value)? registerCompany,
    TResult Function(_UploadImageLogo value)? uploadImageLogo,
    TResult Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult Function(_UploadImageSignature value)? uploadImageSignature,
    TResult Function(_UploadImageLisence value)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (uploadImagecardIntity != null) {
      return uploadImagecardIntity(this);
    }
    return orElse();
  }
}

abstract class _UploadImagecardIntity implements RegisterCompanyEvent {
  const factory _UploadImagecardIntity({required final ImageSource source}) =
      _$_UploadImagecardIntity;

  ImageSource get source;
  @JsonKey(ignore: true)
  _$$_UploadImagecardIntityCopyWith<_$_UploadImagecardIntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadImageSignatureCopyWith<$Res> {
  factory _$$_UploadImageSignatureCopyWith(_$_UploadImageSignature value,
          $Res Function(_$_UploadImageSignature) then) =
      __$$_UploadImageSignatureCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSource source});
}

/// @nodoc
class __$$_UploadImageSignatureCopyWithImpl<$Res>
    extends _$RegisterCompanyEventCopyWithImpl<$Res, _$_UploadImageSignature>
    implements _$$_UploadImageSignatureCopyWith<$Res> {
  __$$_UploadImageSignatureCopyWithImpl(_$_UploadImageSignature _value,
      $Res Function(_$_UploadImageSignature) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$_UploadImageSignature(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageSource,
    ));
  }
}

/// @nodoc

class _$_UploadImageSignature implements _UploadImageSignature {
  const _$_UploadImageSignature({required this.source});

  @override
  final ImageSource source;

  @override
  String toString() {
    return 'RegisterCompanyEvent.uploadImageSignature(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadImageSignature &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadImageSignatureCopyWith<_$_UploadImageSignature> get copyWith =>
      __$$_UploadImageSignatureCopyWithImpl<_$_UploadImageSignature>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TypeCompanty item) changeItem,
    required TResult Function(RegisterPartTwoSeller request) registerCompany,
    required TResult Function(ImageSource source) uploadImageLogo,
    required TResult Function(ImageSource source) uploadImagecardIntity,
    required TResult Function(ImageSource source) uploadImageSignature,
    required TResult Function(ImageSource source) uploadImageLisence,
  }) {
    return uploadImageSignature(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TypeCompanty item)? changeItem,
    TResult? Function(RegisterPartTwoSeller request)? registerCompany,
    TResult? Function(ImageSource source)? uploadImageLogo,
    TResult? Function(ImageSource source)? uploadImagecardIntity,
    TResult? Function(ImageSource source)? uploadImageSignature,
    TResult? Function(ImageSource source)? uploadImageLisence,
  }) {
    return uploadImageSignature?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TypeCompanty item)? changeItem,
    TResult Function(RegisterPartTwoSeller request)? registerCompany,
    TResult Function(ImageSource source)? uploadImageLogo,
    TResult Function(ImageSource source)? uploadImagecardIntity,
    TResult Function(ImageSource source)? uploadImageSignature,
    TResult Function(ImageSource source)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (uploadImageSignature != null) {
      return uploadImageSignature(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeItem value) changeItem,
    required TResult Function(_RegisterCompany value) registerCompany,
    required TResult Function(_UploadImageLogo value) uploadImageLogo,
    required TResult Function(_UploadImagecardIntity value)
        uploadImagecardIntity,
    required TResult Function(_UploadImageSignature value) uploadImageSignature,
    required TResult Function(_UploadImageLisence value) uploadImageLisence,
  }) {
    return uploadImageSignature(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeItem value)? changeItem,
    TResult? Function(_RegisterCompany value)? registerCompany,
    TResult? Function(_UploadImageLogo value)? uploadImageLogo,
    TResult? Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult? Function(_UploadImageSignature value)? uploadImageSignature,
    TResult? Function(_UploadImageLisence value)? uploadImageLisence,
  }) {
    return uploadImageSignature?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeItem value)? changeItem,
    TResult Function(_RegisterCompany value)? registerCompany,
    TResult Function(_UploadImageLogo value)? uploadImageLogo,
    TResult Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult Function(_UploadImageSignature value)? uploadImageSignature,
    TResult Function(_UploadImageLisence value)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (uploadImageSignature != null) {
      return uploadImageSignature(this);
    }
    return orElse();
  }
}

abstract class _UploadImageSignature implements RegisterCompanyEvent {
  const factory _UploadImageSignature({required final ImageSource source}) =
      _$_UploadImageSignature;

  ImageSource get source;
  @JsonKey(ignore: true)
  _$$_UploadImageSignatureCopyWith<_$_UploadImageSignature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadImageLisenceCopyWith<$Res> {
  factory _$$_UploadImageLisenceCopyWith(_$_UploadImageLisence value,
          $Res Function(_$_UploadImageLisence) then) =
      __$$_UploadImageLisenceCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSource source});
}

/// @nodoc
class __$$_UploadImageLisenceCopyWithImpl<$Res>
    extends _$RegisterCompanyEventCopyWithImpl<$Res, _$_UploadImageLisence>
    implements _$$_UploadImageLisenceCopyWith<$Res> {
  __$$_UploadImageLisenceCopyWithImpl(
      _$_UploadImageLisence _value, $Res Function(_$_UploadImageLisence) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$_UploadImageLisence(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageSource,
    ));
  }
}

/// @nodoc

class _$_UploadImageLisence implements _UploadImageLisence {
  const _$_UploadImageLisence({required this.source});

  @override
  final ImageSource source;

  @override
  String toString() {
    return 'RegisterCompanyEvent.uploadImageLisence(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadImageLisence &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadImageLisenceCopyWith<_$_UploadImageLisence> get copyWith =>
      __$$_UploadImageLisenceCopyWithImpl<_$_UploadImageLisence>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TypeCompanty item) changeItem,
    required TResult Function(RegisterPartTwoSeller request) registerCompany,
    required TResult Function(ImageSource source) uploadImageLogo,
    required TResult Function(ImageSource source) uploadImagecardIntity,
    required TResult Function(ImageSource source) uploadImageSignature,
    required TResult Function(ImageSource source) uploadImageLisence,
  }) {
    return uploadImageLisence(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TypeCompanty item)? changeItem,
    TResult? Function(RegisterPartTwoSeller request)? registerCompany,
    TResult? Function(ImageSource source)? uploadImageLogo,
    TResult? Function(ImageSource source)? uploadImagecardIntity,
    TResult? Function(ImageSource source)? uploadImageSignature,
    TResult? Function(ImageSource source)? uploadImageLisence,
  }) {
    return uploadImageLisence?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TypeCompanty item)? changeItem,
    TResult Function(RegisterPartTwoSeller request)? registerCompany,
    TResult Function(ImageSource source)? uploadImageLogo,
    TResult Function(ImageSource source)? uploadImagecardIntity,
    TResult Function(ImageSource source)? uploadImageSignature,
    TResult Function(ImageSource source)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (uploadImageLisence != null) {
      return uploadImageLisence(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeItem value) changeItem,
    required TResult Function(_RegisterCompany value) registerCompany,
    required TResult Function(_UploadImageLogo value) uploadImageLogo,
    required TResult Function(_UploadImagecardIntity value)
        uploadImagecardIntity,
    required TResult Function(_UploadImageSignature value) uploadImageSignature,
    required TResult Function(_UploadImageLisence value) uploadImageLisence,
  }) {
    return uploadImageLisence(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeItem value)? changeItem,
    TResult? Function(_RegisterCompany value)? registerCompany,
    TResult? Function(_UploadImageLogo value)? uploadImageLogo,
    TResult? Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult? Function(_UploadImageSignature value)? uploadImageSignature,
    TResult? Function(_UploadImageLisence value)? uploadImageLisence,
  }) {
    return uploadImageLisence?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeItem value)? changeItem,
    TResult Function(_RegisterCompany value)? registerCompany,
    TResult Function(_UploadImageLogo value)? uploadImageLogo,
    TResult Function(_UploadImagecardIntity value)? uploadImagecardIntity,
    TResult Function(_UploadImageSignature value)? uploadImageSignature,
    TResult Function(_UploadImageLisence value)? uploadImageLisence,
    required TResult orElse(),
  }) {
    if (uploadImageLisence != null) {
      return uploadImageLisence(this);
    }
    return orElse();
  }
}

abstract class _UploadImageLisence implements RegisterCompanyEvent {
  const factory _UploadImageLisence({required final ImageSource source}) =
      _$_UploadImageLisence;

  ImageSource get source;
  @JsonKey(ignore: true)
  _$$_UploadImageLisenceCopyWith<_$_UploadImageLisence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterCompanyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterCompanyStateCopyWith<$Res> {
  factory $RegisterCompanyStateCopyWith(RegisterCompanyState value,
          $Res Function(RegisterCompanyState) then) =
      _$RegisterCompanyStateCopyWithImpl<$Res, RegisterCompanyState>;
}

/// @nodoc
class _$RegisterCompanyStateCopyWithImpl<$Res,
        $Val extends RegisterCompanyState>
    implements $RegisterCompanyStateCopyWith<$Res> {
  _$RegisterCompanyStateCopyWithImpl(this._value, this._then);

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
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'RegisterCompanyState.initial()';
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
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
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
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterCompanyState {
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
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_loading>
    implements _$$_loadingCopyWith<$Res> {
  __$$_loadingCopyWithImpl(_$_loading _value, $Res Function(_$_loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'RegisterCompanyState.loading()';
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
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
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
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements RegisterCompanyState {
  const factory _loading() = _$_loading;
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
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_DataLoaded>
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
    return 'RegisterCompanyState.dataLoaded(data: $data)';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return dataLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return dataLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
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
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return dataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return dataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (dataLoaded != null) {
      return dataLoaded(this);
    }
    return orElse();
  }
}

abstract class _DataLoaded implements RegisterCompanyState {
  const factory _DataLoaded({required final List<StandarEntity> data}) =
      _$_DataLoaded;

  List<StandarEntity> get data;
  @JsonKey(ignore: true)
  _$$_DataLoadedCopyWith<_$_DataLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SeasonsLoadadCopyWith<$Res> {
  factory _$$_SeasonsLoadadCopyWith(
          _$_SeasonsLoadad value, $Res Function(_$_SeasonsLoadad) then) =
      __$$_SeasonsLoadadCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StandarEntity> data});
}

/// @nodoc
class __$$_SeasonsLoadadCopyWithImpl<$Res>
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_SeasonsLoadad>
    implements _$$_SeasonsLoadadCopyWith<$Res> {
  __$$_SeasonsLoadadCopyWithImpl(
      _$_SeasonsLoadad _value, $Res Function(_$_SeasonsLoadad) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_SeasonsLoadad(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StandarEntity>,
    ));
  }
}

/// @nodoc

class _$_SeasonsLoadad implements _SeasonsLoadad {
  const _$_SeasonsLoadad({required final List<StandarEntity> data})
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
    return 'RegisterCompanyState.seasonsLoaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeasonsLoadad &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeasonsLoadadCopyWith<_$_SeasonsLoadad> get copyWith =>
      __$$_SeasonsLoadadCopyWithImpl<_$_SeasonsLoadad>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return seasonsLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return seasonsLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (seasonsLoaded != null) {
      return seasonsLoaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return seasonsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return seasonsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (seasonsLoaded != null) {
      return seasonsLoaded(this);
    }
    return orElse();
  }
}

abstract class _SeasonsLoadad implements RegisterCompanyState {
  const factory _SeasonsLoadad({required final List<StandarEntity> data}) =
      _$_SeasonsLoadad;

  List<StandarEntity> get data;
  @JsonKey(ignore: true)
  _$$_SeasonsLoadadCopyWith<_$_SeasonsLoadad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EroorCopyWith<$Res> {
  factory _$$_EroorCopyWith(_$_Eroor value, $Res Function(_$_Eroor) then) =
      __$$_EroorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? msg});
}

/// @nodoc
class __$$_EroorCopyWithImpl<$Res>
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_Eroor>
    implements _$$_EroorCopyWith<$Res> {
  __$$_EroorCopyWithImpl(_$_Eroor _value, $Res Function(_$_Eroor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$_Eroor(
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Eroor implements _Eroor {
  const _$_Eroor({this.msg});

  @override
  final String? msg;

  @override
  String toString() {
    return 'RegisterCompanyState.eroor(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Eroor &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EroorCopyWith<_$_Eroor> get copyWith =>
      __$$_EroorCopyWithImpl<_$_Eroor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return eroor(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return eroor?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (eroor != null) {
      return eroor(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return eroor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return eroor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (eroor != null) {
      return eroor(this);
    }
    return orElse();
  }
}

abstract class _Eroor implements RegisterCompanyState {
  const factory _Eroor({final String? msg}) = _$_Eroor;

  String? get msg;
  @JsonKey(ignore: true)
  _$$_EroorCopyWith<_$_Eroor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccesCopyWith<$Res> {
  factory _$$_SuccesCopyWith(_$_Succes value, $Res Function(_$_Succes) then) =
      __$$_SuccesCopyWithImpl<$Res>;
  @useResult
  $Res call({String? msg});
}

/// @nodoc
class __$$_SuccesCopyWithImpl<$Res>
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_Succes>
    implements _$$_SuccesCopyWith<$Res> {
  __$$_SuccesCopyWithImpl(_$_Succes _value, $Res Function(_$_Succes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$_Succes(
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Succes implements _Succes {
  const _$_Succes({this.msg});

  @override
  final String? msg;

  @override
  String toString() {
    return 'RegisterCompanyState.succes(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Succes &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccesCopyWith<_$_Succes> get copyWith =>
      __$$_SuccesCopyWithImpl<_$_Succes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return succes(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return succes?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
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
    required TResult Function(_loading value) loading,
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return succes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return succes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(this);
    }
    return orElse();
  }
}

abstract class _Succes implements RegisterCompanyState {
  const factory _Succes({final String? msg}) = _$_Succes;

  String? get msg;
  @JsonKey(ignore: true)
  _$$_SuccesCopyWith<_$_Succes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ItemChangedCopyWith<$Res> {
  factory _$$_ItemChangedCopyWith(
          _$_ItemChanged value, $Res Function(_$_ItemChanged) then) =
      __$$_ItemChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({TypeCompanty item});
}

/// @nodoc
class __$$_ItemChangedCopyWithImpl<$Res>
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_ItemChanged>
    implements _$$_ItemChangedCopyWith<$Res> {
  __$$_ItemChangedCopyWithImpl(
      _$_ItemChanged _value, $Res Function(_$_ItemChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_ItemChanged(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as TypeCompanty,
    ));
  }
}

/// @nodoc

class _$_ItemChanged implements _ItemChanged {
  const _$_ItemChanged({required this.item});

  @override
  final TypeCompanty item;

  @override
  String toString() {
    return 'RegisterCompanyState.itemChanged(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemChanged &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

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
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return itemChanged(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return itemChanged?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (itemChanged != null) {
      return itemChanged(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return itemChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return itemChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (itemChanged != null) {
      return itemChanged(this);
    }
    return orElse();
  }
}

abstract class _ItemChanged implements RegisterCompanyState {
  const factory _ItemChanged({required final TypeCompanty item}) =
      _$_ItemChanged;

  TypeCompanty get item;
  @JsonKey(ignore: true)
  _$$_ItemChangedCopyWith<_$_ItemChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedImageCardIntityCopyWith<$Res> {
  factory _$$_LoadedImageCardIntityCopyWith(_$_LoadedImageCardIntity value,
          $Res Function(_$_LoadedImageCardIntity) then) =
      __$$_LoadedImageCardIntityCopyWithImpl<$Res>;
  @useResult
  $Res call({List<XFile> image});
}

/// @nodoc
class __$$_LoadedImageCardIntityCopyWithImpl<$Res>
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_LoadedImageCardIntity>
    implements _$$_LoadedImageCardIntityCopyWith<$Res> {
  __$$_LoadedImageCardIntityCopyWithImpl(_$_LoadedImageCardIntity _value,
      $Res Function(_$_LoadedImageCardIntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_LoadedImageCardIntity(
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ));
  }
}

/// @nodoc

class _$_LoadedImageCardIntity implements _LoadedImageCardIntity {
  const _$_LoadedImageCardIntity({required final List<XFile> image})
      : _image = image;

  final List<XFile> _image;
  @override
  List<XFile> get image {
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_image);
  }

  @override
  String toString() {
    return 'RegisterCompanyState.loadedImagecardIntity(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedImageCardIntity &&
            const DeepCollectionEquality().equals(other._image, _image));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedImageCardIntityCopyWith<_$_LoadedImageCardIntity> get copyWith =>
      __$$_LoadedImageCardIntityCopyWithImpl<_$_LoadedImageCardIntity>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return loadedImagecardIntity(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return loadedImagecardIntity?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (loadedImagecardIntity != null) {
      return loadedImagecardIntity(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return loadedImagecardIntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return loadedImagecardIntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (loadedImagecardIntity != null) {
      return loadedImagecardIntity(this);
    }
    return orElse();
  }
}

abstract class _LoadedImageCardIntity implements RegisterCompanyState {
  const factory _LoadedImageCardIntity({required final List<XFile> image}) =
      _$_LoadedImageCardIntity;

  List<XFile> get image;
  @JsonKey(ignore: true)
  _$$_LoadedImageCardIntityCopyWith<_$_LoadedImageCardIntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedImageLogoCopyWith<$Res> {
  factory _$$_LoadedImageLogoCopyWith(
          _$_LoadedImageLogo value, $Res Function(_$_LoadedImageLogo) then) =
      __$$_LoadedImageLogoCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile image});
}

/// @nodoc
class __$$_LoadedImageLogoCopyWithImpl<$Res>
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_LoadedImageLogo>
    implements _$$_LoadedImageLogoCopyWith<$Res> {
  __$$_LoadedImageLogoCopyWithImpl(
      _$_LoadedImageLogo _value, $Res Function(_$_LoadedImageLogo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_LoadedImageLogo(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$_LoadedImageLogo implements _LoadedImageLogo {
  const _$_LoadedImageLogo({required this.image});

  @override
  final XFile image;

  @override
  String toString() {
    return 'RegisterCompanyState.loadedImageLogo(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedImageLogo &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedImageLogoCopyWith<_$_LoadedImageLogo> get copyWith =>
      __$$_LoadedImageLogoCopyWithImpl<_$_LoadedImageLogo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return loadedImageLogo(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return loadedImageLogo?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (loadedImageLogo != null) {
      return loadedImageLogo(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return loadedImageLogo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return loadedImageLogo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (loadedImageLogo != null) {
      return loadedImageLogo(this);
    }
    return orElse();
  }
}

abstract class _LoadedImageLogo implements RegisterCompanyState {
  const factory _LoadedImageLogo({required final XFile image}) =
      _$_LoadedImageLogo;

  XFile get image;
  @JsonKey(ignore: true)
  _$$_LoadedImageLogoCopyWith<_$_LoadedImageLogo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedImageSignatureCopyWith<$Res> {
  factory _$$_LoadedImageSignatureCopyWith(_$_LoadedImageSignature value,
          $Res Function(_$_LoadedImageSignature) then) =
      __$$_LoadedImageSignatureCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile image});
}

/// @nodoc
class __$$_LoadedImageSignatureCopyWithImpl<$Res>
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_LoadedImageSignature>
    implements _$$_LoadedImageSignatureCopyWith<$Res> {
  __$$_LoadedImageSignatureCopyWithImpl(_$_LoadedImageSignature _value,
      $Res Function(_$_LoadedImageSignature) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_LoadedImageSignature(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$_LoadedImageSignature implements _LoadedImageSignature {
  const _$_LoadedImageSignature({required this.image});

  @override
  final XFile image;

  @override
  String toString() {
    return 'RegisterCompanyState.loadedImageSignuature(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedImageSignature &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedImageSignatureCopyWith<_$_LoadedImageSignature> get copyWith =>
      __$$_LoadedImageSignatureCopyWithImpl<_$_LoadedImageSignature>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return loadedImageSignuature(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return loadedImageSignuature?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (loadedImageSignuature != null) {
      return loadedImageSignuature(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return loadedImageSignuature(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return loadedImageSignuature?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (loadedImageSignuature != null) {
      return loadedImageSignuature(this);
    }
    return orElse();
  }
}

abstract class _LoadedImageSignature implements RegisterCompanyState {
  const factory _LoadedImageSignature({required final XFile image}) =
      _$_LoadedImageSignature;

  XFile get image;
  @JsonKey(ignore: true)
  _$$_LoadedImageSignatureCopyWith<_$_LoadedImageSignature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedImageLisenceCopyWith<$Res> {
  factory _$$_LoadedImageLisenceCopyWith(_$_LoadedImageLisence value,
          $Res Function(_$_LoadedImageLisence) then) =
      __$$_LoadedImageLisenceCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile image});
}

/// @nodoc
class __$$_LoadedImageLisenceCopyWithImpl<$Res>
    extends _$RegisterCompanyStateCopyWithImpl<$Res, _$_LoadedImageLisence>
    implements _$$_LoadedImageLisenceCopyWith<$Res> {
  __$$_LoadedImageLisenceCopyWithImpl(
      _$_LoadedImageLisence _value, $Res Function(_$_LoadedImageLisence) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_LoadedImageLisence(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$_LoadedImageLisence implements _LoadedImageLisence {
  const _$_LoadedImageLisence({required this.image});

  @override
  final XFile image;

  @override
  String toString() {
    return 'RegisterCompanyState.loadedImageLisence(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedImageLisence &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedImageLisenceCopyWith<_$_LoadedImageLisence> get copyWith =>
      __$$_LoadedImageLisenceCopyWithImpl<_$_LoadedImageLisence>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StandarEntity> data) dataLoaded,
    required TResult Function(List<StandarEntity> data) seasonsLoaded,
    required TResult Function(String? msg) eroor,
    required TResult Function(String? msg) succes,
    required TResult Function(TypeCompanty item) itemChanged,
    required TResult Function(List<XFile> image) loadedImagecardIntity,
    required TResult Function(XFile image) loadedImageLogo,
    required TResult Function(XFile image) loadedImageSignuature,
    required TResult Function(XFile image) loadedImageLisence,
  }) {
    return loadedImageLisence(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StandarEntity> data)? dataLoaded,
    TResult? Function(List<StandarEntity> data)? seasonsLoaded,
    TResult? Function(String? msg)? eroor,
    TResult? Function(String? msg)? succes,
    TResult? Function(TypeCompanty item)? itemChanged,
    TResult? Function(List<XFile> image)? loadedImagecardIntity,
    TResult? Function(XFile image)? loadedImageLogo,
    TResult? Function(XFile image)? loadedImageSignuature,
    TResult? Function(XFile image)? loadedImageLisence,
  }) {
    return loadedImageLisence?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StandarEntity> data)? dataLoaded,
    TResult Function(List<StandarEntity> data)? seasonsLoaded,
    TResult Function(String? msg)? eroor,
    TResult Function(String? msg)? succes,
    TResult Function(TypeCompanty item)? itemChanged,
    TResult Function(List<XFile> image)? loadedImagecardIntity,
    TResult Function(XFile image)? loadedImageLogo,
    TResult Function(XFile image)? loadedImageSignuature,
    TResult Function(XFile image)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (loadedImageLisence != null) {
      return loadedImageLisence(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loading value) loading,
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_SeasonsLoadad value) seasonsLoaded,
    required TResult Function(_Eroor value) eroor,
    required TResult Function(_Succes value) succes,
    required TResult Function(_ItemChanged value) itemChanged,
    required TResult Function(_LoadedImageCardIntity value)
        loadedImagecardIntity,
    required TResult Function(_LoadedImageLogo value) loadedImageLogo,
    required TResult Function(_LoadedImageSignature value)
        loadedImageSignuature,
    required TResult Function(_LoadedImageLisence value) loadedImageLisence,
  }) {
    return loadedImageLisence(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loading value)? loading,
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult? Function(_Eroor value)? eroor,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_ItemChanged value)? itemChanged,
    TResult? Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult? Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult? Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult? Function(_LoadedImageLisence value)? loadedImageLisence,
  }) {
    return loadedImageLisence?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loading value)? loading,
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_SeasonsLoadad value)? seasonsLoaded,
    TResult Function(_Eroor value)? eroor,
    TResult Function(_Succes value)? succes,
    TResult Function(_ItemChanged value)? itemChanged,
    TResult Function(_LoadedImageCardIntity value)? loadedImagecardIntity,
    TResult Function(_LoadedImageLogo value)? loadedImageLogo,
    TResult Function(_LoadedImageSignature value)? loadedImageSignuature,
    TResult Function(_LoadedImageLisence value)? loadedImageLisence,
    required TResult orElse(),
  }) {
    if (loadedImageLisence != null) {
      return loadedImageLisence(this);
    }
    return orElse();
  }
}

abstract class _LoadedImageLisence implements RegisterCompanyState {
  const factory _LoadedImageLisence({required final XFile image}) =
      _$_LoadedImageLisence;

  XFile get image;
  @JsonKey(ignore: true)
  _$$_LoadedImageLisenceCopyWith<_$_LoadedImageLisence> get copyWith =>
      throw _privateConstructorUsedError;
}
