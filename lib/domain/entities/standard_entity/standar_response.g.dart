// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standar_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StandarEntityAdapter extends TypeAdapter<StandarEntity> {
  @override
  final int typeId = 103;

  @override
  StandarEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StandarEntity(
      id: fields[0] as int?,
      name: fields[1] as String?,
      hasSections: fields[2] as bool?,
      activityId: fields[4] as int?,
      countryId: fields[6] as int?,
      cityId: fields[5] as int?,
      serviceId: fields[3] as int?,
      sectorID: fields[7] as int?,
      sector: fields[8] as StandarEntity?,
      subSuctor: fields[9] as StandarEntity?,
      code: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StandarEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.hasSections)
      ..writeByte(3)
      ..write(obj.serviceId)
      ..writeByte(4)
      ..write(obj.activityId)
      ..writeByte(5)
      ..write(obj.cityId)
      ..writeByte(6)
      ..write(obj.countryId)
      ..writeByte(7)
      ..write(obj.sectorID)
      ..writeByte(8)
      ..write(obj.sector)
      ..writeByte(9)
      ..write(obj.subSuctor)
      ..writeByte(10)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StandarEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandarEntity _$StandarEntityFromJson(Map<String, dynamic> json) =>
    StandarEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      hasSections: json['has_sections'] as bool?,
      activityId: json['activity_id'] as int?,
      countryId: json['country_id'] as int?,
      cityId: json['city_id'] as int?,
      serviceId: json['services_id'] as int?,
      sectorID: json['sector_id'] as int?,
      sector: json['sector'] == null
          ? null
          : StandarEntity.fromJson(json['sector'] as Map<String, dynamic>),
      subSuctor: json['sub_sector'] == null
          ? null
          : StandarEntity.fromJson(json['sub_sector'] as Map<String, dynamic>),
      code: int.tryParse(json['code'] ?? ''),
    );

Map<String, dynamic> _$StandarEntityToJson(StandarEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'has_sections': instance.hasSections,
      'services_id': instance.serviceId,
      'activity_id': instance.activityId,
      'city_id': instance.cityId,
      'country_id': instance.countryId,
      'sector_id': instance.sectorID,
      'sector': instance.sector,
      'sub_sector': instance.subSuctor,
      'code': instance.code,
    };

_$_StandarResponse _$$_StandarResponseFromJson(Map<String, dynamic> json) =>
    _$_StandarResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StandarResponseToJson(_$_StandarResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
