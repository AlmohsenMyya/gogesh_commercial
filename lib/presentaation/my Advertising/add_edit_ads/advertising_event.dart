part of 'advertising_bloc.dart';

@freezed
class AddEditAdsEvent with _$AddEditAdsEvent {
  const factory AddEditAdsEvent.addAds({required AdsRequest request}) = _addAds;
  const factory AddEditAdsEvent.editAds({required AdsRequest request}) =
      _editAds;

  const factory AddEditAdsEvent.loadAdsDetails({required int id,required String path}) =
      _loadAdsDetails;

  const factory AddEditAdsEvent.deleteAds({required int id}) = _deleteAds;


  const factory AddEditAdsEvent.uploadImage({required ImageSource source}) =
      _UploadImage;
}
