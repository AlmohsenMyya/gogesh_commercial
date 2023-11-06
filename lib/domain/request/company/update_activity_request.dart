import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_activity_request.g.dart';

@JsonSerializable()
class UpdateActivityRequest extends Params {
  const UpdateActivityRequest({
    required this.name,
    required this.description,
    required this.commercialNumber,
    required this.type,
    required this.reason,
    required this.delivery,
    required this.price,
    required this.activityId,
    required this.sectorId,
    required this.specializationId,
    required this.sellerId,
    required this.phone,
    required this.seasons,
    required this.address,
    required this.logo,
    required this.signature,
    required this.lisence,
  });
  final String name,
      description,
      commercialNumber,
      type,
      phone,
      address,
      reason;

  final List<int> seasons;
  final String logo;
  final String lisence;
  final String signature;

  final double? price;

  final int delivery, sellerId, specializationId, sectorId, activityId;

  factory UpdateActivityRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateActivityRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateActivityRequestToJson(this);

  @override
  List<Object?> get props => [
        name,
        description,
        type,
        phone,
        commercialNumber,
        delivery,
        sellerId,
        specializationId,
        sectorId,
        activityId,
        seasons,
      ];
}
