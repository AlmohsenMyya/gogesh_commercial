// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_work_days_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditWorkDaysRequest _$EditWorkDaysRequestFromJson(Map<String, dynamic> json) =>
    EditWorkDaysRequest(
      workDays: (json['work_days'] as List<dynamic>)
          .map((e) => WorkDays.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EditWorkDaysRequestToJson(
        EditWorkDaysRequest instance) =>
    <String, dynamic>{
      'work_days': instance.workDays,
    };
