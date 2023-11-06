import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/Conversation_paginated/conversation_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/repositories/chat_reository.dart';

class GetConversationCustomerUseCase extends UseCase<ConversationPaginated, Filter> {
  final ChatRepository chatRepository;

  GetConversationCustomerUseCase({required this.chatRepository});
  @override
  Future<Result<ConversationPaginated, Exceptions>> call(
   Filter  params,
  ) async {
    return chatRepository.fetchConvertationCustomer(params.toJson());
  }


  
}