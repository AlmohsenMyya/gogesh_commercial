// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdsDetailsRasponseAdapter extends TypeAdapter<AdsDetailsRasponse> {
  @override
  final int typeId = 36;

  @override
  AdsDetailsRasponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdsDetailsRasponse(
      data: fields[0] as AdsEntity,
    );
  }

  @override
  void write(BinaryWriter writer, AdsDetailsRasponse obj) {
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
      other is AdsDetailsRasponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AdsEntityAdapter extends TypeAdapter<AdsEntity> {
  @override
  final int typeId = 45;

  @override
  AdsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdsEntity(
      id: fields[0] as int?,
      description: fields[2] as String?,
      images: fields[4] as String?,
      title: fields[1] as String?,
      price: fields[3] as double?,
      createdAt: fields[5] as String?,
      status: fields[7] as String?,
      views: fields[6] as int?,
      dateStart: fields[8] as String?,
      duration: fields[10] as int?,
      place: fields[9] as Places?,
      total: fields[11] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, AdsEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.images)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.views)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.dateStart)
      ..writeByte(9)
      ..write(obj.place)
      ..writeByte(10)
      ..write(obj.duration)
      ..writeByte(11)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsDetailsRasponse _$AdsDetailsRasponseFromJson(Map<String, dynamic> json) =>
    AdsDetailsRasponse(
      data: AdsEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdsDetailsRasponseToJson(AdsDetailsRasponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AdsEntity _$AdsEntityFromJson(Map<String, dynamic> json) => AdsEntity(
      id: json['id'] as int?,
      description: json['description'] as String?,
      images: json['images'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String?,
      status: json['status'] as String?,
      views: json['views'] as int?,
      dateStart: json['date_start'] as String?,
      duration: json['duration'] as int?,
      place: $enumDecodeNullable(_$PlacesEnumMap, json['place']),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AdsEntityToJson(AdsEntity instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
      'created_at': instance.createdAt,
      'views': instance.views,
      'status': instance.status,
      'date_start': instance.dateStart,
      'place': _$PlacesEnumMap[instance.place],
      'duration': instance.duration,
      'total': instance.total,
    };

const _$PlacesEnumMap = {
  Places.Home_Baner: 'Home_Baner',
  Places.Home_Flash: 'Home_Flash',
  Places.Sectors_Baner: 'Sectors_Baner',
  Places.Ads_Screen: 'Ads_Screen',
  Places.Search_Baner: 'Search_Baner',
  Places.Sector_Flash: 'Sector_Flash',
  Places.Sector_Baner: 'Sector_Baner',
  Places.Notification: 'Notification',
};
