part of 'offer_bloc.dart';

@freezed
class OfferEvent with _$OfferEvent {
  const factory OfferEvent.load({required Filter filter}) = _Load;
}
