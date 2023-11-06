import 'dart:convert';
import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:dio/dio.dart';

import '../../../core/use_case/use_case.dart';
import '../../../core/utils/model_id.dart';
import '../../../data/auth_data_source/auth_data_source.dart';

import 'package:retrofit/dio.dart';

import '../../../data/custom_interceptor.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../../data/register_company_data_source/register_remote_data_source.dart';

class GetdaysUseCase extends UseCase<StandarResponse, NoParams> {
  final RegisterRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  GetdaysUseCase({required this.dataSource, required this.localDataSource});

  @override
  Future<Result<StandarResponse, Exceptions>> call(NoParams params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
print(token);
      final result =
          await dataSource.getDays(auth: token, language: keyLanguage);

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
