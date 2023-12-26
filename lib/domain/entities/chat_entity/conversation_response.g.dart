// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationEntity _$ConversationEntityFromJson(Map<String, dynamic> json) =>
    ConversationEntity(
      offerId: int.tryParse(json['offer_id'].toString()),
      adId: int.tryParse(json['ad_id'].toString()),
      adTitle: json['ad_title'] as String?,
      offerTitle: json['offer_title'] as String?,
      supportId: json['support_id'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      lastMessage: json['last_message'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: json['created_at'] as String?,
      unread: json['unread'] as int?,
      sellerId: json['seller_id'] as int?,
    );

Map<String, dynamic> _$ConversationEntityToJson(ConversationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seller_id': instance.sellerId,
      'offer_id': instance.offerId,
      'ad_id': instance.adId,
      'last_message': instance.lastMessage,
      'ad_title': instance.adTitle,
      'offer_title': instance.offerTitle,
      'support_id': instance.supportId,
      'name': instance.name,
      'unread': instance.unread,
      'avatar': instance.avatar,
      'created_at': instance.createdAt,
    };
