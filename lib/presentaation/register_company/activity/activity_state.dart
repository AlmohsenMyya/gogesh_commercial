part of 'activity_bloc.dart';

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState.dataLoaded({required List<StandarEntity> data}) =
      _DataLoaded;
      const factory ActivityState .loading() = _Loading;
  const factory ActivityState.error() = _Error;
  const factory ActivityState.initial() = _Initial;
  const factory ActivityState.itemChanged(
      {required StandarEntity item, required List<StandarEntity> data}) = _ItemChanged;
}
