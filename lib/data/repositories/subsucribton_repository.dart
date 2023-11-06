import 'dart:io';
import 'dart:math';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/data/remote_data_source.dart/remote_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/subscription_entity/subscription_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/subscription_repository.dart';
import 'package:dio/dio.dart';

class SubscriptionResponseImpl implements SubscrptionRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  SubscriptionResponseImpl(
      {required this.remoteDataSource, required this.localDataSource});
  @override
  Future<Result<SubscriptionResponse, Exceptions>>
      fetchPackageSubscription() async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result = await remoteDataSource.getPackageSubscrption(
        language: keyLanguage,
        auth: token,
      );

      await localDataSource.setValue(LocalDataKeys.package, result.data);

      return Result.success(data: result.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        SubscriptionResponse packageLocal =
            localDataSource.getValue(LocalDataKeys.package);

        return Result.success(data: packageLocal);
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }

  @override
  Future<Result<InformationResponse, Exceptions>> fetchInformationSubscribtion() async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result = await remoteDataSource.getInformationSubscribtion(
        language: keyLanguage,
        auth: token,
      );

      await localDataSource.setValue(LocalDataKeys.infoamationPackage, result.data.information);

      return Result.success(data: result.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        var packageLocal = localDataSource.getValue(LocalDataKeys.infoamationPackage);

        return Result.success(
            data: InformationResponse(
          information: packageLocal,
        ));
      }

      return Result.failure(error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      print(e);
      return const Result.failure(error: Exceptions.other("something_went_wrong"));
    }
  }
}
