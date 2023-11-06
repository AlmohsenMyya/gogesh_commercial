part of '../social_account_bloc/social_account_bloc.dart';

@freezed
class SocialAccountState with _$SocialAccountState {
  const factory SocialAccountState.initial() = _Initial;
  const factory SocialAccountState.loading() = _loading;
  const factory SocialAccountState.succes() = _succes;
  const factory SocialAccountState.error({String? error}) = _error;

  const factory SocialAccountState.loadingEdit() = _loadingEdit;
  const factory SocialAccountState.dataLoaded(
      {required SocialAccountResponse data}) = _dataLoaded;
}
