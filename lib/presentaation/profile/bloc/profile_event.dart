part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadedProfile() = _LoadedProfile;
  const factory ProfileEvent.changePassword(
      {required EditPasswordRequest request}) = _changePassword;
const factory ProfileEvent.changeEmail({required String email}) = _changeEmail;

  const factory ProfileEvent.editProfile(
      {required EditProfileRequest request}) = _EditProfile;
  const factory ProfileEvent.loadDetailsProfile() = _loadDetailsProfile;
}
