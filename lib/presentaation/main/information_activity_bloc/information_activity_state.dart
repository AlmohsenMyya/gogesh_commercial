part of 'information_activity_bloc.dart';

@freezed
class InformationActivityState with _$InformationActivityState {
  const factory InformationActivityState.initial() = _Initial;
  const factory InformationActivityState.dataLoaded({required InformationResponse request}) = _dataLoaded;
  const factory InformationActivityState.error() = _error;
  
}
