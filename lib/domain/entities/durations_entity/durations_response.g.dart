// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'durations_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DurationsEntityAdapter extends TypeAdapter<DurationsEntity> {
  @override
  final int typeId = 31;

  @override
  DurationsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DurationsEntity(
      id: fields[0] as int?,
      type: fields[1] as String?,
      duration: fields[2] as int?,
      price: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, DurationsEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DurationsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
int? _parseInt(dynamic value) {
  if (value is int) {
    return value;
  } else if (value is String) {
    return int.tryParse(value);
  } else {
    return null;
  }
}
double? _parseDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is String) {
    return double.tryParse(value);
  }
  else {
    return null;
  }
}
DurationsEntity _$DurationsEntityFromJson(Map<String, dynamic> json) =>
    DurationsEntity(
      id: json['id'] as int?,
      type: json['type'] as String?,
      duration: _parseInt(json['duration'] ),
      price: _parseDouble(json['price'] ),
    );

Map<String, dynamic> _$DurationsEntityToJson(DurationsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'duration': instance.duration,
      'price': instance.price,
    };

_$_DurationsResponse _$$_DurationsResponseFromJson(Map<String, dynamic> json) =>
    _$_DurationsResponse(
      (json['data'] as List<dynamic>)
          .map((e) => DurationsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DurationsResponseToJson(
        _$_DurationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
