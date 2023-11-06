import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/subscription_entity/subscription_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/privacy_policy_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/subscription_repository.dart';

class GetInformationSubscrptionUseCase
    extends UseCase<InformationResponse, NoParams> {
  final SubscrptionRepository subscrptionRepository;

  GetInformationSubscrptionUseCase({required this.subscrptionRepository});
  @override
  Future<Result<InformationResponse, Exceptions>> call(
    NoParams params,
  ) async {
    return subscrptionRepository.fetchInformationSubscribtion();
  }
}
