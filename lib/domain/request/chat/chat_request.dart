import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_request.g.dart';

@JsonSerializable()
class MakeContactRequest extends Params {
  const MakeContactRequest({
    required this.content,
    required this.subject,
  });

  final String content;
  final String subject;

  Map<String, dynamic> toJson() => _$MakeContactRequestToJson(this);
  factory MakeContactRequest.fromJson(Map<String, dynamic> json) =>
      _$MakeContactRequestFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [content, subject];
}

@JsonSerializable()
class SendMessageRequest extends Params {
  const SendMessageRequest(
      {required this.contactId,
      required this.message,
      this.attachement,
      this.socketID,
      this.type});

  @JsonKey(name: "contact_id")
  final int contactId;
  final String message;
  final String? type;
  final String? attachement;
  final String? socketID;

  Map<String, dynamic> toJson() => _$SendMessageRequestToJson(this);
  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestFromJson(json);

  @override
  List<Object?> get props => [contactId];
}
