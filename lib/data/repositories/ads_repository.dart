import 'dart:io';

import 'package:commmercial_directory_seller/core/paginated/ads_paginated/ads_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/data/ads_data_source/ads_remote_data_source.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/data/offer_datat_source/offer_remote_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/places_entity/places_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/ads_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/offer_repository.dart';
import 'package:commmercial_directory_seller/domain/request/ads/ads_request.dart';
import 'package:dio/dio.dart';

import '../../core/excptions/exceptions.dart';

class AdsRepositoryImpl implements AdsRepository {
  final AdsRemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  AdsRepositoryImpl(this._remoteDataSource, this._localDataSource);
  @override
  Future<Result<AdsPaginated, Exceptions>> fetchAds(
      Map<String, dynamic> filter) async {
    try {
      final keyLanguage = _localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${_localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await _remoteDataSource.getAds(
        auth: token,
        language: keyLanguage,
        queries: filter,
      );
      // AdsPaginated ads = _localDataSource.getValue(LocalDataKeys.ads);
      // ads.data.addAll(res.data.data);
      // ads.meta = res.data.meta;
      // await _localDataSource.setValue(LocalDataKeys.ads, ads);

      if (res.response.statusCode!.isOk) {
        return Result.success(data: res.data);
      }
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        // AdsPaginated ads = _localDataSource.getValue(LocalDataKeys.ads);

        // return Result.success(data: ads);
        return const Result.failure(error: Exceptions.network('message'));
      }
      return const Result.failure(error: Exceptions.other(""));
    }
    return const Result.failure(error: Exceptions.other(""));
  }

  @override
  Future<Result<String, Exceptions>> addAds(AdsRequest params) async {
    try {
      final keyLanguage = _localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${_localDataSource.getValue(LocalDataKeys.accessToken)}';
      InformationEntity? information =
          _localDataSource.getValue(LocalDataKeys.infoamationPackage);
      final body = FormData.fromMap({
        "title": params.title,
        "description": params.description,
        "place": params.place,
        "price": params.price,
        "duration": params.duration,
        "total": params.total,
        "date_start": params.dateStart,
        "images": await MultipartFile.fromFile(params.images),
      });

      final result = await _remoteDataSource.addAds(
          auth: token, body: body, language: keyLanguage);

      if (information!.maxFreeAds != 0 &&
          params.place != '' &&
          params.place != '') {
        await _localDataSource.setValue(LocalDataKeys.infoamationPackage,
            information.copyWith(maxFreeAds: information.maxFreeAds! - 1));
      }
      if (information.maxAdsPerNotification != 0 && params.place == '') {
        await _localDataSource.setValue(
            LocalDataKeys.infoamationPackage,
            information.copyWith(
                maxAdsPerNotification: information.maxAdsPerNotification! - 1));
      }
      if (information.maxAdsViaSectorBanner != 0 && params.place == '') {
        await _localDataSource.setValue(
            LocalDataKeys.infoamationPackage,
            information.copyWith(
                maxAdsViaSectorBanner: information.maxAdsViaSectorBanner! - 1));
      }

      return const Result.success(data: '');
    } on DioException catch (ex) {
      switch (ex.response?.statusCode ?? 0) {
        case 401:
          {
            return Result.failure(
                error:
                    Exceptions.passwordInvalude(ex.response!.data["message"]));
          }
        case 422:
          {
            return Result.failure(
                error: Exceptions.other(ex.response?.data["message"]));
          }
      }
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      print('object');
      print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }

  @override
  Future<Result<PlacesResponse, Exceptions>> fetchPlaces() async {
    try {
      final keyLanguage = _localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${_localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result =
          await _remoteDataSource.getPlaces(auth: token, language: keyLanguage);
      InformationEntity? information =
          _localDataSource.getValue(LocalDataKeys.infoamationPackage);
      if (information!.maxAdsPerNotification == null) {
        result.data.data
            .removeWhere((element) => element.place == Places.Notification);
      }
      if (information.maxAdsViaSectorBanner == null) {
        result.data.data
            .removeWhere((element) => element.place == Places.Sectors_Baner);
      }
      return Result.success(data: result.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      print('object');
      print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }

  @override
  Future<Result<AdsDetailsRasponse, Exceptions>> fetchAdsDetails(
      ModelID params) async {
    try {
      final keyLanguage = _localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${_localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result = await _remoteDataSource.getAdsDetails(
          id: params.id,
          path: params.path!,
          auth: token,
          language: keyLanguage);

      return Result.success(data: result.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      print('object');
      print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}

extension HTTPRESPONSE on int {
  bool get isOk => this == 200;
}
