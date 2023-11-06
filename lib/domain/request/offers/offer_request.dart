import 'dart:io';

import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_request.g.dart';

@JsonSerializable()
class OfferRequest extends Params {
  const OfferRequest(
      {required this.title,
      required this.durationId,
      required this.seasonId,
      required this.description,
      required this.conditions,
      required this.discount,
      this.id,
      this.reason,
      this.imagePaths,
      required this.video,
      required this.price,
      required this.image,
      required this.dateFinish,
      required this.dateStart,
      required this.total});

  final String title;
  final String description;
  final String conditions;
  final double price;
  final double total;

  final int discount;

  final int? durationId;

  final int seasonId;
  final int? id;
  final String? video;
  final List<String> image;
  final List<String>? imagePaths;
  final String? reason;
  final String? dateStart;
  final String? dateFinish;

  Map<String, dynamic> toJson() => _$OfferRequestToJson(this);
  factory OfferRequest.fromJson(Map<String, dynamic> json) =>
      _$OfferRequestFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
