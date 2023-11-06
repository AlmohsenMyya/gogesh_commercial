import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_response.g.dart';

@JsonSerializable()
class ConversationEntity extends Params {
  ConversationEntity({
    required this.offerId,
    required this.adId,
    required this.adTitle,
    required this.offerTitle,
    required this.supportId,
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.avatar,
    required this.createdAt,
    required this.unread,
    required this.sellerId,
  });

  final int? id;
  @JsonKey(name: "seller_id")
  final int? sellerId;
  @JsonKey(name: "offer_id")
  final int? offerId;
  @JsonKey(name: "ad_id")
  final int? adId;
  @JsonKey(name: "last_message")
  String? lastMessage;
  @JsonKey(name: "ad_title")
  final String? adTitle;
  @JsonKey(name: "offer_title")
  final String? offerTitle;

  @JsonKey(name: "support_id")
  final int? supportId;
  final String? name;
  int? unread;
  final String? avatar;
  @JsonKey(name: "created_at")
  final String? createdAt;

  Map<String, dynamic> toJson() => _$ConversationEntityToJson(this);

  factory ConversationEntity.fromJson(Map<String, dynamic> json) =>
      _$ConversationEntityFromJson(json);

  @override
  List<Object?> get props => [];
}
