part of 'specialization_bloc.dart';

@freezed
class SpecializationEvent with _$SpecializationEvent {
const factory SpecializationEvent.loadMore({required Filter filter}) = _loadMore;

  const factory SpecializationEvent.loadData({required Filter filter}) =
      _loadData;
  const factory SpecializationEvent.changeItem({required List<StandarEntity> items}) =
      _ChangeItem;
}
