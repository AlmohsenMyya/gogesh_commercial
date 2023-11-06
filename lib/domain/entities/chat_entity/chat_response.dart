import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'chat_response.g.dart';

@HiveType(typeId: 80)
@JsonSerializable()
class ChatEntity extends Params {
  ChatEntity({
    required this.isMe,
    required this.conversationId,
    this.id,
    required this.name,
    this.attachment,
    required this.message,
    required this.createdAt,
  });
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? message;
  @HiveField(3)
  final String? attachment;

  @JsonKey(name: "is_me")
  @HiveField(4)
  final bool? isMe;

  @HiveField(5)
  @JsonKey(name: "created_at")
  final String? createdAt;
  @HiveField(6)
  @JsonKey(name: "contact_id")
  final int? conversationId;

  Map<String, dynamic> toJson() => _$ChatEntityToJson(this);
  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);

  @override
  List<Object?> get props => [id, message];
}
