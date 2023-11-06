// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_days_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkDaysEntity _$WorkDaysEntityFromJson(Map<String, dynamic> json) =>
    WorkDaysEntity(
      workDays: (json['work_days'] as List<dynamic>?)
          ?.map((e) => WorkDaysCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$WorkDaysEntityToJson(WorkDaysEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'work_days': instance.workDays,
    };

WorkDaysCompany _$WorkDaysCompanyFromJson(Map<String, dynamic> json) =>
    WorkDaysCompany(
      day: json['day'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WorkDaysCompanyToJson(WorkDaysCompany instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'name': instance.name,
      'day': instance.day,
    };

_$_WorkDaysResponse _$$_WorkDaysResponseFromJson(Map<String, dynamic> json) =>
    _$_WorkDaysResponse(
      data: WorkDaysEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WorkDaysResponseToJson(_$_WorkDaysResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
