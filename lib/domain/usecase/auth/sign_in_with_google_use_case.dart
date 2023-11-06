import 'dart:io';

import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/register_company_usecase.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../core/utils/model_id.dart';
import '../../../data/auth_data_source/auth_data_source.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../request/auth/register/register_social_request.dart';

class SignInGoogleUseCase extends UseCase<bool, NoParams> {
  SignInGoogleUseCase(
      {required this.dataSource, required this.localDataSource});
  final AuthRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  @override
  Future<Result<bool, Exceptions>> call(
    NoParams params,
  ) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // final Response =
      //     await FirebaseAuth.instance.signInWithCredential(credential);
      print(credential.accessToken!);
      final result = await dataSource.registerLoginGoogle(
          registerGoogleRequest: RegisterSocialRequest(
            fcmToken:await firebaseMessaging.getToken(),
              accessToken: credential.accessToken!, provider: "google"));
      final profile = result.data["seller"];
      await localDataSource.setValue<ProfileEntity>(
          LocalDataKeys.profile,
          ProfileEntity(
              id: profile["id"],
              image: profile["image"],
              firstName: profile["first_name"],
              createdAt: profile["created_at"],
              lastName: profile["last_name"],
              email: profile["email"],
              phone: profile["phone"],

              /// active: profile["active"],
              status: profile["status"],
              pic: profile["pic"],
              country: profile['country'],
              city: profile['city'],
              region: profile['region'],
              completed: profile['completed']));
      await localDataSource.setValue(
          LocalDataKeys.accessToken, result.response.data['token']);

      await localDataSource.setValue(LocalDataKeys.loggedIn, true);

      await localDataSource.setValue(
          LocalDataKeys.userType, UserType.authenticated);
      print(profile["commerialActivity"]);
      return Result.success(data: profile["commerialActivity"]);
    } on DioException catch (ex) {
      switch (ex.response?.statusCode ?? 0) {
        case 401:
          {
            return Result.failure(
                error:
                    Exceptions.passwordInvalude(ex.response!.data["message"]));
          }
        case 422:
          {
            return Result.failure(
                error: Exceptions.emailInvalude(ex.response!.data["message"]));
          }
      }
      if (ex.error is SocketException) {
        return const Result.failure(error: Exceptions.network(""));
      }
      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (ex) {
      print(ex.message);
      return Result.failure(error: Exceptions.other(ex.message));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "account-exists-with-different-credential":
          return const Result.failure(
              error: Exceptions.other('Location services are disabled.'));
        case "invalid-credential":
          return const Result.failure(
              error: Exceptions.other('Location services are disabled.'));
        case "operation-not-allowed":
          return const Result.failure(
              error: Exceptions.other('Location services are disabled.'));
        case "user-disabled":
          return const Result.failure(
              error: Exceptions.other('Location services are disabled.'));
        case "user-not-found":
          return const Result.failure(
              error: Exceptions.other('Location services are disabled.'));
        case "wrong-password":
          return const Result.failure(
              error: Exceptions.other('Location services are disabled.'));
        case "invalid-verification-code":
          return const Result.failure(
              error: Exceptions.other('Location services are disabled.'));
        case "invalid-verification-id":
          return const Result.failure(
              error: Exceptions.other('Location services are disabled.'));
      }
    } catch (e) {
      print(e);
      print("0000000000000000000000000000000000");
      return const Result.failure(
          error: Exceptions.other("something_with_wrong"));
    }
    return const Result.failure(error: Exceptions.other("something_with_tron"));
  }
}
