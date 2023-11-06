import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/data/profile_data_source/profile_remote_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/privacy_policy_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/profile_repository.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_primary_seller.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_email_request.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_password_request.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:string_validator/string_validator.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  ProfileRepositoryImpl(
      {required this.dataSource, required this.localDataSource});
  @override
  Future<Result<ProfileResponse, Exceptions>> fetchProfile() async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final role = localDataSource.getValue(LocalDataKeys.role);
      final result = await dataSource.getProfile(
          auth: token,
          language: keyLanguage,
          path: role == TypeSeller.admin.name
              ? "/seller/account"
              : "/userCommercial/profile");
      await localDataSource.setValue<ProfileEntity>(
          LocalDataKeys.profile,
          ProfileEntity(
            id: result.data.data.id,
            image: result.data.data.image,
            firstName: result.data.data.firstName,
            createdAt: result.data.data.createdAt,
            lastName: result.data.data.lastName,
            email: result.data.data.email,
            phone: result.data.data.phone,
            status: result.data.data.status,
            country: 'country',
            city: 'city',
            region: 'region',
            completed: true,
          ));
      if (role == TypeSeller.admin.name) {
        await localDataSource.setValue(LocalDataKeys.profile, result.data.data);
      }

      return Result.success(data: result.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        ProfileEntity profile = localDataSource.getValue(LocalDataKeys.profile);

        return Result.success(
          data: ProfileResponse(data: profile),
        );
      }
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
    return const Result.failure(
        error: Exceptions.other("something_went_wrong"));
  }

  @override
  Future<Result<String, Exceptions>> editProfile(
      EditProfileRequest params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      var body = FormData.fromMap({
        "firstname": params.firstname,
        "lastname": params.lastname,
        "phone": params.phone,
        "commercial_activity_name": params.nameCommercial,
        "commercial_activity_phone": params.phoneCommercial,
        "commercial_activity_description": params.description,
        "country_id": params.countryId,
        "city_id": params.cityId,
        "region_id": params.regionId,
        "country": params.country,
        "city": params.city,
        "region": params.region,
        "type": params.type,
        "civil_card": !isURL(params.civilCard![0])
            ? await MultipartFile.fromFile(params.civilCard![0])
            : null,
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
        if (isURL(params.lisence)) {
          body.fields.add(const MapEntry(
            "commercial_register",
            '',
          ));
        }
        if (!isURL(params.lisence)) {
          body.files.add(MapEntry("commercial_register",
              await MultipartFile.fromFile(params.lisence!)));
        }
        if (isURL(params.singnature)) {
          body.fields.add(const MapEntry(
            "commercial_signature",
            '',
          ));
        }
        if (!isURL(params.singnature)) {
          body.files.add(MapEntry("commercial_signature",
              await MultipartFile.fromFile(params.singnature!)));
        }
      }

      final result = await dataSource.updateProfile(
          auth: token, language: keyLanguage, body: body);
      final profile = result.data["data"];
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
              active: profile["active"],
              status: profile["status"],
              country: profile['country'],
              city: profile['city'],
              region: profile['region'],
              completed: profile['completed']));

      return const Result.success(data: '');
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }
      return const Result.failure(error: Exceptions.other("data"));
    }
  }

  @override
  Future<Result<ProfileResponse, Exceptions>> getdetailsProfile() async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result = await dataSource.getdetailsProfile(
        auth: token,
        language: keyLanguage,
      );
      return Result.success(data: result.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }
      return const Result.failure(error: Exceptions.other("data"));
    }
  }

  @override
  Future<Result<String, Exceptions>> changePassword(
      EditPasswordRequest params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result = await dataSource.changePassword(
          auth: token, language: keyLanguage, body: params);
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
  Future<Result<String, Exceptions>> changeEmail(
      EditEmailRequest params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      ProfileEntity? user = localDataSource.getValue(LocalDataKeys.profile);
      user?.email = params.email;
      await localDataSource.setValue(LocalDataKeys.profile, user);
      final result = await dataSource.changeEmail(
          auth: token, language: keyLanguage, body: params);
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
}

extension HTTPRESPONSE on int {
  bool get isOk => this == 200;
}
