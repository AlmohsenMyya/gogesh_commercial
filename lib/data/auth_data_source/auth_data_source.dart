import 'dart:async';
import 'dart:io';

import 'package:commmercial_directory_seller/core/paginated/standar_paginated/standar_paginated.dart';
import 'package:commmercial_directory_seller/domain/entities/location_entity/city_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/location_entity/country_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/location_entity/region_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/request/email/confirm_email_request.dart';
import 'package:commmercial_directory_seller/domain/request/email/resend_email_confirmation_code.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'package:flutter/foundation.dart';
// import 'package:retrofit/http.dart';
// import 'package:retrofit/dio.dart';
import '../../domain/request/auth/forget_password_request.dart';
import '../../domain/request/auth/login/login_request.dart';
import '../../domain/request/auth/password_check_request.dart';
import '../../domain/request/auth/register/register_primary_seller.dart';
import '../../domain/request/auth/register/register_social_request.dart';
import '../../domain/request/auth/reset_password_request.dart';
part 'auth_data_source.g.dart';

@RestApi(
  baseUrl: "https://progressmaxonline.com/api/v1",
  parser: Parser.FlutterCompute,
)
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) =
      _AuthRemoteDataSource;

  @GET("{path}")
  Future<HttpResponse<StandarPaginated>> getCountry({
    @Header("Accept-Language") required String language,
     @Queries() required Map<String, dynamic> queries,
    @Path() required String path,
  });

  @GET("{path}")
  Future<HttpResponse<StandarPaginated>> getCity({
    @Header("Accept-Language") required String language,
     @Queries() required Map<String, dynamic> queries,
    @Path() required String path,
  });

  // @GET("/regions/")
  // Future<HttpResponse<RegionEntity>> getRegion({
  //   @Header("Accept-Language") required String language,
  //   @Queries() required Map<String, dynamic> queries,
  // });
  

  @POST('/auth/seller/complete-profile')
  Future<HttpResponse> completeProfile({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Body() required FormData completeProfile,
  });
  @POST('/auth/seller/register')
  Future<HttpResponse> registerPrimary({
    @Header("Accept-Language") required String language,
    @Body() required FormData registerPrimaryRequest,
  });
  @POST('/auth/userCommercial/login')
  Future<HttpResponse> loginAssistant({
    @Header("Accept-Language") required String language,
    @Body() required LoginRequest loginRequest,
  });
  @POST('/auth/seller/login')
  Future<HttpResponse> login({
    @Header("Accept-Language") required String language,
    @Body() required LoginRequest loginRequest,
  });
  @POST('/auth/seller/forgot-password')
  Future<HttpResponse> forgetpassword({
    @Header("Accept-Language") required String language,
    @Body() required ForgetPasswordRequest forgetPasswordRequest,
  });

  @POST('/auth/password/check')
  Future<HttpResponse> passwordcheck({
    @Header("Accept-Language") required String language,
    @Body() required PasswordCheckRequest code,
  });
  @POST('/email/verify')
  Future<HttpResponse> confirmEmail({
    @Body() required ConfirmEmailRequest confirmEmailRequest,
  });

  @POST('/email/resend')
  Future<HttpResponse> resendEmailConfirmationCode({
    @Body() required ResendEmailConfirmationCode resendEmailConfirmationCode,
  });
  @POST('/auth/password/seller/reset')
  Future<HttpResponse> resetpassword({
    @Header("Accept-Language") required String language,
    @Body() required ResetPasswordRequest resetPasswordRequest,
  });
  @POST('/auth/seller/callback')
  Future<HttpResponse> registerLoginGoogle({
    @Body() required RegisterSocialRequest registerGoogleRequest,
  });
}

FutureOr<StandarPaginated> deserializeStandarPaginated(
        Map<String, dynamic> json) =>
    StandarPaginated.fromJson(json);
StandarResponse deserializeStandarResponse(Map<String, dynamic> json) =>
    StandarResponse.fromJson(json);
CountryEntity deserializeCountryEntity(Map<String, dynamic> json) =>
    CountryEntity.fromJson(json);
CityEntity deserializeCityEntity(Map<String, dynamic> json) =>
    CityEntity.fromJson(json);

RegionEntity deserializeRegionEntity(Map<String, dynamic> json) =>
    RegionEntity.fromJson(json);
