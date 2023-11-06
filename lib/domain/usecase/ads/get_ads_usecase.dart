import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/ads_paginated/ads_paginated.dart';
import 'package:commmercial_directory_seller/domain/repositories/ads_repository.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';

class GetAdsUseCase extends UseCase<AdsPaginated, Filter> {
  final AdsRepository adsRepository;

  GetAdsUseCase({required this.adsRepository});
  @override
  Future<Result<AdsPaginated, Exceptions>> call(
    Filter params,
  ) async {
    return adsRepository.fetchAds(params.toJson());
  }
}
