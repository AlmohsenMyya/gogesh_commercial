// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeContactRequest _$MakeContactRequestFromJson(Map<String, dynamic> json) =>
    MakeContactRequest(
      content: json['content'] as String,
      subject: json['subject'] as String,
    );

Map<String, dynamic> _$MakeContactRequestToJson(MakeContactRequest instance) =>
    <String, dynamic>{
      'content': instance.content,
      'subject': instance.subject,
    };

SendMessageRequest _$SendMessageRequestFromJson(Map<String, dynamic> json) =>
    SendMessageRequest(
      contactId: json['contact_id'] as int,
      message: json['message'] as String,
      attachement: json['attachement'] as String?,
      socketID: json['socketID'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$SendMessageRequestToJson(SendMessageRequest instance) =>
    <String, dynamic>{
      'contact_id': instance.contactId,
      'message': instance.message,
      'type': instance.type,
      'attachement': instance.attachement,
      'socketID': instance.socketID,
    };
