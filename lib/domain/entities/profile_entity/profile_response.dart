import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  const ProfileResponse({
    required this.data,
  });

  final ProfileEntity data;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class AssistantResponse {
  const AssistantResponse({
    required this.data,
  });

  final List<ProfileEntity> data;

  factory AssistantResponse.fromJson(Map<String, dynamic> json) =>
      _$AssistantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssistantResponseToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 23)
class ProfileEntity {
  ProfileEntity({
    required this.country,
    required this.image,
    required this.city,
    required this.region,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.active,
    required this.createdAt,
    this.pic,
    this.activityId,
    this.sectorId,
    this.subSectorId,
    this.upgraded,
    this.verification,
    this.type,
    this.commerialActivityDescription,
    this.commerialActivityName,
    this.commerialActivityPhone,
    this.sectionsId,
    this.servicesId,
    this.civilCard,
    this.lisence,
    this.signature,
    this.reason,
    this.actived,
    required this.status,
    required this.completed,
  });

  @HiveField(0)
  final int? id;
  @HiveField(1)
  @JsonKey(name: 'first_name')
  final String? firstName;
  @HiveField(2)
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @HiveField(3)
  @JsonKey(name: "last_name")
  final String? lastName;
  @HiveField(4)
  String? email;
  @HiveField(5)
  final String? pic;
  @HiveField(6)
  final String? phone;
  @HiveField(7)
  final bool? active;
  @HiveField(8)
  final String? status;
  @HiveField(9)
  final String? country;
  @HiveField(10)
  final String? city;
  @HiveField(11)
  final String? region;
  @HiveField(12)
  final String? image;
  @HiveField(13)
  final bool? completed;
  @HiveField(14)
  @JsonKey(name: "commercial_activity_name")
  final String? commerialActivityName;
  @HiveField(15)
  final Upgraded? upgraded;
  @HiveField(16)
  final bool? verification;
  @HiveField(17)
  @JsonKey(name: "activity_id")
  final StandarEntity? activityId;
  @HiveField(18)
  @JsonKey(name: "sub_sector_id")
  final StandarEntity? subSectorId;
  @HiveField(19)
  @JsonKey(name: "sector_id")
  final StandarEntity? sectorId;
  @HiveField(20)
  @JsonKey(name: "commercial_activity_description")
  final String? commerialActivityDescription;
  @HiveField(21)
  @JsonKey(name: "commercial_activity_phone")
  final String? commerialActivityPhone;
  @HiveField(22)
  final String? type;
  @HiveField(23)
  @JsonKey(name: "services_id")
  final List<StandarEntity>? servicesId;
  @HiveField(24)
  @JsonKey(name: "sections_id")
  final List<StandarEntity>? sectionsId;
  @HiveField(25)
  @JsonKey(name: "civil_card")
  final String? civilCard;
  @HiveField(26)
  @JsonKey(name: "signature_approval")
  final String? signature;
  @HiveField(27)
  @JsonKey(name: "commercial_license")
  final String? lisence;
  @HiveField(28)
  final String? reason;
  @HiveField(29)
  final bool?actived;
  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 102)
class Upgraded {
  Upgraded({
    this.deliveryPrice,
    this.logo,
    this.seasonsId,
    this.upgradedStatus,
    this.socialAccounts,
    this.specialitiesId,
    this.workDays,
  });

  @HiveField(0)
  @JsonKey(name: 'upgraded_status')
  final String? upgradedStatus;
  @HiveField(1)
  @JsonKey(name: 'logo')
  final String? logo;
  @HiveField(2)
  @JsonKey(name: 'specialities_id')
  final List<StandarEntity>? specialitiesId;
  @HiveField(3)
  @JsonKey(name: 'seasons_id')
  final List<StandarEntity>? seasonsId;
  @HiveField(4)
  @JsonKey(name: "work_days")
  List<WorkDays>? workDays;
  @HiveField(5)
  @JsonKey(name: "social_accounts")
  List<SocialAccounts>? socialAccounts;
  @HiveField(6)
  @JsonKey(name: 'delivery_price')
  final double? deliveryPrice;

  factory Upgraded.fromJson(Map<String, dynamic> json) =>
      _$UpgradedFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradedToJson(this);
}
