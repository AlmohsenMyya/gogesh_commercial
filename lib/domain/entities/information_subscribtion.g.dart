// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_subscribtion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InformationResponse _$InformationResponseFromJson(Map<String, dynamic> json) =>
    InformationResponse(
      information:
          InformationEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InformationResponseToJson(
        InformationResponse instance) =>
    <String, dynamic>{
      'data': instance.information,
    };
