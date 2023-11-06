import 'dart:async';

import 'package:commmercial_directory_seller/core/paginated/standar_paginated/standar_paginated.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'categories_data_source.g.dart';

@RestApi(
  baseUrl: "https://alphadev39.com/commercial/api/v1",
  parser: Parser.FlutterCompute,
)
abstract class CategoriesRemoteDataSource {
  factory CategoriesRemoteDataSource(Dio dio, {String baseUrl}) =
      _CategoriesRemoteDataSource;

  @GET("/sectors")
  Future<HttpResponse<StandarPaginated>> getSectors({
    @Queries() required Map<String, dynamic> queries,
    @Header("Accept-Language") required String language,
  });
  // /sub-sectors/
  @GET("{path}")
  Future<HttpResponse<StandarPaginated>> getSubSectors({
    @Queries() required Map<String, dynamic> queries,
    @Header("Accept-Language") required String language,
    @Path() required String path,
  });
// /activities
  @GET("{path}")
  Future<HttpResponse<StandarPaginated>> getActivities({
    @Queries() required Map<String, dynamic> queries,
    @Header("Accept-Language") required String language,
    @Path() required String path,
  });

  @GET("{path}")
  Future<HttpResponse<StandarPaginated>> getSpecialities({
    @Queries() required Map<String, dynamic> queries,
    @Header("Accept-Language") required String language,
    @Path() required String path,
  });

  @GET("/seasons")
  Future<HttpResponse<StandarPaginated>> getSeasons({
    @Queries() required Map<String, dynamic> queries,
    @Header("Accept-Language") required String language,
  });

  @GET("/services")
  Future<HttpResponse<StandarPaginated>> getServices({
    @Queries() required Map<String, dynamic> queries,
    @Header("Accept-Language") required String language,
  });

  @GET("/services/{id}")
  Future<HttpResponse<StandarPaginated>> getSectionByService(
      {@Queries() required Map<String, dynamic> queries,
      @Header("Accept-Language") required String language,
      @Path() required int id});
}

FutureOr<StandarPaginated> deserializeStandarPaginated(
        Map<String, dynamic> json) =>
    StandarPaginated.fromJson(json);
