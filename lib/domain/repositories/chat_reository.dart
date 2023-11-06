import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/Conversation_paginated/conversation_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/chat_paginated/chat_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/domain/request/chat/chat_request.dart';

abstract class ChatRepository {
  Future<Result<ConversationPaginated, Exceptions>> fetchConvertationSupport(
      Map<String, dynamic> filter);
  Future<Result<ConversationPaginated, Exceptions>> fetchConvertationCustomer(
      Map<String, dynamic> filter);
  Future<Result<ChatPaginated, Exceptions>> fetchChat(Filter filter);
  Future<Result<void, Exceptions>> updateUnreadMessagesCount();

  Future<Result<String, Exceptions>> makeChat(MakeContactRequest request);
  Future<Result<String, Exceptions>> sendMessage(
      SendMessageRequest request, String? type, String? socketId);
}
