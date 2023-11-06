part of 'activity_bloc.dart';

@freezed
class ActivityEvent with _$ActivityEvent {
  const factory ActivityEvent.load({required Filter filter}) =
      _Load;
  const factory ActivityEvent.changeItem({required StandarEntity item}) =
      _ChangeItem;
}
