import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/domain/repositories/offer_repository.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../core/utils/model_id.dart';

class GetOfferDetailsUseCase extends UseCase<OfferDetailsRasponse, ModelID> {
  final OfferRepository offerRepository;

  GetOfferDetailsUseCase({required this.offerRepository});
  @override
  Future<Result<OfferDetailsRasponse, Exceptions>> call(
    ModelID params,
  ) async {
    return offerRepository.fetchOffersDetails(params);
  }
}
