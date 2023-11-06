part of 'country_bloc.dart';

@freezed
class CountryEvent with _$CountryEvent {
  const factory CountryEvent.load({required Filter filter}) = _Load;
  const factory CountryEvent.changeItem({required Datacountry item}) =
      _ChangeItem;
}
