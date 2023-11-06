// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialAccountEntity _$SocialAccountEntityFromJson(Map<String, dynamic> json) =>
    SocialAccountEntity(
      socilaAccount: (json['social_accounts'] as List<dynamic>?)
          ?.map((e) => SocialAccounts.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$SocialAccountEntityToJson(
        SocialAccountEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'social_accounts': instance.socilaAccount,
    };

_$_SocialAccountResponse _$$_SocialAccountResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SocialAccountResponse(
      data: SocialAccountEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SocialAccountResponseToJson(
        _$_SocialAccountResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
