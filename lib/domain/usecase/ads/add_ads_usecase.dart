import 'package:commmercial_directory_seller/domain/repositories/ads_repository.dart';
import 'package:commmercial_directory_seller/domain/request/ads/ads_request.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';

class AddAdsUseCase extends UseCase<String, AdsRequest> {
  final AdsRepository adsRepository;

  AddAdsUseCase({required this.adsRepository});
  @override
  Future<Result<String, Exceptions>> call(
    AdsRequest params,
  ) async {
    return adsRepository.addAds(params);
  }
}
