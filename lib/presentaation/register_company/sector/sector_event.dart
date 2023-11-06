part of 'sector_bloc.dart';

@freezed
class SectorEvent with _$SectorEvent {
  const factory SectorEvent.load({required Filter filter}) = _Load;
  const factory SectorEvent.loadMore() = _LoadMore;
  const factory SectorEvent.refresh() = _Refresh;
  const factory SectorEvent.changeItem({required StandarEntity item}) = _ChangeItem;
}
