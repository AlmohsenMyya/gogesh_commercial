part of 'activity_project_bloc.dart';

@freezed
class ActivityProjectEvent with _$ActivityProjectEvent {
  const factory ActivityProjectEvent.changeItem({required TypeCompanty item}) =
      _ChangeItem;
  const factory ActivityProjectEvent.editActivity(
      {required RegisterPartTwoSeller request}) = _editActivity;

  const factory ActivityProjectEvent.loadDetailsProfile() = _loadDetailsProfile;
  const factory ActivityProjectEvent.uploadImageLogo(
      {required ImageSource source}) = _UploadImageLogo;
  const factory ActivityProjectEvent.uploadImageSignature(
      {required ImageSource source}) = _UploadImageSignature;
  const factory ActivityProjectEvent.uploadImageLisence(
      {required ImageSource source}) = _UploadImageLisence;
}
