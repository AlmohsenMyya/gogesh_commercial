import 'dart:io';
import 'dart:typed_data';

import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
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

class GetOfferUseCase extends UseCase<OfferPaginated, Filter> {
  final OfferRepository offerRepository;

  GetOfferUseCase({required this.offerRepository});
  @override
  Future<Result<OfferPaginated, Exceptions>> call(
    Filter params,
  ) async {
    return offerRepository.fetchOffers(params.toJson());

   
  }
}
 //   try {
    //     final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
    //     final token =
    //         'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

    //     final result =
    //         await dataSource.getOffers(auth: token, language: keyLanguage);

    //     return Result.success(data: result.data);
    //   } on DioException catch (ex) {
    //     switch (ex.response?.statusCode ?? 0) {
    //       case 401:
    //         {
    //           return Result.failure(
    //               error: Exceptions.other(ex.response?.data["message"]));
    //         }
    //       case 422:
    //         {
    //           return Result.failure(
    //               error: Exceptions.other(ex.response?.data["message"]));
    //         }
    //     }
    //     if (ex.error is SocketException) {
    //       return const Result.failure(error: Exceptions.network());
    //     }

    //     return Result.failure(
    //         error: Exceptions.other(ex.response?.data["message"]));
    //   } on HttpException catch (e) {
    //     return Result.failure(error: Exceptions.other(e.message));
    //   } catch (e) {
    //     print('object');
    //     print(e.toString());
    //     return const Result.failure(
    //         error: Exceptions.other("something_went_wrong"));
    //   }