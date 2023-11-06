import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';
import 'package:commmercial_directory_seller/domain/request/company/add_assistant.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';


class DeleteAssistantUseCase extends UseCase<String, ModelID> {
  final CompanyRepository  companyRepository ;

  DeleteAssistantUseCase({required this.companyRepository});
  @override
  Future<Result<String, Exceptions>> call(
    ModelID params,
  ) async {
    return companyRepository.deleteAssistant(params);
  }
}