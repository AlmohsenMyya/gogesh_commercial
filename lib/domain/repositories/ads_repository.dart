import 'package:commmercial_directory_seller/core/paginated/ads_paginated/ads_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/places_entity/places_response.dart';
import 'package:commmercial_directory_seller/domain/request/ads/ads_request.dart';

import '../../core/excptions/exceptions.dart';

abstract class AdsRepository {
  Future<Result<AdsPaginated, Exceptions>> fetchAds(
      Map<String, dynamic> filter);
  Future<Result<PlacesResponse, Exceptions>> fetchPlaces();

  Future<Result<String, Exceptions>> addAds(AdsRequest params);
  Future<Result<AdsDetailsRasponse, Exceptions>> fetchAdsDetails(ModelID params);
}
