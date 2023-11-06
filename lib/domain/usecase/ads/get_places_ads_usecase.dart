import 'dart:io';
import 'dart:typed_data';

import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/ads_paginated/ads_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/domain/entities/places_entity/places_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/ads_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/offer_repository.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/register_company_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../app/locator.dart';
import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../core/utils/model_id.dart';
import '../../../data/auth_data_source/auth_data_source.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../../data/offer_datat_source/offer_remote_data_source.dart';
import '../../request/auth/login/login_request.dart';
import '../../request/offers/offer_request.dart';

class GetPlacesUseCase extends UseCase<PlacesResponse, NoParams> {
  final AdsRepository adsRepository;

  GetPlacesUseCase({required this.adsRepository});
  @override
  Future<Result<PlacesResponse, Exceptions>> call(
    NoParams params,
  ) async {
    return adsRepository.fetchPlaces();

   
  }
}