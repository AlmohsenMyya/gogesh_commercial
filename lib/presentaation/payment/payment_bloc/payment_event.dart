part of 'payment_bloc.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
const factory PaymentEvent.addPayment({required PaymentRequest request}) = _addPayment;
}