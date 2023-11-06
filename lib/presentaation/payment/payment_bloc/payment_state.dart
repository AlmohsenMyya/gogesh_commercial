part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = _loading;

  const factory PaymentState.succes({required PaymentResponse response}) =
      _succes;
}
