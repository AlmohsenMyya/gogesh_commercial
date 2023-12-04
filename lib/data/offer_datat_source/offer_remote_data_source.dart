import 'dart:async';

import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/entities/durations_entity/durations_response.dart';

part 'offer_remote_data_source.g.dart';

@RestApi(
  baseUrl: "https://progressmaxonline.com/api/v1",
  parser: Parser.FlutterCompute,
)
abstract class OfferRemoteDataSource {
  factory OfferRemoteDataSource(Dio dio, {String baseUrl}) =
      _OfferRemoteDataSource;

  @POST('/offers')
  Future<HttpResponse> addOffers({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Body() required FormData body,
  });
  @POST('/offers/{id}')
  Future<HttpResponse> editOffers({
    @Header("Accept-Language") required String language,
    //@Query("_method") required String method,
    @Header("Authorization") required String auth,
    @Path() required int id,
    @Body() required FormData body,
  });
  @POST('/offers/{id}')
  Future<HttpResponse> deleteOffers({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Path() required int id,
    @Body() required FormData body,
  });
  @GET('/durations')
  Future<HttpResponse<DurationsResponse>> getDurations({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
  // /offers/edit/
  @GET('{path}{id}')
  Future<HttpResponse<OfferDetailsRasponse>> getOffersDetails({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Path() required int id,
    @Path()required String path,
  });
  @GET('/seller/offerUpteted/{id}')
  Future<HttpResponse<OfferDetailsRasponse>> getOffersUpdatedDetails({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Path() required int id,
  });
  @GET('/seller/offers')
  Future<HttpResponse<OfferPaginated>> getOffers({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Queries() required Map<String, dynamic> queries,
  });
}

FutureOr<OfferPaginated> deserializeOfferPaginated(Map<String, dynamic> json) =>
    OfferPaginated.fromJson(json);
FutureOr<OfferDetailsRasponse> deserializeOfferDetailsRasponse(
        Map<String, dynamic> json) =>
    OfferDetailsRasponse.fromJson(json);

DurationsResponse deserializeDurationsResponse(Map<String, dynamic> json) =>
    DurationsResponse.fromJson(json);
