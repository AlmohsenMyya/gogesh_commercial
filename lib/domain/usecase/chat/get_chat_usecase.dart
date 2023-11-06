import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/chat_paginated/chat_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/repositories/chat_reository.dart';

class GetChatUseCase extends UseCase<ChatPaginated, Filter> {
  final ChatRepository chatRepository;

  GetChatUseCase({required this.chatRepository});
  @override
  Future<Result<ChatPaginated, Exceptions>> call(
      Filter params,
  ) async {
    return chatRepository.fetchChat(params);
  }
}
