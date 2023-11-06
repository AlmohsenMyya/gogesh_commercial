part of 'region_bloc.dart';

@freezed
class RegionEvent with _$RegionEvent {
  const factory RegionEvent.load({required Filter filter}) = _Load;

  const factory RegionEvent.changeItem({required DataRegion item}) =
      _ChangeItem;
}
