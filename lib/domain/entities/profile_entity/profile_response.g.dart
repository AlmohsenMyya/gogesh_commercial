// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileEntityAdapter extends TypeAdapter<ProfileEntity> {
  @override
  final int typeId = 23;

  @override
  ProfileEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileEntity(
      country: fields[9] as String?,
      image: fields[12] as String?,
      city: fields[10] as String?,
      region: fields[11] as String?,
      id: fields[0] as int?,
      firstName: fields[1] as String?,
      lastName: fields[3] as String?,
      email: fields[4] as String?,
      phone: fields[6] as String?,
      active: fields[7] as bool?,
      createdAt: fields[2] as String?,
      pic: fields[5] as String?,
      activityId: fields[17] as StandarEntity?,
      sectorId: fields[19] as StandarEntity?,
      subSectorId: fields[18] as StandarEntity?,
      upgraded: fields[15] as Upgraded?,
      verification: fields[16] as bool?,
      type: fields[22] as String?,
      commerialActivityDescription: fields[20] as String?,
      commerialActivityName: fields[14] as String?,
      commerialActivityPhone: fields[21] as String?,
      sectionsId: (fields[24] as List?)?.cast<StandarEntity>(),
      servicesId: (fields[23] as List?)?.cast<StandarEntity>(),
      civilCard: fields[25] as String?,
      lisence: fields[27] as String?,
      signature: fields[26] as String?,
      reason: fields[28] as String?,
      actived: fields[29] as bool?,
      status: fields[8] as String?,
      completed: fields[13] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileEntity obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.pic)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.active)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.country)
      ..writeByte(10)
      ..write(obj.city)
      ..writeByte(11)
      ..write(obj.region)
      ..writeByte(12)
      ..write(obj.image)
      ..writeByte(13)
      ..write(obj.completed)
      ..writeByte(14)
      ..write(obj.commerialActivityName)
      ..writeByte(15)
      ..write(obj.upgraded)
      ..writeByte(16)
      ..write(obj.verification)
      ..writeByte(17)
      ..write(obj.activityId)
      ..writeByte(18)
      ..write(obj.subSectorId)
      ..writeByte(19)
      ..write(obj.sectorId)
      ..writeByte(20)
      ..write(obj.commerialActivityDescription)
      ..writeByte(21)
      ..write(obj.commerialActivityPhone)
      ..writeByte(22)
      ..write(obj.type)
      ..writeByte(23)
      ..write(obj.servicesId)
      ..writeByte(24)
      ..write(obj.sectionsId)
      ..writeByte(25)
      ..write(obj.civilCard)
      ..writeByte(26)
      ..write(obj.signature)
      ..writeByte(27)
      ..write(obj.lisence)
      ..writeByte(28)
      ..write(obj.reason)
      ..writeByte(29)
      ..write(obj.actived);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UpgradedAdapter extends TypeAdapter<Upgraded> {
  @override
  final int typeId = 102;

  @override
  Upgraded read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Upgraded(
      deliveryPrice: fields[6] as double?,
      logo: fields[1] as String?,
      seasonsId: (fields[3] as List?)?.cast<StandarEntity>(),
      upgradedStatus: fields[0] as String?,
      socialAccounts: (fields[5] as List?)?.cast<SocialAccounts>(),
      specialitiesId: (fields[2] as List?)?.cast<StandarEntity>(),
      workDays: (fields[4] as List?)?.cast<WorkDays>(),
    );
  }

  @override
  void write(BinaryWriter writer, Upgraded obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.upgradedStatus)
      ..writeByte(1)
      ..write(obj.logo)
      ..writeByte(2)
      ..write(obj.specialitiesId)
      ..writeByte(3)
      ..write(obj.seasonsId)
      ..writeByte(4)
      ..write(obj.workDays)
      ..writeByte(5)
      ..write(obj.socialAccounts)
      ..writeByte(6)
      ..write(obj.deliveryPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpgradedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      data: ProfileEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AssistantResponse _$AssistantResponseFromJson(Map<String, dynamic> json) =>
    AssistantResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ProfileEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssistantResponseToJson(AssistantResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) =>
    ProfileEntity(
      country: json['country'] as String?,
      image: json['image'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      active: json['active'] as bool?,
      createdAt: json['created_at'] as String?,
      pic: json['pic'] as String?,
      activityId: json['activity_id'] == null
          ? null
          : StandarEntity.fromJson(json['activity_id'] as Map<String, dynamic>),
      sectorId: json['sector_id'] == null
          ? null
          : StandarEntity.fromJson(json['sector_id'] as Map<String, dynamic>),
      subSectorId: json['sub_sector_id'] == null
          ? null
          : StandarEntity.fromJson(
              json['sub_sector_id'] as Map<String, dynamic>),
      upgraded: json['upgraded'] == null
          ? null
          : Upgraded.fromJson(json['upgraded'] as Map<String, dynamic>),
      verification: json['verification'] as bool?,
      type: json['type'] as String?,
      commerialActivityDescription:
          json['commercial_activity_description'] as String?,
      commerialActivityName: json['commercial_activity_name'] as String?,
      commerialActivityPhone: json['commercial_activity_phone'] as String?,
      sectionsId: (json['sections_id'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      servicesId: (json['services_id'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      civilCard: json['civil_card'] as String?,
      lisence: json['commercial_license'] as String?,
      signature: json['signature_approval'] as String?,
      reason: json['reason'] as String?,
      actived: json['actived'] as bool?,
      status: json['status'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$ProfileEntityToJson(ProfileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'created_at': instance.createdAt,
      'last_name': instance.lastName,
      'email': instance.email,
      'pic': instance.pic,
      'phone': instance.phone,
      'active': instance.active,
      'status': instance.status,
      'country': instance.country,
      'city': instance.city,
      'region': instance.region,
      'image': instance.image,
      'completed': instance.completed,
      'commercial_activity_name': instance.commerialActivityName,
      'upgraded': instance.upgraded,
      'verification': instance.verification,
      'activity_id': instance.activityId,
      'sub_sector_id': instance.subSectorId,
      'sector_id': instance.sectorId,
      'commercial_activity_description': instance.commerialActivityDescription,
      'commercial_activity_phone': instance.commerialActivityPhone,
      'type': instance.type,
      'services_id': instance.servicesId,
      'sections_id': instance.sectionsId,
      'civil_card': instance.civilCard,
      'signature_approval': instance.signature,
      'commercial_license': instance.lisence,
      'reason': instance.reason,
      'actived': instance.actived,
    };

Upgraded _$UpgradedFromJson(Map<String, dynamic> json) => Upgraded(
  deliveryPrice: double.tryParse(json['delivery_price'] as String? ?? ''),
      logo: json['logo'] as String?,
      seasonsId: (json['seasons_id'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      upgradedStatus: json['upgraded_status'] as String?,
      socialAccounts: (json['social_accounts'] as List<dynamic>?)
          ?.map((e) => SocialAccounts.fromJson(e as Map<String, dynamic>))
          .toList(),
      specialitiesId: (json['specialities_id'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      workDays: (json['work_days'] as List<dynamic>?)
          ?.map((e) => WorkDays.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpgradedToJson(Upgraded instance) => <String, dynamic>{
      'upgraded_status': instance.upgradedStatus,
      'logo': instance.logo,
      'specialities_id': instance.specialitiesId,
      'seasons_id': instance.seasonsId,
      'work_days': instance.workDays,
      'social_accounts': instance.socialAccounts,
      'delivery_price': instance.deliveryPrice,
    };
