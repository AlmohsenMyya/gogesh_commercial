import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../repositories/chat_reository.dart';

class UpdateUnreadMessagesCountUseCase implements UseCase<void, NoParams> {
  final ChatRepository _repository;

  UpdateUnreadMessagesCountUseCase(this._repository);

  @override
  Future<Result<void, Exceptions>> call(NoParams params) async {
    return _repository.updateUnreadMessagesCount();
  }
}
