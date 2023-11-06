import 'dart:io';

import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/register_company_usecase.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:dio/dio.dart';

import '../../../app/locator.dart';
import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../core/utils/model_id.dart';
import '../../../data/auth_data_source/auth_data_source.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../request/auth/login/login_request.dart';

class LoginAssistantUseCase extends UseCase<bool, LoginRequest> {
  final AuthRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  LoginAssistantUseCase(
      {required this.dataSource, required this.localDataSource});
  @override
  Future<Result<bool, Exceptions>> call(
    LoginRequest params,
  ) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      print(params);
      print(keyLanguage);
      final result = await dataSource.loginAssistant(
          loginRequest: params, language: keyLanguage);
      final profile = result.data["user"];
      await localDataSource.setValue<ProfileEntity>(
          LocalDataKeys.profile,
          ProfileEntity(
            id: profile["id"],
            image: profile["image"],
            firstName: profile["first_name"],
            createdAt: profile["created_at"],
            lastName: profile["last_name"],
            email: profile["email"],
            phone: profile["phone"],
            status: profile["status"],
            country: profile['country'],
            city: profile['city'],
            region: profile['region'],
           
            completed:true,
          ));
      await localDataSource.setValue(
          LocalDataKeys.accessToken, result.data['token']);

      await localDataSource.setValue(
          LocalDataKeys.userType, UserType.authenticated);

      return Result.success(data: profile["commerialActivity"]);
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
      print('object');
      print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}
