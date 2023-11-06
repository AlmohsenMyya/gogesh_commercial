// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsRequest _$AdsRequestFromJson(Map<String, dynamic> json) => AdsRequest(
      title: json['title'] as String,
      dateStart: json['dateStart'] as String,
      place: json['place'] as String,
      duration: json['duration'] as int,
      id: json['id'] as int?,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      images: json['images'] as String,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$AdsRequestToJson(AdsRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'total': instance.total,
      'duration': instance.duration,
      'place': instance.place,
      'dateStart': instance.dateStart,
      'images': instance.images,
      'id': instance.id,
    };
