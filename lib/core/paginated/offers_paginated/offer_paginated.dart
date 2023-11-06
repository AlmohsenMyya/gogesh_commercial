import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'offer_paginated.g.dart';

@JsonSerializable()
@HiveType(typeId: 35)
class OfferPaginated {
   OfferPaginated({
    required this.data,
    required this.meta,
  });
  @HiveField(0)
  final List<OfferEntity> data;
  @HiveField(1)
   Meta meta;
  factory OfferPaginated.fromJson(Map<String, dynamic> json) =>
      _$OfferPaginatedFromJson(json);
  Map<String, dynamic> toJson() => _$OfferPaginatedToJson(this);
}
