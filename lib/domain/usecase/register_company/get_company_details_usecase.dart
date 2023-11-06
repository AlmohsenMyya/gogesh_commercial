
import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';


class GetDetailsCompanyUseCase extends UseCase<CompanyResponse, NoParams> {
  final CompanyRepository  companyRepository ;

  GetDetailsCompanyUseCase({required this.companyRepository});
  @override
  Future<Result<CompanyResponse, Exceptions>> call(
    NoParams params,
  ) async {
    return companyRepository.getDetailscompany();
  }
}