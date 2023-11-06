import 'package:commmercial_directory_seller/domain/entities/company_entity/work_days_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';


class GetWorkDaysUseCase extends UseCase<WorkDaysResponse, NoParams> {
  final CompanyRepository  companyRepository ;

  GetWorkDaysUseCase({required this.companyRepository});
  @override
  Future<Result<WorkDaysResponse, Exceptions>> call(
    NoParams params,
  ) async {
    return companyRepository.getWorkDays();
  }
}