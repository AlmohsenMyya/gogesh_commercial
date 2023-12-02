import 'dart:async';

import 'package:commmercial_directory_seller/core/paginated/ads_paginated/ads_paginated.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/places_entity/places_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/entities/durations_entity/durations_response.dart';

part 'ads_remote_data_source.g.dart';

@RestApi(
  baseUrl: "http://progressmaxonline.com/api/v1",
  parser: Parser.FlutterCompute,
)
abstract class AdsRemoteDataSource {
  factory AdsRemoteDataSource(Dio dio, {String baseUrl}) = _AdsRemoteDataSource;

  @POST('/ads')
  Future<HttpResponse> addAds({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Body() required FormData body,
  });

  @POST('/ads/{id}')
  Future<HttpResponse> editAds({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Path() required int id,
    @Body() required FormData body,
    @Query("_method") required String method,
  });
  @GET('/ads')
  Future<HttpResponse<AdsPaginated>> getAds({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Queries() required Map<String, dynamic> queries,
  });
  // /ads/
  @GET('{path}{id}')
  Future<HttpResponse<AdsDetailsRasponse>> getAdsDetails({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Path() required int id,
    @Path() required String path,
  });
  @GET('/placesAds')
  Future<HttpResponse<PlacesResponse>> getPlaces({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
  @POST('/seller/ads/{id}')
  Future<HttpResponse> deleteAds({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Path() required int id,
    @Query("_method") required String method,
  });
}

FutureOr<AdsPaginated> deserializeAdsPaginated(Map<String, dynamic> json) =>
    AdsPaginated.fromJson(json);
FutureOr<AdsDetailsRasponse> deserializeAdsDetailsRasponse(Map<String, dynamic> json) =>
    AdsDetailsRasponse.fromJson(json);
FutureOr<PlacesResponse> deserializePlacesResponse(Map<String, dynamic> json) =>
    PlacesResponse.fromJson(json);
DurationsResponse deserializeDurationsResponse(Map<String, dynamic> json) =>
    DurationsResponse.fromJson(json);
