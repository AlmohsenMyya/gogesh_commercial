
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'company_response.dart';

part 'social_account_response.freezed.dart';
part 'social_account_response.g.dart';

@freezed
class SocialAccountResponse with _$SocialAccountResponse {
  factory SocialAccountResponse({required SocialAccountEntity data}) = _SocialAccountResponse;
	
  factory SocialAccountResponse.fromJson(Map<String, dynamic> json) =>
			_$SocialAccountResponseFromJson(json);
}
@JsonSerializable()
class SocialAccountEntity {
  const SocialAccountEntity({
    required this.socilaAccount,
    required this.id,
  });
  final int? id;
  @JsonKey(name: "social_accounts")
  final List<SocialAccounts>? socilaAccount;

  factory SocialAccountEntity.fromJson(Map<String, dynamic> json) =>
      _$SocialAccountEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SocialAccountEntityToJson(this);
}