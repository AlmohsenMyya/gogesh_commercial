
import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_social_account.dart';
import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../entities/company_entity/social_account_response.dart';


class EditSocialAccountUseCase extends UseCase<String, EditSocialAccounttRequest> {
  final CompanyRepository  companyRepository ;

  EditSocialAccountUseCase({required this.companyRepository});
  @override
  Future<Result<String, Exceptions>> call(
    EditSocialAccounttRequest params,
  ) async {
    return companyRepository.editSocialAccount(params);
  }
}