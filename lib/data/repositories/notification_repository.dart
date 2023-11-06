import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/paginated/notificaton_paginated/notification_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/data/remote_data_source.dart/remote_data_source.dart';
import 'package:commmercial_directory_seller/domain/repositories/notification_repository.dart';
import 'package:dio/dio.dart';

class NotificationRepositoryImpl implements NoticationRepository {
 final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  NotificationRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Result<NotificationPaginated, Exceptions>> fetchNotification(
      Map<String, dynamic> filter) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await remoteDataSource.getNotification(
        auth: token,
        language: keyLanguage,
        queries: filter,
      );
      // AdsPaginated ads = localDataSource.getValue(LocalDataKeys.ads);
      // ads.data.addAll(res.data.data);
      // ads.meta = res.data.meta;
      // await localDataSource.setValue(LocalDataKeys.ads, ads);

      if (res.response.statusCode!.isOk) {
        return Result.success(data: res.data);
      }
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        // AdsPaginated ads = localDataSource.getValue(LocalDataKeys.ads);

        // return Result.success(data: ads);
        return const Result.failure(error: Exceptions.network('message'));
      }
      return const Result.failure(error: Exceptions.other(""));
    }
    return const Result.failure(error: Exceptions.other(""));
  }
}
extension HTTPRESPONSE on int {
  bool get isOk => this == 200;
}