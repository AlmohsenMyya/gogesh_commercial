
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_check_request.g.dart';



@JsonSerializable()
class PasswordCheckRequest extends Params {
  const PasswordCheckRequest({
    required this.code,
  });
  final String code;

  factory PasswordCheckRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordCheckRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PasswordCheckRequestToJson(this);

  @override
  List<Object?> get props => [code];
}