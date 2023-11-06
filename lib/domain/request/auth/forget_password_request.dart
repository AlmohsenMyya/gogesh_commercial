
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_request.g.dart';

@JsonSerializable()
class ForgetPasswordRequest extends Params {
  const ForgetPasswordRequest({
    required this.email,
  });
  final String email;

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);

  @override
  List<Object?> get props => [email];
}
