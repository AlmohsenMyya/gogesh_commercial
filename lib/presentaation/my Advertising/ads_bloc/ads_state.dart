part of 'ads_bloc.dart';

@freezed
class AdsState with _$AdsState {
const factory AdsState.loading() = _Loading;
  const factory AdsState.error(ErrorState error) = _Error;
  const factory AdsState.empty() = _Empty;
  const factory AdsState.networkError() = _NetworkError;
  const factory AdsState.lastPageLoaded({required List<AdsEntity> ads}) =
      _LastPageLoaded;
  const factory AdsState.loaded({required List<AdsEntity> ads, pageKey}) =
      _Loaded;}
