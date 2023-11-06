import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/domain/repositories/offer_repository.dart';

class GetOfferUpdatedDetailsUseCase extends UseCase<OfferDetailsRasponse, ModelID> {
  final OfferRepository offerRepository;

  GetOfferUpdatedDetailsUseCase({required this.offerRepository});
  @override
  Future<Result<OfferDetailsRasponse, Exceptions>> call(
    ModelID params,
  ) async {
    return offerRepository.fetchOfferUpdateDetails(params);
  }
}