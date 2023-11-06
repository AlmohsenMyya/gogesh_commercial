import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/repositories/chat_reository.dart';
import 'package:commmercial_directory_seller/domain/entities/chat_entity/conversation_response.dart';
import 'package:commmercial_directory_seller/domain/request/chat/chat_request.dart';

class MakeChatUseCase extends UseCase<String, MakeContactRequest> {
  final ChatRepository chatRepository;

  MakeChatUseCase({required this.chatRepository});
  @override
  Future<Result<String, Exceptions>> call(
    MakeContactRequest params,
  ) async {
    return chatRepository.makeChat(params);

   
  }
}