part of 'seasons_bloc.dart';

@freezed
class SeasonsState with _$SeasonsState {
  const factory SeasonsState.initial() = _initial;

  const factory SeasonsState.loading() = _loading;

  const factory SeasonsState.empty() = _empty;

  const factory SeasonsState.loadingMoreFailed() = _LoadingMoreFailed;

  const factory SeasonsState.error(ErrorState error) = _error;

  const factory SeasonsState.loadingMore() = _LoadingMore;

  const factory SeasonsState.Loaded(
      {required List<StandarEntity> data,
      pageKey,
      required bool lastPage}) = _Loadad;

  const factory SeasonsState.changedItems({
    required List<StandarEntity> data,
    pageKey,
    required bool lastPage,
    required List<StandarEntity> itemsSelected,
  }) = _changedItems;

  const factory SeasonsState.itemChanged({required List<StandarEntity> data}) =
      _ItemChanged;
}
