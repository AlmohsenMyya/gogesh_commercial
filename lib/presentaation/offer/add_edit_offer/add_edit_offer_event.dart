part of 'add_edit_offer_bloc.dart';

@freezed
class AddEditOfferEvent with _$AddEditOfferEvent {
  const factory AddEditOfferEvent.loadDurations() = _loadDurations;
  const factory AddEditOfferEvent.addOffer({required OfferRequest request}) =
      _addOffer;
  // const factory AddEditOfferEvent.loadOfferDtails({required int id}) =
  //     _loadOfferDtails;
      const factory AddEditOfferEvent.loadOfferUpdateDetails({required int updatedId}) = _loadOfferUpdateDetails;
      const factory AddEditOfferEvent.loadOfferDetails({required int id,required String path}) = _loadOfferDetails;
      

  const factory AddEditOfferEvent.editOffers({
    required OfferRequest request,
  }) = _editOffers;
  const factory AddEditOfferEvent.deleteOffers({required int id}) =
      _deleteOffers;

  const factory AddEditOfferEvent.uploadImage({required ImageSource source}) =
      _UploadImage;
  const factory AddEditOfferEvent.removeAndUploadImage(
      {required ImageSource source,
      required String path,
      required List<XFile> images}) = _RemoveAndUploadImage;
  const factory AddEditOfferEvent.uploadVideo({required ImageSource source}) =
      _uploadVideo;
}
