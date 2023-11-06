import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_social_account.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_work_days_request.dart';
import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../entities/company_entity/social_account_response.dart';


class EditWorkDaysUseCase extends UseCase<String, EditWorkDaysRequest> {
  final CompanyRepository  companyRepository ;

  EditWorkDaysUseCase({required this.companyRepository});
  @override
  Future<Result<String, Exceptions>> call(
    EditWorkDaysRequest params,
  ) async {
    return companyRepository.editWorkDays(params);
  }
}