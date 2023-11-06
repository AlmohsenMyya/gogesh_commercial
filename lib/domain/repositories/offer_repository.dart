import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';

import '../../core/excptions/exceptions.dart';

abstract class OfferRepository {
  Future<Result<OfferPaginated, Exceptions>> fetchOffers(
      Map<String, dynamic> filter);
  Future<Result<OfferDetailsRasponse, Exceptions>> fetchOffersDetails(
      ModelID params);
  Future<Result<OfferDetailsRasponse, Exceptions>> fetchOfferUpdateDetails(
      ModelID params);
}
