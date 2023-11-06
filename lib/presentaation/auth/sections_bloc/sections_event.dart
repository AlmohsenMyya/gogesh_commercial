part of 'sections_bloc.dart';

@freezed
class SectionsEvent with _$SectionsEvent {
  const factory SectionsEvent.loadMore({required Filter filter}) = _loadMore;

  const factory SectionsEvent.loadData({required Filter filter}) =
      _loadData;
  const factory SectionsEvent.changeItem({required List<StandarEntity> items}) =
      _ChangeItem;
}