import 'dart:async';

import 'package:commmercial_directory_seller/core/paginated/Conversation_paginated/conversation_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/chat_paginated/chat_paginated.dart';
import 'package:commmercial_directory_seller/domain/request/chat/chat_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_remote_data_source.g.dart';

@RestApi(
  baseUrl: "https://alphadev39.com/commercial/api/v1",
  parser: Parser.FlutterCompute,
)
abstract class ChatRemoteDataSource {
  factory ChatRemoteDataSource(Dio dio, {String baseUrl}) =
      _ChatRemoteDataSource;

  @POST('/seller/makeContact')
  Future<HttpResponse> makeContact({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Body() required MakeContactRequest body,
  });

  @POST('/seller/sendMessage')
  Future<HttpResponse> sendMessage({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Query("type") String? type,
    @Body() required FormData body,
    @Header("X-Socket-Id") String? socketId,
  });
  @GET('/seller/messages/{id}')
  Future<HttpResponse<ChatPaginated>> getChat({
    @Header("Authorization") required String auth,
    @Path() required int id,
    @Queries() required Map<String, dynamic> queries,
  });

  @GET('/seller/messages')
  Future<HttpResponse<ConversationPaginated>> getConversationSuppprt({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Queries() required Map<String, dynamic> queries,
  });
  @GET('/seller/messages')
  Future<HttpResponse<ConversationPaginated>> getConversationCustomer({
    @Header("Accept-Language") required String language,
    @Header("Authorization") required String auth,
    @Queries() required Map<String, dynamic> queries,
  });

  @GET('/seller/messages-count')
  Future<HttpResponse> getUnreadMessagesCount();
}

FutureOr<ChatPaginated> deserializeChatPaginated(Map<String, dynamic> json) =>
    ChatPaginated.fromJson(json);

FutureOr<ConversationPaginated> deserializeConversationPaginated(
        Map<String, dynamic> json) =>
    ConversationPaginated.fromJson(json);
