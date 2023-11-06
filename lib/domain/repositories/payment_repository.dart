import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/domain/entities/pyment_entity/payment_response.dart';
import 'package:commmercial_directory_seller/domain/request/payment/payment_request.dart';

import '../../core/excptions/exceptions.dart';

abstract class PaymentRepository {
  Future<Result<PaymentResponse, Exceptions>> addPayment(PaymentRequest params);
}