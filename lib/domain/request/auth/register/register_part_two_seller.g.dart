// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_part_two_seller.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SocialAccountsAdapter extends TypeAdapter<SocialAccounts> {
  @override
  final int typeId = 72;

  @override
  SocialAccounts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SocialAccounts(
      name: fields[0] as String,
      type: fields[2] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SocialAccounts obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialAccountsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WorkDaysAdapter extends TypeAdapter<WorkDays> {
  @override
  final int typeId = 71;

  @override
  WorkDays read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkDays(
      day: fields[2] as String?,
      from: fields[0] as String?,
      to: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkDays obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.from)
      ..writeByte(1)
      ..write(obj.to)
      ..writeByte(2)
      ..write(obj.day);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkDaysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPartTwoSeller _$RegisterPartTwoSellerFromJson(
        Map<String, dynamic> json) =>
    RegisterPartTwoSeller(
      delivery: json['delivery'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      socialAccounts: (json['socialAccounts'] as List<dynamic>?)
          ?.map((e) => SocialAccounts.fromJson(e as Map<String, dynamic>))
          .toList(),
      logo: json['logo'] as String?,
      specialities: (json['specialities'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      workDays: (json['workDays'] as List<dynamic>?)
          ?.map((e) => WorkDays.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String?,
      latitude: json['latitude'] as String?,
      longutide: json['longutide'] as String?,
    );

Map<String, dynamic> _$RegisterPartTwoSellerToJson(
        RegisterPartTwoSeller instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'longutide': instance.longutide,
      'latitude': instance.latitude,
      'address': instance.address,
      'socialAccounts': instance.socialAccounts,
      'workDays': instance.workDays,
      'seasons': instance.seasons,
      'specialities': instance.specialities,
      'price': instance.price,
      'delivery': instance.delivery,
    };

SocialAccounts _$SocialAccountsFromJson(Map<String, dynamic> json) =>
    SocialAccounts(
      name: json['name'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$SocialAccountsToJson(SocialAccounts instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'type': instance.type,
    };

WorkDays _$WorkDaysFromJson(Map<String, dynamic> json) => WorkDays(
      day: json['day'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$WorkDaysToJson(WorkDays instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'day': instance.day,
    };
