part of 'register_company_bloc.dart';

@freezed
class RegisterCompanyEvent with _$RegisterCompanyEvent {
  const factory RegisterCompanyEvent.changeItem({required TypeCompanty item}) =
      _ChangeItem;
  const factory RegisterCompanyEvent.registerCompany({
    required RegisterPartTwoSeller request,
  }) = _RegisterCompany;
  const factory RegisterCompanyEvent.uploadImageLogo(
      {required ImageSource source}) = _UploadImageLogo;
  const factory RegisterCompanyEvent.uploadImagecardIntity(
      {required ImageSource source}) = _UploadImagecardIntity;
  const factory RegisterCompanyEvent.uploadImageSignature(
      {required ImageSource source}) = _UploadImageSignature;
  const factory RegisterCompanyEvent.uploadImageLisence(
      {required ImageSource source}) = _UploadImageLisence;
}
