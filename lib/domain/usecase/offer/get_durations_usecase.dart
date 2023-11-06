import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:dio/dio.dart';

import '../../../core/use_case/use_case.dart';

import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../../data/offer_datat_source/offer_remote_data_source.dart';
import '../../entities/durations_entity/durations_response.dart';

class GetDurationsUseCase extends UseCase<DurationsResponse, NoParams> {
  final OfferRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  GetDurationsUseCase({required this.dataSource, required this.localDataSource});

  @override
  Future<Result<DurationsResponse, Exceptions>> call(NoParams params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result =
          await dataSource.getDurations(auth: token, language: keyLanguage);

      return Result.success(data: result.data);
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
                error: Exceptions.emailInvalude(ex.response!.data["message"]));
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
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}
