import 'dart:async';

import 'package:commmercial_directory_seller/core/paginated/notificaton_paginated/notification_paginated.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/subscription_entity/subscription_response.dart';
import 'package:commmercial_directory_seller/domain/request/payment/payment_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_data_source.g.dart';

@RestApi(
  baseUrl: "http://progressmaxonline.com/api/v1",
  parser: Parser.FlutterCompute,
)
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;
  @GET('/packages')
  Future<HttpResponse<SubscriptionResponse>> getPackageSubscrption({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
  @POST('/stripe')
  Future<HttpResponse> payment({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Body() required PaymentRequest body,
  });

  @GET('/privacy-policy')
  Future<HttpResponse> getPrivacypolicy({
    @Header("Accept-Language") required String language,
  });
  @GET('/seller/notification')
  Future<HttpResponse<NotificationPaginated>> getNotification({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
        @Queries() required Map<String, dynamic> queries,

  });
  @GET('/seller/subscription/information')
  Future<HttpResponse<InformationResponse>> getInformationSubscribtion({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
  });
}

SubscriptionResponse deserializeSubscriptionResponse(
        Map<String, dynamic> json) =>
    SubscriptionResponse.fromJson(json);
NotificationPaginated deserializeNotificationPaginated(
        Map<String, dynamic> json) =>
    NotificationPaginated.fromJson(json);
InformationResponse deserializeInformationResponse(Map<String, dynamic> json) =>
    InformationResponse.fromJson(json);
