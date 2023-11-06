import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'company_response.g.dart';

@JsonSerializable()
class CompanyResponse {
  const CompanyResponse({
    required this.data,
  });

  final CompanyEntity data;
  factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyResponseToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 70)
class CompanyEntity {
  const CompanyEntity(
      {required this.name,
      required this.status,
      required this.description,
      required this.commercialNumber,
      required this.type,
      required this.delivery,
      required this.deliveryValue,
      required this.socialAccounts,
      required this.activity,
      required this.speciality,
      required this.sector,
      required this.commercialRegister,
      required this.phone,
      required this.workDays,
      required this.commercialSignature,
      required this.address,
      required this.logo,
      required this.season,
      required this.verification,
      required this.actived,
      required this.id});
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? phone;

  @HiveField(4)
  final String? address;

  @HiveField(5)
  final StandarEntity? sector;

  @HiveField(6)
  final StandarEntity? activity;

  @HiveField(7)
  final StandarEntity? speciality;

  @HiveField(8)
  final List<StandarEntity>? season;

  @HiveField(9)
  final bool? delivery;
  @HiveField(10)
  @JsonKey(name: "delivery_value")
  final double? deliveryValue;
  @HiveField(11)
  final String? type;
  @HiveField(12)
  @JsonKey(name: "commercial_number")
  final String? commercialNumber;
  @HiveField(13)
  @JsonKey(name: "work_days")
  final List<WorkDays>? workDays;
  @HiveField(14)
  @JsonKey(name: "social_accounts")
  final List<SocialAccounts>? socialAccounts;
  @HiveField(15)
  final String? logo;
  @HiveField(16)
  @JsonKey(name: "commercial_register")
  final String? commercialRegister;
  @HiveField(17)
  @JsonKey(name: "commercial_signature")
  final String? commercialSignature;
  @HiveField(18)
  final String? verification;
  @HiveField(19)
  final bool? actived;
  @HiveField(20)
  final String? status;

  factory CompanyEntity.fromJson(Map<String, dynamic> json) =>
      _$CompanyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyEntityToJson(this);
}
