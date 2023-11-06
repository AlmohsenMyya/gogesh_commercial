part of 'ads_bloc.dart';

@freezed
class AdsEvent with _$AdsEvent {

const factory AdsEvent.load({required Filter filter})= _load;
}