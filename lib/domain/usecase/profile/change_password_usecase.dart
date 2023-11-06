import 'dart:io';

import 'package:commmercial_directory_seller/domain/repositories/profile_repository.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_password_request.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';
import 'package:dio/dio.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../../data/profile_data_source/profile_remote_data_source.dart';
import '../../entities/profile_entity/profile_response.dart';
import '../register_company/register_company_usecase.dart';

class ChangePasswordUseCase extends UseCase<String, EditPasswordRequest> {
  final ProfileRepository profileRepository;

  ChangePasswordUseCase({required this.profileRepository});
  @override
  Future<Result<String, Exceptions>> call(
    EditPasswordRequest params,
  ) async {
    return profileRepository.changePassword(params);
  }
}