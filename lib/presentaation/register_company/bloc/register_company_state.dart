part of 'register_company_bloc.dart';

@freezed
class RegisterCompanyState with _$RegisterCompanyState {
  const factory RegisterCompanyState.initial() = _Initial;
  const factory RegisterCompanyState.loading() = _loading;
  
    const factory RegisterCompanyState.dataLoaded({required List<StandarEntity> data}) =_DataLoaded;
    const factory RegisterCompanyState.seasonsLoaded({required List<StandarEntity> data}) =_SeasonsLoadad;

  const factory RegisterCompanyState.eroor({String? msg})=_Eroor;
  const factory RegisterCompanyState.succes({String? msg})=_Succes;
  const factory RegisterCompanyState.itemChanged(
      {required TypeCompanty item,
     }) = _ItemChanged;
         const factory RegisterCompanyState.loadedImagecardIntity({required List<XFile> image}) = _LoadedImageCardIntity;
    const factory RegisterCompanyState.loadedImageLogo({required XFile image}) = _LoadedImageLogo;
  const factory RegisterCompanyState.loadedImageSignuature({required XFile image}) = _LoadedImageSignature;

  const factory RegisterCompanyState.loadedImageLisence({required XFile image}) = _LoadedImageLisence;

}
