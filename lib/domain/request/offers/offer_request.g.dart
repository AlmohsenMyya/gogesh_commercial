// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferRequest _$OfferRequestFromJson(Map<String, dynamic> json) => OfferRequest(
      specializationId: json['specialities_id']  ,
      title: json['title'] as String,
      durationId: json['durationId'] as int?,
      seasonId: json['seasonId'] as int,
      description: json['description'] as String,
      conditions: json['conditions'] as String,
      discount: json['discount'] as int,
      id: json['id'] as int?,
      reason: json['reason'] as String?,
      imagePaths: (json['imagePaths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      video: json['video'] as String?,
      price: (json['price'] as num).toDouble(),
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      dateFinish: json['dateFinish'] as String?,
      dateStart: json['dateStart'] as String?,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$OfferRequestToJson(OfferRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'conditions': instance.conditions,
      'price': instance.price,
      'total': instance.total,
      'discount': instance.discount,
      'durationId': instance.durationId,
      'seasonId': instance.seasonId,
      'specialities_id': instance.specializationId,
      'id': instance.id,
      'video': instance.video,
      'image': instance.image,
      'imagePaths': instance.imagePaths,
      'reason': instance.reason,
      'dateStart': instance.dateStart,
      'dateFinish': instance.dateFinish,
    };
