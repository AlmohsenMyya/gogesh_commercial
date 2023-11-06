part of 'activity_project_bloc.dart';

@freezed
class ActivityProjectState with _$ActivityProjectState {
  const factory ActivityProjectState.initial() = _Initial;
  const factory ActivityProjectState.loading() = _loading;
  const factory ActivityProjectState.success() = _success;
  const factory ActivityProjectState.loadingEdit() = _loadingEdit;
  
  const factory ActivityProjectState.error({String? error}) = _error;

  const factory ActivityProjectState.itemChanged({
    required TypeCompanty item,
  }) = _ItemChanged;
  const factory ActivityProjectState.dataLoaded(
      {required CompanyResponse data}) = _dataLoaded;
  const factory ActivityProjectState.loadedImageLogo({required XFile image}) =
      _LoadedImageLogo;
  const factory ActivityProjectState.loadedImageSignuature(
      {required XFile image}) = _LoadedImageSignature;

  const factory ActivityProjectState.loadedImageLisence(
      {required XFile image}) = _LoadedImageLisence;
}
