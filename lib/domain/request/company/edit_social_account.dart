import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_social_account.g.dart';

@JsonSerializable()
class EditSocialAccounttRequest extends Params {
  const EditSocialAccounttRequest({
    required this.socialAccounts,
  });

  @JsonKey(name: "social_accounts")
  final List<SocialAccounts> socialAccounts;

  factory EditSocialAccounttRequest.fromJson(Map<String, dynamic> json) =>
      _$EditSocialAccounttRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EditSocialAccounttRequestToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
