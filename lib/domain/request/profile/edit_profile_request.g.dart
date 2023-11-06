// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequest _$EditProfileRequestFromJson(Map<String, dynamic> json) =>
    EditProfileRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
      sectionId: (json['sectionId'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceId: (json['serviceId'] as List<dynamic>?)
          ?.map((e) => StandarEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      passwordConfirmation: json['passwordConfirmation'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      countryId: json['countryId'] as int?,
      cityId: json['cityId'] as int?,
      regionId: json['regionId'] as int?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      fcmToken: json['fcmToken'] as String?,
      phoneCommercial: json['phoneCommercial'] as String?,
      activityId: json['activityId'] as int?,
      civilCard: (json['civilCard'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lisence: json['lisence'] as String?,
      sectorId: json['sectorId'] as int?,
      singnature: json['singnature'] as String?,
      subSectors: json['subSectors'] as int?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      nameCommercial: json['nameCommercial'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$EditProfileRequestToJson(EditProfileRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'type': instance.type,
      'passwordConfirmation': instance.passwordConfirmation,
      'description': instance.description,
      'nameCommercial': instance.nameCommercial,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'gender': instance.gender,
      'phoneCommercial': instance.phoneCommercial,
      'serviceId': instance.serviceId,
      'sectionId': instance.sectionId,
      'countryId': instance.countryId,
      'cityId': instance.cityId,
      'regionId': instance.regionId,
      'sectorId': instance.sectorId,
      'activityId': instance.activityId,
      'subSectors': instance.subSectors,
      'civilCard': instance.civilCard,
      'lisence': instance.lisence,
      'singnature': instance.singnature,
      'country': instance.country,
      'city': instance.city,
      'region': instance.region,
      'fcmToken': instance.fcmToken,
      'reason': instance.reason,
    };
