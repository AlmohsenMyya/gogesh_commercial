// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfferDetailsRasponseAdapter extends TypeAdapter<OfferDetailsRasponse> {
  @override
  final int typeId = 36;

  @override
  OfferDetailsRasponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfferDetailsRasponse(
      data: fields[0] as OfferEntity,
    );
  }

  @override
  void write(BinaryWriter writer, OfferDetailsRasponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferDetailsRasponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OfferEntityAdapter extends TypeAdapter<OfferEntity> {
  @override
  final int typeId = 30;

  @override
  OfferEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfferEntity(
      price: fields[1] as double?,
      id: fields[0] as int?,
      title: fields[2] as String?,
      description: fields[4] as String?,
      bold: fields[5] as bool?,
      images: (fields[7] as List?)?.cast<String>(),
      views: fields[6] as int?,
      createdAt: fields[3] as String?,
      activity: fields[10] as StandarEntity?,
      discount: fields[8] as int?,
      duration: fields[13] as DurationsEntity?,
      season: fields[12] as StandarEntity?,
      sector: fields[9] as StandarEntity?,
      speciality: fields[11] as StandarEntity?,
      condition: fields[14] as String?,
      reason: fields[16] as String?,
      reasonUpdated: fields[18] as String?,
      status: fields[15] as String?,
      updatedId: fields[17] as int?,
      total: fields[19] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, OfferEntity obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.bold)
      ..writeByte(6)
      ..write(obj.views)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.discount)
      ..writeByte(9)
      ..write(obj.sector)
      ..writeByte(10)
      ..write(obj.activity)
      ..writeByte(11)
      ..write(obj.speciality)
      ..writeByte(12)
      ..write(obj.season)
      ..writeByte(13)
      ..write(obj.duration)
      ..writeByte(14)
      ..write(obj.condition)
      ..writeByte(15)
      ..write(obj.status)
      ..writeByte(16)
      ..write(obj.reason)
      ..writeByte(17)
      ..write(obj.updatedId)
      ..writeByte(18)
      ..write(obj.reasonUpdated)
      ..writeByte(19)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferDetailsRasponse _$OfferDetailsRasponseFromJson(
        Map<String, dynamic> json) =>
    OfferDetailsRasponse(
      data: OfferEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfferDetailsRasponseToJson(
        OfferDetailsRasponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

OfferEntity _$OfferEntityFromJson(Map<String, dynamic> json) => OfferEntity(
      price: (json['price'] as num?)?.toDouble(),
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      bold: json['bold'] as bool?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      views: json['views'] as int?,
      createdAt: json['created_at'] as String?,
      activity: json['activity'] == null
          ? null
          : StandarEntity.fromJson(json['activity'] as Map<String, dynamic>),
      discount: json['discount'] as int?,
      duration: json['duration'] == null
          ? null
          : DurationsEntity.fromJson(json['duration'] as Map<String, dynamic>),
      season: json['season'] == null
          ? null
          : StandarEntity.fromJson(json['season'] as Map<String, dynamic>),
      sector: json['sector'] == null
          ? null
          : StandarEntity.fromJson(json['sector'] as Map<String, dynamic>),
      speciality: json['speciality'] == null
          ? null
          : StandarEntity.fromJson(json['speciality'] as Map<String, dynamic>),
      condition: json['condition'] as String?,
      reason: json['reason'] as String?,
      reasonUpdated: json['reason_updated'] as String?,
      status: json['status'] as String?,
      updatedId: json['updated_id'] as int?,
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OfferEntityToJson(OfferEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'title': instance.title,
      'created_at': instance.createdAt,
      'description': instance.description,
      'bold': instance.bold,
      'views': instance.views,
      'images': instance.images,
      'discount': instance.discount,
      'sector': instance.sector,
      'activity': instance.activity,
      'speciality': instance.speciality,
      'season': instance.season,
      'duration': instance.duration,
      'condition': instance.condition,
      'status': instance.status,
      'reason': instance.reason,
      'updated_id': instance.updatedId,
      'reason_updated': instance.reasonUpdated,
      'total': instance.total,
    };
