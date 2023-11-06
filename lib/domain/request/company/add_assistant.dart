import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_assistant.g.dart';

@JsonSerializable()
class AddAssistantRequest extends Params {
  const AddAssistantRequest({
    required this.firstname,
    required this.image,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this. fcmToken
  });

  final String? firstname;
  final String? phone;
  final String? lastname;
  final String? image;
  final String? email;
  final String? password;
  final String? fcmToken;

  final String? passwordConfirmation;

  factory AddAssistantRequest.fromJson(Map<String, dynamic> json) =>
      _$AddAssistantRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddAssistantRequestToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
