// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standar_paginated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SectorsPaginated _$$_SectorsPaginatedFromJson(Map<String, dynamic> json) =>
    _$_SectorsPaginated(
      data: (json['data'] as List<dynamic>)
          .map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SectorsPaginatedToJson(_$_SectorsPaginated instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };
