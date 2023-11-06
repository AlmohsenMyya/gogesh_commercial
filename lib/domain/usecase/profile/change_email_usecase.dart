
import 'package:commmercial_directory_seller/domain/repositories/profile_repository.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_email_request.dart';


import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';

class ChangeEmailUseCase extends UseCase<String, EditEmailRequest> {
  final ProfileRepository profileRepository;

  ChangeEmailUseCase({required this.profileRepository});
  @override
  Future<Result<String, Exceptions>> call(
    EditEmailRequest params,
  ) async {
    return profileRepository.changeEmail(params);
  }
}