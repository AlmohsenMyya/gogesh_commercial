import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest extends Params {
  const ResetPasswordRequest(
      {required this.code,
      required this.password,
      required this.passwordConfirm});
  final String code;
  final String password;
  @JsonKey(name: "password_confirmation")
  final String passwordConfirm;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);

  @override
  List<Object?> get props => [];
}
