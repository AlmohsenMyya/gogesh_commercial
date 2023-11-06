import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/fillters/filter_conversation.dart';
import 'package:commmercial_directory_seller/core/paginated/Conversation_paginated/conversation_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/repositories/chat_reository.dart';
import 'package:commmercial_directory_seller/domain/entities/chat_entity/conversation_response.dart';

class GetConversationSupportUseCase
    extends UseCase<ConversationPaginated, Filter> {
  final ChatRepository chatRepository;

  GetConversationSupportUseCase({required this.chatRepository});
  @override
  Future<Result<ConversationPaginated, Exceptions>> call(
    Filter params,
  ) async {
    return chatRepository.fetchConvertationSupport(params.toJson());
  }
}
