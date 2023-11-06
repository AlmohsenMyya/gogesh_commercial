// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_social_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditSocialAccounttRequest _$EditSocialAccounttRequestFromJson(
        Map<String, dynamic> json) =>
    EditSocialAccounttRequest(
      socialAccounts: (json['social_accounts'] as List<dynamic>)
          .map((e) => SocialAccounts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EditSocialAccounttRequestToJson(
        EditSocialAccounttRequest instance) =>
    <String, dynamic>{
      'social_accounts': instance.socialAccounts,
    };
