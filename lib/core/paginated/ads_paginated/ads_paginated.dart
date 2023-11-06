
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'ads_paginated.g.dart';


@JsonSerializable()
@HiveType(typeId: 46)
class AdsPaginated {
   AdsPaginated({
    required this.data,
    required this.meta,
  });
  @HiveField(0)
  final List<AdsEntity> data;
  @HiveField(1)
   Meta meta;
  factory AdsPaginated.fromJson(Map<String, dynamic> json) =>
      _$AdsPaginatedFromJson(json);
  Map<String, dynamic> toJson() => _$AdsPaginatedToJson(this);
}