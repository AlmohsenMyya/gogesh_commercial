import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_email_request.g.dart';

@JsonSerializable()
class EditEmailRequest extends Params {
  const EditEmailRequest({
    required this.email,
  });

  final String? email;

  factory EditEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$EditEmailRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EditEmailRequestToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
