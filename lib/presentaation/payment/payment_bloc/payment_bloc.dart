import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/domain/entities/pyment_entity/payment_response.dart';
import 'package:commmercial_directory_seller/domain/request/payment/payment_request.dart';
import 'package:commmercial_directory_seller/domain/usecase/payment/add_payment_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_event.dart';
part 'payment_state.dart';
part 'payment_bloc.freezed.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final AddPaymentUseCase addPaymentUseCase;
  PaymentBloc({required this.addPaymentUseCase}) : super(const _Initial()) {
    on<PaymentEvent>(_mapEventToState);
  }
  FutureOr _mapEventToState(PaymentEvent event, Emitter<PaymentState> emit) {
    return event.map(
      addPayment: (value) async {
        emit(const PaymentState.loading());

        var result = await addPaymentUseCase(value.request);
        return emit(result.when(
            failure: (error) => const PaymentState.initial(),
            success: (s) => PaymentState.succes(
                  response: s!,
                )));
      },
    );
  }
}
