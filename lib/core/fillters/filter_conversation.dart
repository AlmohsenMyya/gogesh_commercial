
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_conversation.g.dart';

@JsonSerializable()
class FilterConversation extends Params {
  factory FilterConversation.fromJson(Map<String, dynamic> json) => _$FilterConversationFromJson(json);

  Map<String, dynamic> toJson() => _$FilterConversationToJson(this);

  final String? type;

  const FilterConversation({this.type});

  @override
  List<Object?> get props => [type];
}