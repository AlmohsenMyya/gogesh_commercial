import 'dart:async';

import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/standar_paginated/standar_paginated.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/social_account_response.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/work_days_response.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/login/login_request.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_social_account.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_work_days_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter/foundation.dart';

part 'register_remote_data_source.g.dart';

@RestApi(
  baseUrl: "https://alphadev39.com/commercial/api/v1",
  parser: Parser.FlutterCompute,
)
abstract class RegisterRemoteDataSource {
  factory RegisterRemoteDataSource(Dio dio, {String baseUrl}) =
      _RegisterRemoteDataSource;

  @GET("/days")
  Future<HttpResponse<StandarResponse>> getDays({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
  @GET("/seller-details")
  Future<HttpResponse<CompanyResponse>> detailsCompany({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
  @GET("/commercialActivity/workDays/show")
  Future<HttpResponse<WorkDaysResponse>> getWorkDays({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
  @GET("/commercialActivity/socialAccount/show")
  Future<HttpResponse<SocialAccountResponse>> getSocialAccount({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
  @GET("/seller/users")
  Future<HttpResponse<AssistantResponse>> getAssistant({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
  @POST("/seller/delete-users/{id}")
  Future<HttpResponse> deleteAssistant(
      {@Header("Accept-Language") required String language,
      @Header("Authorization") required String auth,
      @Path() required int id,
      @Body() required FormData body
       });
  @POST('/commercialActivity/workDays/update')
  Future<HttpResponse> editWorkDays({
    @Header("Authorization") required String auth,
    @Body() required EditWorkDaysRequest body,
  });

  @POST('/commercialActivity/socialAccount/update')
  Future<HttpResponse> editSocialAccount({
    @Header("Authorization") required String auth,
    @Body() required EditSocialAccounttRequest body,
  });
  @POST('/commercial-activity-update')
  Future<HttpResponse> editCompany({
    @Header("Authorization") required String auth,
    @Body() required FormData body,
  });
  @POST('/auth/seller/upgrade')
  Future<HttpResponse> registerCompany({
    @Header("Authorization") required String auth,
    @Body() required FormData body,
  });
  @POST('/auth/userCommercial/register')
  Future<HttpResponse> addAssistant({
    @Header("Authorization") required String auth,
    @Body() required FormData body,
  });
}

FutureOr<CompanyResponse> deserializeCompanyResponse(
        Map<String, dynamic> json) =>
    CompanyResponse.fromJson(json);
FutureOr<AssistantResponse> deserializeAssistantResponse(
        Map<String, dynamic> json) =>
    AssistantResponse.fromJson(json);
FutureOr<StandarPaginated> deserializeStandarPaginated(
        Map<String, dynamic> json) =>
    StandarPaginated.fromJson(json);
StandarResponse deserializeStandarResponse(Map<String, dynamic> json) =>
    StandarResponse.fromJson(json);
WorkDaysResponse deserializeWorkDaysResponse(Map<String, dynamic> json) =>
    WorkDaysResponse.fromJson(json);
SocialAccountResponse deserializeSocialAccountResponse(
        Map<String, dynamic> json) =>
    SocialAccountResponse.fromJson(json);
