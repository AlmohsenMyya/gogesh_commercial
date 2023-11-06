part of 'social_account_bloc.dart';

@freezed
class SocialAccountEvent with _$SocialAccountEvent {
  const factory SocialAccountEvent.load() = _load;
  const factory SocialAccountEvent.editSocialAccount(
      {required EditSocialAccounttRequest request}) = _editSocialAccount;
}
