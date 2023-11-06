import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'subscription_response.g.dart';

@JsonSerializable()
@HiveType(typeId: 29)
class SubscriptionResponse {
  const SubscriptionResponse({
    required this.package,
  });
  @HiveField(0)
  @JsonKey(name: "data")
  final List<SubscriptionEntity> package;
  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionResponseToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 25)
class SubscriptionEntity {
  const SubscriptionEntity({
    required this.id,
    required this.name,
    required this.duration,
    required this.features,
    required this.price,
  });
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final double? price;
  @HiveField(3)
  final List<String>? features;
  @HiveField(4)
  final int? duration;

  factory SubscriptionEntity.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionEntityToJson(this);
}
