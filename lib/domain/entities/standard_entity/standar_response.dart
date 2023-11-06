import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'standar_response.freezed.dart';
part 'standar_response.g.dart';

@freezed
class StandarResponse with _$StandarResponse {
  factory StandarResponse({required List<StandarEntity>? data}) =
      _StandarResponse;

  factory StandarResponse.fromJson(Map<String, dynamic> json) =>
      _$StandarResponseFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 103)
class StandarEntity extends Equatable {
  StandarEntity({
    required this.id,
    required this.name,
    this.hasSections,
    this.activityId,
    this.countryId,
    this.cityId,
    this.serviceId,
    this.sectorID,
    this.sector,
    this.subSuctor,
    this.code,
  });
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  @JsonKey(name: "has_sections")
  final bool? hasSections;
  @HiveField(3)
  @JsonKey(name: "services_id")
  final int? serviceId;
  @HiveField(4)
  @JsonKey(name: "activity_id")
  final int? activityId;
  @HiveField(5)
  @JsonKey(name: "city_id")
  final int? cityId;
  @HiveField(6)
  @JsonKey(name: "country_id")
  final int? countryId;
  @HiveField(7)
  @JsonKey(name: "sector_id")
  final int? sectorID;
  @HiveField(8)
  @JsonKey(name: "sector")
  StandarEntity? sector;
  @HiveField(9)
  @JsonKey(name: "sub_sector")
  StandarEntity? subSuctor;
  @HiveField(10)
  final int? code;
  factory StandarEntity.fromJson(Map<String, dynamic> json) =>
      _$StandarEntityFromJson(json);
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        if (sectorID != null) "sector_id": sectorID,
        if (hasSections != null) "has_sections": hasSections,
        if (serviceId != null) "services_id": serviceId,
        if (activityId != null) "activity_id": activityId,
        if (cityId != null) "city_id": cityId,
        if (countryId != null) "country_id": countryId,
        if (subSuctor != null) "sub_sector": subSuctor,
        if (sector != null) "sector": sector,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, hasSections];
}
