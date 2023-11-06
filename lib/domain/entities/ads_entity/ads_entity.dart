import 'package:commmercial_directory_seller/domain/entities/places_entity/places_response.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'ads_entity.g.dart';

@JsonSerializable()
@HiveType(typeId: 36)
class AdsDetailsRasponse {
  const AdsDetailsRasponse({
    required this.data,
  });
  @HiveField(0)
  final AdsEntity data;

  factory AdsDetailsRasponse.fromJson(Map<String, dynamic> json) =>
      _$AdsDetailsRasponseFromJson(json);
  Map<String, dynamic> toJson() => _$AdsDetailsRasponseToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 45)
class AdsEntity {
  const AdsEntity({
    required this.id,
    required this.description,
    required this.images,
    required this.title,
    required this.price,
    required this.createdAt,
    required this.status,
    required this.views,
    required this.dateStart,
    required this.duration,
    required this.place,
    required this.total,
  });
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final double? price;
  @HiveField(4)
  final String? images;
  @HiveField(5)
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @HiveField(6)
  final int? views;
  @HiveField(7)
  final String? status;
  @HiveField(8)
  @JsonKey(name: 'date_start')
  final String? dateStart;
  @HiveField(9)
  final Places? place;
  @HiveField(10)
  final int? duration;
  @HiveField(11)
  final double? total;

  factory AdsEntity.fromJson(Map<String, dynamic> json) =>
      _$AdsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AdsEntityToJson(this);
}
