part of 'places_bloc.dart';

@freezed
class PlacesState with _$PlacesState {
 const factory PlacesState.dataLoaded({required List<PlacesEntity> data}) =
      _DataLoaded;
  const factory PlacesState.initial() = _Initial;
  const factory PlacesState.loading() = _Loading;
  const factory PlacesState.error() = _Error;
  const factory PlacesState.empty() = _Empty;
  const factory PlacesState.networkError() = _NetworkError;
  const factory PlacesState.loadingMore({required List<PlacesEntity> data}) =
      _LoadingMore;
  const factory PlacesState.itemChanged(
      {required PlacesEntity item, required List <PlacesEntity> data}) = _ItemChanged;}
