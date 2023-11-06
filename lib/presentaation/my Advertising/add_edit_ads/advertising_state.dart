part of 'advertising_bloc.dart';

@freezed
class AddEditAdsState with _$AddEditAdsState {
  const factory AddEditAdsState.initial() = _Initial;
  const factory AddEditAdsState.succes(String? msg) = _succes;
const factory AddEditAdsState.dataLoaded({required AdsEntity ads}) = _dataLoaded;

  const factory AddEditAdsState.loading() = _Loading;
  const factory AddEditAdsState.error(String? error) = _Error;
const factory AddEditAdsState.loadingEdit() = _loadingEdit;

  const factory AddEditAdsState.imagePicked({required XFile image}) =
      _ImagePicked;
}
