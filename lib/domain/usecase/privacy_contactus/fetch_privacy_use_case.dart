import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/repositories/privacy_policy_repository.dart';

class GetPrivacyUseCase extends UseCase<String,NoParams> {
  final PrivacyRepository privacyRepository;

  GetPrivacyUseCase({required this.privacyRepository});
  @override
  Future<Result<String, Exceptions>> call(
    NoParams params,
  ) async {
    return privacyRepository.fetchPrivacy();

   
  }
}