import 'package:commmercial_directory_seller/data/auth_data_source/auth_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../../app/locator.dart';
import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../core/utils/model_id.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../request/auth/register/register_social_request.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SignInFacebookUseCase extends UseCase<UserCredential, NoParams> {
  SignInFacebookUseCase(
      {required this.dataSource, required this.localDataSource});
  final AuthRemoteDataSource dataSource;
  final LocalDataSource localDataSource;
  @override
  Future<Result<UserCredential, Exceptions>> call(
    NoParams params,
  ) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final result = await dataSource.registerLoginGoogle(
        registerGoogleRequest: RegisterSocialRequest(
            fcmToken: await firebaseMessaging.getToken(),
            accessToken: facebookAuthCredential.accessToken!,
            provider: "facebook"),
      );
      final profile = result.data["seller"];

      await localDataSource.setValue<ProfileEntity>(
          LocalDataKeys.profile,
          ProfileEntity(
              id: profile["id"],
              firstName: profile["first_name"],
              createdAt: profile["created_at"],
              lastName: profile["last_name"],
              email: profile["email"],
              phone: profile["phone"],
              status: profile["status"],
              country: profile['country'],
              city: profile['city'],
              region: profile['region'],
              completed: profile['completed'],
              image: profile["image"]));

      await localDataSource.setValue(
          LocalDataKeys.accessToken, result.data['token']);
      await localDataSource.setValue(
          LocalDataKeys.userType, UserType.authenticated);
      return const Result.success();
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
      return const Result.failure(
          error: Exceptions.other("something_with_wrong"));
    }
    return const Result.failure(error: Exceptions.other("something_with_tron"));
  }
}
