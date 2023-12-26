import 'dart:io';

import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/data/offer_datat_source/offer_remote_data_source.dart';
import 'package:commmercial_directory_seller/data/remote_data_source.dart/remote_data_source.dart';
import 'package:commmercial_directory_seller/domain/repositories/offer_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/privacy_policy_repository.dart';
import 'package:commmercial_directory_seller/presentaation/privacy_policy/screen/privacy_policy_screen.dart';
import 'package:dio/dio.dart';

import '../../core/excptions/exceptions.dart';

class PrivacyRepositoryImpl implements PrivacyRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  PrivacyRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<String, Exceptions>> fetchPrivacy() async {
    try {
      final keyLanguage = _localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${_localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await _remoteDataSource.getPrivacypolicy(
        language: keyLanguage,
      );
      if (res.response.statusCode!.isOk) {
        return Result.success(data: res.response.data['data']);
      }
    } on DioException catch (ex) {
      _localDataSource.setValue(
          LocalDataKeys.privacyPolicy, " السلام عليكم ورحمة الله تعالى وبركاته أخ ماجد كيف الامور تمام");
      var read = _localDataSource.getValue(LocalDataKeys.privacyPolicy);
      return Result.success(data: read);

      // if (ex.error is SocketException) {
      //   return Result.success(data: read);
      // }
    }
    // TODO: implement fetchOffers
    throw UnimplementedError();
  }
  // TODO: implement fetchPrivcy
}

extension HTTPRESPONSE on int {
  bool get isOk => this == 200;
}
