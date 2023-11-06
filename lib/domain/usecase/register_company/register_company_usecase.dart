import 'dart:convert';
import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
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

class RegisterCompanyUseCase extends UseCase<String, RegisterPartTwoSeller> {
  final RegisterRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  RegisterCompanyUseCase(
      {required this.dataSource, required this.localDataSource});

  @override
  Future<Result<String, Exceptions>> call(
    RegisterPartTwoSeller params,
  ) async {
    try {
      //final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final body = FormData.fromMap({
        "delivery_price": params.price,
        "logo": await MultipartFile.fromFile(params.logo ?? ''),
        // "address": params.address,
        // "longutide": params.longutide,
        // "latitude": params.latitude,
      });

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
      final result = await dataSource.registerCompany(
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
          error: Exceptions.other(ex.response?.data));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}
