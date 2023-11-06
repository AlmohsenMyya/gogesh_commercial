import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';
import 'package:commmercial_directory_seller/domain/request/company/add_assistant.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';


class GetAssistantUseCase extends UseCase<AssistantResponse, NoParams> {
  final CompanyRepository  companyRepository ;

  GetAssistantUseCase({required this.companyRepository});
  @override
  Future<Result<AssistantResponse, Exceptions>> call(
    NoParams params,
  ) async {
    return companyRepository.getAssistant();
  }
}