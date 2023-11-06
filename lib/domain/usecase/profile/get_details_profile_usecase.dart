import 'dart:io';

import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';

class GetProfileDetailsUseCase extends UseCase<ProfileResponse, NoParams> {
  final ProfileRepository profileRepository;

  GetProfileDetailsUseCase({required this.profileRepository});
  @override
  Future<Result<ProfileResponse, Exceptions>> call(
    NoParams params,
  ) async {
    return profileRepository.getdetailsProfile();
  }
}
