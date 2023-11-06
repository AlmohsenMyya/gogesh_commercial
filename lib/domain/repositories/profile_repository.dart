import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_primary_seller.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_email_request.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_password_request.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';

abstract class ProfileRepository {
  Future<Result<ProfileResponse, Exceptions>> fetchProfile();
  Future<Result<String, Exceptions>> editProfile(EditProfileRequest params);
  Future<Result<String, Exceptions>> changePassword(EditPasswordRequest params);
  Future<Result<String, Exceptions>> changeEmail(EditEmailRequest params);
  Future<Result<ProfileResponse, Exceptions>> getdetailsProfile();
}
