import 'dart:io';

import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/data/offer_datat_source/offer_remote_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/domain/repositories/offer_repository.dart';
import 'package:commmercial_directory_seller/domain/request/offers/offer_request.dart';
import 'package:dio/dio.dart';

import '../../core/excptions/exceptions.dart';

class OfferRepositoryImpl implements OfferRepository {
  final OfferRemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  OfferRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<OfferPaginated, Exceptions>> fetchOffers(
      Map<String, dynamic> filter) async {
    try {
      final keyLanguage = _localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${_localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await _remoteDataSource.getOffers(
        auth: token,
        language: keyLanguage,
        queries: filter,
      );
      // OfferPaginated offer = _localDataSource.getValue(LocalDataKeys.offer);
      // offer.data.addAll(res.data.data);
      // offer.meta = res.data.meta;

      // await _localDataSource.setValue(LocalDataKeys.offer, offer);

      if (res.response.statusCode!.isOk) {
        return Result.success(data: res.data);
      }
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        // OfferPaginated offer = _localDataSource.getValue(LocalDataKeys.offer);
        return const Result.failure(error: Exceptions.network('message'));

        //  return Result.success(data: offer);
      }
      return const Result.failure(error: Exceptions.other("data"));
    }
    return const Result.failure(error: Exceptions.other("data"));
  }

  @override
  Future<Result<OfferDetailsRasponse, Exceptions>> fetchOffersDetails(
      ModelID params) async {
    try {
      final keyLanguage = _localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${_localDataSource.getValue(LocalDataKeys.accessToken)}';
      print(token);
      final res = await _remoteDataSource.getOffersDetails(
        auth: token,
        language: keyLanguage,
        id: params.id,
        path: params.path!
      );
      if (res.response.statusCode!.isOk) {
        return Result.success(data: res.data);
      }
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }
      return const Result.failure(error: Exceptions.other("data"));
    }
    return const Result.failure(error: Exceptions.other("data"));
  }

  @override
  Future<Result<OfferDetailsRasponse, Exceptions>> fetchOfferUpdateDetails(
      ModelID params) async {
    try {
      final keyLanguage = _localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${_localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await _remoteDataSource.getOffersUpdatedDetails(
        auth: token,
        language: keyLanguage,
        id: params.id,
      );
      if (res.response.statusCode!.isOk) {
        return Result.success(data: res.data);
      }
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }
      return const Result.failure(error: Exceptions.other("data"));
    }
    return const Result.failure(error: Exceptions.other("data"));
  }
}

extension HTTPRESPONSE on int {
  bool get isOk => this == 200;
}
