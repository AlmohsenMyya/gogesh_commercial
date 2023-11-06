part of 'work_days_bloc.dart';

@freezed
class WorkDaysEvent with _$WorkDaysEvent {
const factory WorkDaysEvent.load() = _load;
const factory WorkDaysEvent.editWorkDays({required EditWorkDaysRequest request}) = _editWorkDays;


}