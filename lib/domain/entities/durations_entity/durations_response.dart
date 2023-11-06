import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'durations_response.freezed.dart';
part 'durations_response.g.dart';

@freezed
class DurationsResponse with _$DurationsResponse {
  factory DurationsResponse(List<DurationsEntity> data) = _DurationsResponse;

  factory DurationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DurationsResponseFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 31)
class DurationsEntity {
  const DurationsEntity(
      {required this.id,
      required this.type,
      required this.duration,
      required this.price});
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? type;
  @HiveField(2)
  final int? duration;
  @HiveField(3)
  final double? price;

  factory DurationsEntity.fromJson(Map<String, dynamic> json) =>
      _$DurationsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DurationsEntityToJson(this);
}
