// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubscriptionResponseAdapter extends TypeAdapter<SubscriptionResponse> {
  @override
  final int typeId = 29;

  @override
  SubscriptionResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubscriptionResponse(
      package: (fields[0] as List).cast<SubscriptionEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, SubscriptionResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.package);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscriptionResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubscriptionEntityAdapter extends TypeAdapter<SubscriptionEntity> {
  @override
  final int typeId = 25;

  @override
  SubscriptionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubscriptionEntity(
      id: fields[0] as int?,
      name: fields[1] as String?,
      duration: fields[4] as int?,
      features: (fields[3] as List?)?.cast<String>(),
      price: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, SubscriptionEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.features)
      ..writeByte(4)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscriptionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionResponse _$SubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionResponse(
      package: (json['data'] as List<dynamic>)
          .map((e) => SubscriptionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionResponseToJson(
        SubscriptionResponse instance) =>
    <String, dynamic>{
      'data': instance.package,
    };

SubscriptionEntity _$SubscriptionEntityFromJson(Map<String, dynamic> json) =>
    SubscriptionEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      duration: int.tryParse(json['duration'] ?? ''),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      price: double.parse(json['price'] ?? '0'),
    );

Map<String, dynamic> _$SubscriptionEntityToJson(SubscriptionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'features': instance.features,
      'duration': instance.duration,
    };
