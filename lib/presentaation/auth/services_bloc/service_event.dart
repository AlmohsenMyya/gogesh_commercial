part of 'service_bloc.dart';

@freezed
class ServiceEvent with _$ServiceEvent {
  const factory ServiceEvent.loadMore({required Filter filter}) = _loadMore;

  const factory ServiceEvent.loadData({required Filter filter}) =
      _loadData;
  const factory ServiceEvent.changeItem({required List<StandarEntity> items}) =
      _ChangeItem;
}
