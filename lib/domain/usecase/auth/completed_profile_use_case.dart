import 'dart:io';

import 'package:commmercial_directory_seller/data/auth_data_source/auth_data_source.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_primary_seller.dart';
import 'package:dio/dio.dart';

import '../../../app/locator.dart';
import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../entities/profile_entity/profile_response.dart';

class CompleteProfileUseCase implements UseCase<String, RegisterPrimarySeller> {
  CompleteProfileUseCase({
    required this.dataSource,
    required this.localDataSource,
  });

  final AuthRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  @override
  Future<Result<String, Exceptions>> call(RegisterPrimarySeller params) async {
    try {
      print(params.cityId);
      var body = FormData.fromMap({
        // "email": params.email,
        // "password": params.password,
        //"password_confirmation": params.passwordConfirmation,
        "firstname": params.firstname,
        "lastname": params.lastname,
        "phone": params.phone,
        "commercial_activity_name": params.nameCommercial,
        "fcm_token": params.fcmToken,
        "commercial_activity_phone": params.phoneCommercial,
        "commercial_activity_description": params.description,
        //"gender": "Male",
        "country_id": params.countryId,
        "city_id": params.cityId,
        "region_id": params.regionId,
        "country": params.country,
        "city": params.city,
        "region": params.region,
        "type": params.type,
        "civil_card": await MultipartFile.fromFile(params.civilCard![0]),
        "activity_id": params.activityId,
        "sub_sector_id": params.subSectors,
        "sector_id": params.sectorId,
      });

      params.serviceId!.asMap().forEach((k, element) {
        body.fields.add(MapEntry(
          "services_id[$k]",
          element.id.toString(),
        ));
      });
      if (params.sectionId != null) {
        params.sectionId!.asMap().forEach((k, element) {
          body.fields.add(MapEntry(
            "sections_id[$k]",
            element.id.toString(),
          ));
        });
      }

      if (params.type == "Company") {
        body.files.add(MapEntry("commercial_license",
            await MultipartFile.fromFile(params.lisence!)));
        body.files.add(MapEntry("signature_approval",
            await MultipartFile.fromFile(params.singnature!)));
      }

      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final result = await dataSource.completeProfile(
        language: keyLanguage,
        auth: token,
        completeProfile: body,
      );

      final profile = result.data["seller"];
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
              commerialActivityDescription: profile["commercial_activity_description"],
              commerialActivityName: profile["commercial_activity_name"],
              commerialActivityPhone: profile["commercial_activity_phone"],
              active: profile["active"],
              status: profile["status"],
              country: profile['country'],
              city: profile['city'],
              region: profile['region'],
              completed: profile['completed'],
          ));
      await localDataSource.setValue(
          LocalDataKeys.userType, UserType.authenticated);
      return const Result.success();
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
        return const Result.failure(error: Exceptions.network("there_is_no_internet_connection"));
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (ex) {
      return Result.failure(error: Exceptions.other(ex.message));
    } catch (e) {
      print(e);

      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}
