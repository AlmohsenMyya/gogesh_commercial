part of 'sector_bloc.dart';

@freezed
class SectorState with _$SectorState {
  const factory SectorState.dataLoaded({required List<StandarEntity> data,required Meta meta}) =
      _DataLoaded;
  const factory SectorState.initial() = _Initial;
  const factory SectorState.loading() = _Loading;
  const factory SectorState.error() = _Error;
  const factory SectorState.empty() = _Empty;
  const factory SectorState.networkError() = _NetworkError;
  const factory SectorState.loadingMore({required List<StandarEntity> data}) =
      _LoadingMore;
  const factory SectorState.itemChanged(
      {required StandarEntity item, required List<StandarEntity> data}) = _ItemChanged;
}
