part of 'service_bloc.dart';

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState.initial() = _initial;

  const factory ServiceState.loading() = _loading;

  const factory ServiceState.empty() = _empty;

  const factory ServiceState.loadingMoreFailed() = _LoadingMoreFailed;

  const factory ServiceState.error(ErrorState error) = _error;

  const factory ServiceState.loadingMore() = _LoadingMore;

  const factory ServiceState.loaded(
      {required List<StandarEntity> data,
      pageKey,
      required bool lastPage}) = _Loadad;
  const factory ServiceState.itemChanged({required List<StandarEntity> data}) =
      _ItemChanged;
}
