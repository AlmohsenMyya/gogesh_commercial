import 'package:commmercial_directory_seller/domain/entities/durations_entity/durations_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'offer_entity.g.dart';

@JsonSerializable()
@HiveType(typeId: 36)
class OfferDetailsRasponse {
  const OfferDetailsRasponse({
    required this.data,
  });
  @HiveField(0)
  final OfferEntity data;

  factory OfferDetailsRasponse.fromJson(Map<String, dynamic> json) =>
      _$OfferDetailsRasponseFromJson(json);
  Map<String, dynamic> toJson() => _$OfferDetailsRasponseToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 30)
class OfferEntity {
  const OfferEntity(
      {required this.price,
      required this.id,
      required this.title,
      required this.description,
      required this.bold,
      required this.images,
      required this.views,
      required this.createdAt,
      required this.activity,
      required this.discount,
      required this.duration,
      required this.season,
      required this.sector,
      required this.speciality,
      required this.condition,
      required this.reason,
      required this.reasonUpdated,
      required this.status,
      required this.updatedId,
      required this.total});
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final double? price;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final bool? bold;
  @HiveField(6)
  final int? views;
  @HiveField(7)
  final List<String>? images;
  @HiveField(8)
  final int? discount;
  @HiveField(9)
  final StandarEntity? sector;
  @HiveField(10)
  final StandarEntity? activity;
  @HiveField(11)
  final StandarEntity? speciality;
  @HiveField(12)
  final StandarEntity? season;
  @HiveField(13)
  final DurationsEntity? duration;
  @HiveField(14)
  final String? condition;
  @HiveField(15)
  final String? status;
  @HiveField(16)
  final String? reason;
  @HiveField(17)
  @JsonKey(name: 'updated_id')
  final int? updatedId;
  @HiveField(18)
  @JsonKey(name: 'reason_updated')
  final String? reasonUpdated;
  @HiveField(19)
  final double? total;

  factory OfferEntity.fromJson(Map<String, dynamic> json) =>
      _$OfferEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OfferEntityToJson(this);
}
