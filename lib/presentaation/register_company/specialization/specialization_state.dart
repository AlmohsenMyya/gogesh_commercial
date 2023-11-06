part of 'specialization_bloc.dart';

@freezed
class SpecializationState with _$SpecializationState {
  const factory SpecializationState.initial() = _initial;

  const factory SpecializationState.loading() = _loading;

  const factory SpecializationState.empty() = _empty;

  const factory SpecializationState.loadingMoreFailed() = _LoadingMoreFailed;

  const factory SpecializationState.error(ErrorState error) = _error;

  const factory SpecializationState.loadingMore() = _LoadingMore;

  const factory SpecializationState.loaded(
      {required List<StandarEntity> data,
      pageKey,
      required bool lastPage}) = _Loadad;
  const factory SpecializationState.itemChanged({required List<StandarEntity> data}) =
      _ItemChanged;
}
