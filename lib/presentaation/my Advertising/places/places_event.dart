part of 'places_bloc.dart';

@freezed
class PlacesEvent with _$PlacesEvent {
  const factory PlacesEvent.load() = _Load;
  const factory PlacesEvent.changeItem({required PlacesEntity item}) = _ChangeItem;
}
