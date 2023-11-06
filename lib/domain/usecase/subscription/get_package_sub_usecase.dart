import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/subscription_entity/subscription_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/privacy_policy_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/subscription_repository.dart';

class GetPackageSubscrptionUseCase
    extends UseCase<SubscriptionResponse, NoParams> {
  final SubscrptionRepository subscrptionRepository;

  GetPackageSubscrptionUseCase({required this.subscrptionRepository});
  @override
  Future<Result<SubscriptionResponse, Exceptions>> call(
    NoParams params,
  ) async {
    return subscrptionRepository.fetchPackageSubscription();
  }
}
