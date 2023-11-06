// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_assistant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAssistantRequest _$AddAssistantRequestFromJson(Map<String, dynamic> json) =>
    AddAssistantRequest(
      firstname: json['firstname'] as String?,
      image: json['image'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['passwordConfirmation'] as String?,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$AddAssistantRequestToJson(
        AddAssistantRequest instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'phone': instance.phone,
      'lastname': instance.lastname,
      'image': instance.image,
      'email': instance.email,
      'password': instance.password,
      'fcmToken': instance.fcmToken,
      'passwordConfirmation': instance.passwordConfirmation,
    };
