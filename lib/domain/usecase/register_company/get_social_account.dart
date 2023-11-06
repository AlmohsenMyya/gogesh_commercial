
import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';
import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../entities/company_entity/social_account_response.dart';


class GetSocialAccountUseCase extends UseCase<SocialAccountResponse, NoParams> {
  final CompanyRepository  companyRepository ;

  GetSocialAccountUseCase({required this.companyRepository});
  @override
  Future<Result<SocialAccountResponse, Exceptions>> call(
    NoParams params,
  ) async {
    return companyRepository.getSocialAccount();
  }
}