// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateActivityRequest _$UpdateActivityRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateActivityRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      commercialNumber: json['commercialNumber'] as String,
      type: json['type'] as String,
      reason: json['reason'] as String,
      delivery: json['delivery'] as int,
      price: (json['price'] as num?)?.toDouble(),
      activityId: json['activityId'] as int,
      sectorId: json['sectorId'] as int,
      specializationId: json['specializationId'] as int,
      sellerId: json['sellerId'] as int,
      phone: json['phone'] as String,
      seasons: (json['seasons'] as List<dynamic>).map((e) => e as int).toList(),
      address: json['address'] as String,
      logo: json['logo'] as String,
      signature: json['signature'] as String,
      lisence: json['lisence'] as String,
    );

Map<String, dynamic> _$UpdateActivityRequestToJson(
        UpdateActivityRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'commercialNumber': instance.commercialNumber,
      'type': instance.type,
      'phone': instance.phone,
      'address': instance.address,
      'reason': instance.reason,
      'seasons': instance.seasons,
      'logo': instance.logo,
      'lisence': instance.lisence,
      'signature': instance.signature,
      'price': instance.price,
      'delivery': instance.delivery,
      'sellerId': instance.sellerId,
      'specializationId': instance.specializationId,
      'sectorId': instance.sectorId,
      'activityId': instance.activityId,
    };
