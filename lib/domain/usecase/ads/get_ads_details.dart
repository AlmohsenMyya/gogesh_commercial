import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/paginated/ads_paginated/ads_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:commmercial_directory_seller/domain/repositories/ads_repository.dart';

class GetAdsDetailsUseCase extends UseCase<AdsDetailsRasponse, ModelID> {
  final AdsRepository adsRepository;

  GetAdsDetailsUseCase({required this.adsRepository});
  @override
  Future<Result<AdsDetailsRasponse, Exceptions>> call(
    ModelID params,
  ) async {
    return adsRepository.fetchAdsDetails(params);
  }
}
