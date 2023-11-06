part of '../sections_bloc/sections_bloc.dart';

@freezed
class SectionsState with _$SectionsState {
   const factory SectionsState.initial() = _initial;

  const factory SectionsState.loading() = _loading;

  const factory SectionsState.empty() = _empty;

  const factory SectionsState.loadingMoreFailed() = _LoadingMoreFailed;

  const factory SectionsState.error(ErrorState error) = _error;

  const factory SectionsState.loadingMore() = _LoadingMore;

  const factory SectionsState.loaded(
      {required List<StandarEntity> data,
      pageKey,
      required bool lastPage}) = _Loadad;
  const factory SectionsState.itemChanged({required List<StandarEntity> data}) =
      _ItemChanged;
   
}
