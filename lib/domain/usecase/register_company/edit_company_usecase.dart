import 'dart:convert';
import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/domain/repositories/company_repository.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:commmercial_directory_seller/domain/request/company/update_activity_request.dart';
import 'package:dio/dio.dart';

import '../../../core/use_case/use_case.dart';
import '../../../core/utils/model_id.dart';
import '../../../data/auth_data_source/auth_data_source.dart';

import 'package:retrofit/dio.dart';

import '../../../data/custom_interceptor.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../../data/register_company_data_source/register_remote_data_source.dart';

class EditCompanyUseCase extends UseCase<String, RegisterPartTwoSeller> {
   final CompanyRepository  companyRepository ;


  EditCompanyUseCase(
      {required this.companyRepository});

  @override
  Future<Result<String, Exceptions>> call(
    RegisterPartTwoSeller params,
  ) async {
    return companyRepository.editCompany(params);

  }
}
  