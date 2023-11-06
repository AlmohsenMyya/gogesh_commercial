import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/social_account_response.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/work_days_response.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/request/company/add_assistant.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_social_account.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_work_days_request.dart';
import 'package:commmercial_directory_seller/domain/request/company/update_activity_request.dart';

import '../../core/excptions/exceptions.dart';
import '../request/auth/register/register_part_two_seller.dart';

abstract class CompanyRepository {
  Future<Result<CompanyResponse, Exceptions>> getDetailscompany();
  Future<Result<AssistantResponse, Exceptions>> getAssistant();

  Future<Result<String, Exceptions>> addAssistant(AddAssistantRequest params);
  Future<Result<String, Exceptions>> deleteAssistant(ModelID params);
  Future<Result<WorkDaysResponse, Exceptions>> getWorkDays();
  Future<Result<SocialAccountResponse, Exceptions>> getSocialAccount();
  Future<Result<String, Exceptions>> editSocialAccount(
      EditSocialAccounttRequest params);
  Future<Result<String, Exceptions>> editWorkDays(EditWorkDaysRequest params);

  Future<Result<String, Exceptions>> editCompany(RegisterPartTwoSeller params);
}
