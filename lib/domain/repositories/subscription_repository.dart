import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/subscription_entity/subscription_response.dart';

abstract class SubscrptionRepository {
  Future<Result<SubscriptionResponse, Exceptions>> fetchPackageSubscription();
  Future<Result<InformationResponse, Exceptions>> fetchInformationSubscribtion();
}
