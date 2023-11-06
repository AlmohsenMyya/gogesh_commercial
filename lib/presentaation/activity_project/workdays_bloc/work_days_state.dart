part of 'work_days_bloc.dart';

@freezed
class WorkDaysState with _$WorkDaysState {
  const factory WorkDaysState.initial() = _Initial;
  const factory WorkDaysState.loading() = _loading;
  const factory WorkDaysState.succes() = _succes;
  const factory WorkDaysState.error({String? error}) = _error;

  const factory WorkDaysState.loadingEdit() = _loadingEdit;
  const factory WorkDaysState.dataLoaded({required WorkDaysResponse data}) =
      _dataLoaded;
}
