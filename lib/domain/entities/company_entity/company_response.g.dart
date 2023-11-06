// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyEntityAdapter extends TypeAdapter<CompanyEntity> {
  @override
  final int typeId = 70;

  @override
  CompanyEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyEntity(
      name: fields[1] as String?,
      status: fields[20] as String?,
      description: fields[2] as String?,
      commercialNumber: fields[12] as String?,
      type: fields[11] as String?,
      delivery: fields[9] as bool?,
      deliveryValue: fields[10] as double?,
      socialAccounts: (fields[14] as List?)?.cast<SocialAccounts>(),
      activity: fields[6] as StandarEntity?,
      speciality: fields[7] as StandarEntity?,
      sector: fields[5] as StandarEntity?,
      commercialRegister: fields[16] as String?,
      phone: fields[3] as String?,
      workDays: (fields[13] as List?)?.cast<WorkDays>(),
      commercialSignature: fields[17] as String?,
      address: fields[4] as String?,
      logo: fields[15] as String?,
      season: (fields[8] as List?)?.cast<StandarEntity>(),
      verification: fields[18] as String?,
      actived: fields[19] as bool?,
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyEntity obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.sector)
      ..writeByte(6)
      ..write(obj.activity)
      ..writeByte(7)
      ..write(obj.speciality)
      ..writeByte(8)
      ..write(obj.season)
      ..writeByte(9)
      ..write(obj.delivery)
      ..writeByte(10)
      ..write(obj.deliveryValue)
      ..writeByte(11)
      ..write(obj.type)
      ..writeByte(12)
      ..write(obj.commercialNumber)
      ..writeByte(13)
      ..write(obj.workDays)
      ..writeByte(14)
      ..write(obj.socialAccounts)
      ..writeByte(15)
      ..write(obj.logo)
      ..writeByte(16)
      ..write(obj.commercialRegister)
      ..writeByte(17)
      ..write(obj.commercialSignature)
      ..writeByte(18)
      ..write(obj.verification)
      ..writeByte(19)
      ..write(obj.actived)
      ..writeByte(20)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyResponse _$CompanyResponseFromJson(Map<String, dynamic> json) =>
    CompanyResponse(
      data: CompanyEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyResponseToJson(CompanyResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CompanyEntity _$CompanyEntityFromJson(Map<String, dynamic> json) =>
    CompanyEntity(
      name: json['name'] as String?,
      status: json['status'] as String?,
      description: json['description'] as String?,
      commercialNumber: json['commercial_number'] as String?,
      type: json['type'] as String?,
      delivery: json['delivery'] as bool?,
      deliveryValue: (json['delivery_value'] as num?)?.toDouble(),
      socialAccounts: (json['social_accounts'] as List<dynamic>?)
          ?.map((e) => SocialAccounts.fromJson(e as Map<String, dynamic>))
          .toList(),
      activity: json['activity'] == null
          ? null
          : StandarEntity.fromJson(json['activity'] as Map<String, dynamic>),
      speciality: json['speciality'] == null
          ? null
          : StandarEntity.fromJson(json['speciality'] as Map<String, dynamic>),
      sector: json['sector'] == null
          ? null
          : StandarEntity.fromJson(json['sector'] as Map<String, dynamic>),
      commercialRegister: json['commercial_register'] as String?,
      phone: json['phone'] as String?,
      workDays: (json['work_days'] as List<dynamic>?)
          ?.map((e) => WorkDays.fromJson(e as Map<String, dynamic>))
          .toList(),
      commercialSignature: json['commercial_signature'] as String?,
      address: json['address'] as String?,
      logo: json['logo'] as String?,
      season: (json['season'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      verification: json['verification'] as String?,
      actived: json['actived'] as bool?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$CompanyEntityToJson(CompanyEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'phone': instance.phone,
      'address': instance.address,
      'sector': instance.sector,
      'activity': instance.activity,
      'speciality': instance.speciality,
      'season': instance.season,
      'delivery': instance.delivery,
      'delivery_value': instance.deliveryValue,
      'type': instance.type,
      'commercial_number': instance.commercialNumber,
      'work_days': instance.workDays,
      'social_accounts': instance.socialAccounts,
      'logo': instance.logo,
      'commercial_register': instance.commercialRegister,
      'commercial_signature': instance.commercialSignature,
      'verification': instance.verification,
      'actived': instance.actived,
      'status': instance.status,
    };
