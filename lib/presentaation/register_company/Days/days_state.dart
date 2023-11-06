part of 'days_bloc.dart';

@freezed
class DaysState with _$DaysState {
  const factory DaysState.error() = _error;
  const factory DaysState.loading() = _loading;
  const factory DaysState.daysLoaded({required List<StandarEntity> data}) = _daysLoaded;
  

  
  
}
