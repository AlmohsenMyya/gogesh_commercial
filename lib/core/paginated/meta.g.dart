// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta(
      total: json['total'] as int?,
      currentPage: json['current_page'] as int? ?? 1,
      nextPage: json['next_page'] as int? ?? 2,
      perPage: json['per_page'] as int? ?? 16,
      lastPage: json['last_page'] as int? ?? 2,
    );

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{
      'total': instance.total,
      'current_page': instance.currentPage,
      'next_page': instance.nextPage,
      'per_page': instance.perPage,
      'last_page': instance.lastPage,
    };
