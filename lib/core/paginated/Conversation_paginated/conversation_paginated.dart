
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/entities/chat_entity/conversation_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_paginated.freezed.dart';
part 'conversation_paginated.g.dart';

@freezed
class ConversationPaginated with _$ConversationPaginated {
  factory ConversationPaginated({required List<ConversationEntity> data, Meta ?meta}) = _ConversationPaginated;
	
  factory ConversationPaginated.fromJson(Map<String, dynamic> json) =>
			_$ConversationPaginatedFromJson(json);
}
