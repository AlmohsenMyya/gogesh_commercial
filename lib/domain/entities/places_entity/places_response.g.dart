// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlacesAdapter extends TypeAdapter<Places> {
  @override
  final int typeId = 99;

  @override
  Places read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Places.Home_Baner;
      case 1:
        return Places.Home_Flash;
      case 2:
        return Places.Sectors_Baner;
      case 3:
        return Places.Ads_Screen;
      case 4:
        return Places.Search_Baner;
      case 5:
        return Places.Sector_Flash;
      case 6:
        return Places.Sector_Baner;
      case 7:
        return Places.Notification;
      default:
        return Places.Home_Baner;
    }
  }

  @override
  void write(BinaryWriter writer, Places obj) {
    switch (obj) {
      case Places.Home_Baner:
        writer.writeByte(0);
        break;
      case Places.Home_Flash:
        writer.writeByte(1);
        break;
      case Places.Sectors_Baner:
        writer.writeByte(2);
        break;
      case Places.Ads_Screen:
        writer.writeByte(3);
        break;
      case Places.Search_Baner:
        writer.writeByte(4);
        break;
      case Places.Sector_Flash:
        writer.writeByte(5);
        break;
      case Places.Sector_Baner:
        writer.writeByte(6);
        break;
      case Places.Notification:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesEntity _$PlacesEntityFromJson(Map<String, dynamic> json) => PlacesEntity(
      id: json['id'] as int,
      place: $enumDecodeNullable(_$PlacesEnumMap, json['place']),
      price: double.tryParse(json['price'] ?? ' ' ),
    );

Map<String, dynamic> _$PlacesEntityToJson(PlacesEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'place': _$PlacesEnumMap[instance.place],
      'price': instance.price,
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

_$_PlacesResponse _$$_PlacesResponseFromJson(Map<String, dynamic> json) =>
    _$_PlacesResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => PlacesEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlacesResponseToJson(_$_PlacesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
