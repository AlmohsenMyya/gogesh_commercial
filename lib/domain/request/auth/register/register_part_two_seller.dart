import 'dart:io';

import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'register_part_two_seller.g.dart';

@JsonSerializable()
class RegisterPartTwoSeller extends Params {
  const RegisterPartTwoSeller({
    this.delivery,
    this.price,
    this.socialAccounts,
    this.logo,
    this.specialities,
    this.workDays,
    this.seasons,
    this.address,
    this.latitude,
    this.longutide 
  });
  final String? logo,longutide,latitude;
  final String ?address;
  final List<SocialAccounts>? socialAccounts;
  final List<WorkDays>? workDays;
  final List<StandarEntity>? seasons;
  final List<StandarEntity>? specialities;

  final double? price;

  final int? delivery;

  factory RegisterPartTwoSeller.fromJson(Map<String, dynamic> json) =>
      _$RegisterPartTwoSellerFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterPartTwoSellerToJson(this);

  @override
  List<Object?> get props =>
      [delivery, seasons, workDays, socialAccounts, logo];
}

@JsonSerializable()
@HiveType(typeId: 72)
class SocialAccounts {
  const SocialAccounts({
    required this.name,
    required this.type,
    required this.url,
    // required this.gender,
    // required this.image,
  });
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String type;

  factory SocialAccounts.fromJson(Map<String, dynamic> json) =>
      _$SocialAccountsFromJson(json);
  Map<String, dynamic> toJson() => _$SocialAccountsToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 71)
class WorkDays {
  WorkDays({
    required this.day,
    required this.from,
    required this.to,
    // required this.image,
  });
  @HiveField(0)
  String? from;
  @HiveField(1)
  String? to;

  @HiveField(2)
  String? day;
  //  @HiveField(3)
  // String? day;

  factory WorkDays.fromJson(Map<String, dynamic> json) =>
      _$WorkDaysFromJson(json);
  Map<String, dynamic> toJson() => _$WorkDaysToJson(this);
}
