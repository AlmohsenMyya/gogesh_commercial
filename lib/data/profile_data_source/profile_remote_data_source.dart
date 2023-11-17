import 'package:commmercial_directory_seller/domain/request/profile/edit_email_request.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_password_request.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../domain/entities/profile_entity/profile_response.dart';

part 'profile_remote_data_source.g.dart';

@RestApi(
  baseUrl: "https://api.gogesh.com/api/v1",
  parser: Parser.FlutterCompute,
)
abstract class ProfileRemoteDataSource {
  factory ProfileRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProfileRemoteDataSource;
// /seller/account
// userCommercial/profile
  @GET("{path}")
  Future<HttpResponse<ProfileResponse>> getProfile({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Path() required String path,
  });
  @GET("/seller/auth/editAccount")
  Future<HttpResponse<ProfileResponse>> getdetailsProfile({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
  @POST("/seller/auth/update")
  Future<HttpResponse> updateProfile({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Body() required FormData body,
  });
  @POST("/seller/auth/update")
  Future<HttpResponse> changePassword({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Body() required EditPasswordRequest body,
  });
  @POST("/seller/update-email")
  Future<HttpResponse> changeEmail({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Body() required EditEmailRequest body,
  });
}

ProfileResponse deserializeProfileResponse(Map<String, dynamic> json) =>
    ProfileResponse.fromJson(json);
