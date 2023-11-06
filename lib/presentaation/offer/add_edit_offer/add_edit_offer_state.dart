part of 'add_edit_offer_bloc.dart';

@freezed
class AddEditOfferState with _$AddEditOfferState {
  const factory AddEditOfferState.initial() = _Initial;
  const factory AddEditOfferState.succes(String? error) = _succes;
  const factory AddEditOfferState.dataLoaded(
      {required OfferDetailsRasponse data}) = _dataLoaded;
  const factory AddEditOfferState.editLoading() = _editLoading;

  const factory AddEditOfferState.loading() = _Loading;
  const factory AddEditOfferState.error(String? msg) = _Error;
  const factory AddEditOfferState.loadedDurations(
      {required List<DurationsEntity> data}) = _loadedDurations;
  const factory AddEditOfferState.loadedVideo({
    required String image,
  }) = _loadedVideo;

  const factory AddEditOfferState.imagePicked({
    required List<XFile> image,
  }) = _ImagePicked;
  const factory AddEditOfferState.removeAndUploadedImage({
   required List<XFile> images
  }) = _RemoveAndUploadedImage;
}
