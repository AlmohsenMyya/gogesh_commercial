import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/chat_entity/chat_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/chat_reository.dart';
import 'package:commmercial_directory_seller/domain/request/chat/chat_request.dart';

class SendMessageUseCase extends UseCase<String, SendMessageRequest> {
  final ChatRepository chatRepository;

  SendMessageUseCase({required this.chatRepository});
  @override
  Future<Result<String, Exceptions>> call(
    SendMessageRequest params,
  ) async {
    return chatRepository.sendMessage(params, params.type, params.socketID);
  }
}
