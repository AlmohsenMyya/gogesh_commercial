import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/data/profile_data_source/profile_remote_data_source.dart';
import 'package:commmercial_directory_seller/data/register_company_data_source/register_remote_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/social_account_response.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/work_days_response.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:commmercial_directory_seller/domain/request/company/add_assistant.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_social_account.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_work_days_request.dart';
import 'package:commmercial_directory_seller/domain/request/company/update_activity_request.dart';
import 'package:dio/dio.dart';
import 'package:string_validator/string_validator.dart';

import '../../app/locator.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final RegisterRemoteDataSource dataSource;
  final LocalDataSource localDataSource;
  CompanyRepositoryImpl(this.dataSource, this.localDataSource);

  @override
  Future<Result<CompanyResponse, Exceptions>> getDetailscompany() async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await dataSource.detailsCompany(
        auth: token,
        language: keyLanguage,
      );
      await localDataSource.setValue(LocalDataKeys.activity, res.data.data);
      print(
          "---------------------------${sl<LocalDataSource>().getValue(LocalDataKeys.activity)}");
      return Result.success(data: res.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        CompanyEntity company =
            localDataSource.getValue(LocalDataKeys.activity);
        return Result.success(
          data: CompanyResponse(
            data: company,
          ),
        );

        // return const Result.failure(
        //     error: Exceptions.network("connect_to_internet_and_try_again"));
      }
      return const Result.failure(
          error: Exceptions.other("something_went_error"));
    }
  }

  @override
  Future<Result<String, Exceptions>> addAssistant(
      AddAssistantRequest params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await dataSource.addAssistant(
          auth: token,
          body: params.image == null
              ? FormData.fromMap(
                  {
                    "firstname": params.firstname,
                    "lastname": params.lastname,
                    "phone": params.phone,
                    "email": params.email,
                    "password": params.password,
                    "password_confirmation": params.passwordConfirmation,
                    "fcm_token": params.fcmToken
                  },
                )
              : FormData.fromMap(
                  {
                    "firstname": params.firstname,
                    "lastname": params.lastname,
                    "phone": params.phone,
                    "email": params.email,
                    "password": params.password,
                    "password_confirmation": params.passwordConfirmation,
                    "image": await MultipartFile.fromFile(
                      params.image!,
                    ),
                    "fcm_token": params.fcmToken
                  },
                ));

      return const Result.success(data: 'rr');
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(
            error: Exceptions.network("connect_to_internet_and_try_again"));
      }
      return const Result.failure(
          error: Exceptions.other("something_went_error"));
    }
  }

  @override
  Future<Result<WorkDaysResponse, Exceptions>> getWorkDays() async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await dataSource.getWorkDays(
        auth: token,
        language: keyLanguage,
      );

      return Result.success(data: res.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }
      return const Result.failure(
          error: Exceptions.other("something_went_error"));
    }
  }

  @override
  Future<Result<SocialAccountResponse, Exceptions>> getSocialAccount() async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await dataSource.getSocialAccount(
        auth: token,
        language: keyLanguage,
      );

      return Result.success(data: res.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(
            error: Exceptions.network("connect_to_internet_and_try_again"));
      }
      return const Result.failure(
          error: Exceptions.other("something_went_error"));
    }
  }

  @override
  Future<Result<String, Exceptions>> editSocialAccount(
      EditSocialAccounttRequest params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await dataSource.editSocialAccount(
        auth: token,
        body: params,
      );
      ProfileEntity? user = localDataSource.getValue(LocalDataKeys.profile);
      if (res.response.statusCode == 200) {
        user?.upgraded?.socialAccounts = params.socialAccounts;
        await localDataSource.setValue(LocalDataKeys.profile, user);
      }
      return const Result.success(data: '');
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(
            error: Exceptions.network("connect_to_internet_and_try_again"));
      }
      return const Result.failure(
          error: Exceptions.other("something_went_error"));
    }
  }

  @override
  Future<Result<String, Exceptions>> editCompany(
      RegisterPartTwoSeller params) async {
    try {
      //final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final body = FormData.fromMap({
        "delivery_price": params.price,
      });
      if (!isURL(params.logo)) {
        body.files
            .add(MapEntry("logo", await MultipartFile.fromFile(params.logo!)));
      }
      if (isURL(params.logo)) {
        body.fields.add(const MapEntry("logo", ""));
      }
      params.seasons?.asMap().forEach((key, element) {
        body.fields.add(MapEntry("seasons_id[$key]", "${element.id}"));
      });
      params.specialities?.asMap().forEach((key, element) {
        body.fields.add(MapEntry("specialities_id[$key]", "${element.id}"));
      });
      params.socialAccounts?.asMap().forEach((key, value) {
        body.fields.add(MapEntry("social_accounts[$key][name]", value.name));
        body.fields.add(MapEntry("social_accounts[$key][type]", value.type));
        body.fields.add(MapEntry("social_accounts[$key][url]", value.url));
      });

      params.workDays?.asMap().forEach((key, value) {
        body.fields.add(MapEntry("work_days[$key][day]", "${value.day}"));
        body.fields.add(MapEntry("work_days[$key][from]", value.from ?? ""));
        body.fields.add(MapEntry("work_days[$key][to]", value.to ?? ""));
      });
      final result = await dataSource.editCompany(
        auth: token,
        body: body,
      );
      ProfileEntity user = localDataSource.getValue(
        LocalDataKeys.profile,
      );
      await localDataSource.setValue<ProfileEntity>(
          LocalDataKeys.profile,
          ProfileEntity(
            country: user.country,
            image: user.image,
            city: user.city,
            region: user.region,
            id: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            phone: user.phone,
            createdAt: user.createdAt,
            status: user.status,
            completed: user.completed,
            active: user.active,
            activityId: user.activityId,
            civilCard: user.civilCard,
            commerialActivityDescription: user.commerialActivityDescription,
            commerialActivityName: user.commerialActivityName,
            commerialActivityPhone: user.commerialActivityPhone,
            lisence: user.lisence,
            sectionsId: user.sectionsId,
            sectorId: user.sectorId,
            servicesId: user.servicesId,
            subSectorId: user.subSectorId,
            signature: user.signature,
            type: user.type,
            verification: user.verification,
            upgraded: result.data["data"]["data"],
          ));

      //  await localDataSource.setValue(LocalDataKeys.activity, result.data.data);
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

  @override
  Future<Result<String, Exceptions>> editWorkDays(
      EditWorkDaysRequest params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await dataSource.editWorkDays(
        auth: token,
        body: params,
      );
      ProfileEntity? user = localDataSource.getValue(LocalDataKeys.profile);
      if (res.response.statusCode == 200) {
        user?.upgraded?.workDays = params.workDays;
        await localDataSource.setValue(LocalDataKeys.profile, user);
      }

      return const Result.success(data: '');
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(
            error: Exceptions.network("connect_to_internet_and_try_again"));
      }
      return const Result.failure(
          error: Exceptions.other("something_went_error"));
    }
  }

  @override
  Future<Result<AssistantResponse, Exceptions>> getAssistant() async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await dataSource.getAssistant(
        auth: token,
        language: keyLanguage,
      );

      return Result.success(data: res.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(
            error: Exceptions.network("connect_to_internet_and_try_again"));
      }
      return const Result.failure(
          error: Exceptions.other("something_went_error"));
    }
  }

  @override
  Future<Result<String, Exceptions>> deleteAssistant(ModelID params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await dataSource.deleteAssistant(
          auth: token,
          language: keyLanguage,
          id: params.id,
          body: FormData.fromMap({"_method": 'delete'}));

      return Result.success(data: res.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(
            error: Exceptions.network("connect_to_internet_and_try_again"));
      }
      return const Result.failure(
          error: Exceptions.other("something_went_error"));
    }
  }
}
