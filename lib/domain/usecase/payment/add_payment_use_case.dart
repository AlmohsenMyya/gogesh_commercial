import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/pyment_entity/payment_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/payment_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/privacy_policy_repository.dart';
import 'package:commmercial_directory_seller/domain/request/payment/payment_request.dart';

class AddPaymentUseCase extends UseCase<PaymentResponse, PaymentRequest> {
  final PaymentRepository paymentRepository;

  AddPaymentUseCase({required this.paymentRepository});
  @override
  Future<Result<PaymentResponse, Exceptions>> call(
    PaymentRequest params,
  ) async {
    return paymentRepository.addPayment(params);
  }
}

