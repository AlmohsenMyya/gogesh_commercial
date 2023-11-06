part of 'offer_bloc.dart';

@freezed
class OfferState with _$OfferState {
  const factory OfferState.loading() = _Loading;
  const factory OfferState.error(ErrorState error) = _Error;
  const factory OfferState.empty() = _Empty;
  const factory OfferState.networkError() = _NetworkError;
  const factory OfferState.lastPageLoaded({required List<OfferEntity> offers}) =
      _LastPageLoaded;
  const factory OfferState.loaded({required List<OfferEntity> offers, pageKey}) =
      _Loaded;
}
