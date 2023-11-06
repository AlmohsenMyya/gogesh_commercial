import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/Conversation_paginated/conversation_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/chat_paginated/chat_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/data/chat_data_source/chat_remote_data_source.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/repositories/chat_reository.dart';
import 'package:commmercial_directory_seller/domain/request/chat/chat_request.dart';
import 'package:dio/dio.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  ChatRepositoryImpl({required this.dataSource, required this.localDataSource});

  @override
  Future<Result<String, Exceptions>> makeChat(
      MakeContactRequest request) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result = await dataSource.makeContact(
          auth: token, language: keyLanguage, body: request);

      return const Result.success(data: '');
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      // print('object');
      // print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }

  @override
  Future<Result<ConversationPaginated, Exceptions>> fetchConvertationSupport(
      Map<String, dynamic> filter) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result = await dataSource.getConversationSuppprt(
          auth: token, language: keyLanguage, queries: filter);

      return Result.success(data: result.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      // print('object');
      // print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }

  @override
  Future<Result<ChatPaginated, Exceptions>> fetchChat(Filter params) async {
    try {
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final result = await dataSource.getChat(
          auth: token, id: params.id ?? 0, queries: params.toJson());

      return Result.success(data: result.data);
    } on DioException catch (ex) {
      // print(ex.message);
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      // print(e);
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      // print('object');
      // print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }

  @override
  Future<Result<String, Exceptions>> sendMessage(
      SendMessageRequest request, String? type, String? socketId) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final result = await dataSource.sendMessage(
          auth: token,
          language: keyLanguage,
          body: FormData.fromMap(
            {
              "contact_id": request.contactId,
              "message": request.message,
              "attachment": request.attachement == null
                  ? null
                  : await MultipartFile.fromFile(request.attachement!),
            },
          ),
          type: type,
          socketId: socketId);

      return Result.success(data: 'sent');
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }
      return const Result.failure(error: Exceptions.other(''));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      print(e);
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }

  @override
  Future<Result<ConversationPaginated, Exceptions>> fetchConvertationCustomer(
      Map<String, dynamic> filter) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';

      final result = await dataSource.getConversationCustomer(
          auth: token, language: keyLanguage, queries: filter);

      return Result.success(data: result.data);
    } on DioException catch (ex) {
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      // print('object');
      // print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }

  @override
  Future<Result<void, Exceptions>> updateUnreadMessagesCount() async {
    try {
      final result = await dataSource.getUnreadMessagesCount();
      await localDataSource.setValue(
          LocalDataKeys.unreadMessages, result.data["count"]);
      return const Result.success();
    } catch (e) {
      return const Result.failure();
    }
  }
}
