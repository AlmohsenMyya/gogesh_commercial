import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'places_response.freezed.dart';
part 'places_response.g.dart';

@freezed
class PlacesResponse with _$PlacesResponse {
  factory PlacesResponse({required List<PlacesEntity> data}) = _PlacesResponse;

  factory PlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacesResponseFromJson(json);
}

@JsonSerializable()
class PlacesEntity {
  PlacesEntity({
    required this.id,
    required this.place,
    required this.price,
  });
  int id;
  Places? place;
  double? price;

  factory PlacesEntity.fromJson(Map<String, dynamic> json) =>
      _$PlacesEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PlacesEntityToJson(this);
}

@HiveType(typeId: 99)
enum Places {
  @HiveField(0)
  Home_Baner('Home_Baner'),
  @HiveField(1)
  Home_Flash('Home_Flash'),
  @HiveField(2)
  Sectors_Baner('Sectors_Baner'),
  @HiveField(3)
  Ads_Screen('Ads_Screen'),
  @HiveField(4)
  Search_Baner('Search_Baner'),
  @HiveField(5)
  Sector_Flash('Sector_Flash'),
  @HiveField(6)
  Sector_Baner('Sector_Baner'),
  @HiveField(7)
  Notification('Notification');

  const Places(this.name);

  final String name;
}
