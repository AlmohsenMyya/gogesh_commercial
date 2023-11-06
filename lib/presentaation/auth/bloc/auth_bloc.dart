import 'dart:async';

import 'package:commmercial_directory_seller/core/bloc/error.dart';
import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/request/auth/forget_password_request.dart';
import 'package:commmercial_directory_seller/domain/request/email/confirm_email_request.dart';
import 'package:commmercial_directory_seller/domain/request/email/resend_email_confirmation_code.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/check_password_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/completed_profile_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/login_assistant_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/login_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/register_primary_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/auth/reset_password_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/email/confirm_email_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/email/resend_email_confirmation_code_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils.dart';
import '../../../domain/request/auth/login/login_request.dart';
import '../../../domain/request/auth/password_check_request.dart';
import '../../../domain/request/auth/register/register_primary_seller.dart';
import '../../../domain/request/auth/reset_password_request.dart';
import '../../../domain/usecase/auth/forget_password_use_case.dart';
import '../../../domain/usecase/register_company/register_company_usecase.dart';
// import '../../../domain/usecase/auth/sign_in_with_google_use_case.dart';
import '../../../domain/usecase/auth/sign_in_with_google_use_case.dart';
import '../../../domain/usecase/auth/sign_in_with_facebook_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInGoogleUseCase signInGoogleUseCase;
  final SignInFacebookUseCase signInFacebookUseCase;
  final RegisterCompanyUseCase registerCompanyUseCase;
  final RegisterPrimarySellerUseCase registerPrimarySellerUseCase;
  final LoginUseCase loginUseCase;
  final CompleteProfileUseCase completeProfileUseCase;
  final ConfirmEmailUseCase confirmEmailUseCase;
  final ResendEmailConfirmationCodeUseCase resendEmailConfirmationCodeUseCase;
  final CheckPasswordUseCase checkPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final LoginAssistantUseCase loginAssistantUseCase;
  AuthBloc({
    required this.loginAssistantUseCase,
    required this.confirmEmailUseCase,
    required this.resendEmailConfirmationCodeUseCase,
    required this.signInGoogleUseCase,
    required this.signInFacebookUseCase,
    required this.registerCompanyUseCase,
    required this.registerPrimarySellerUseCase,
    required this.loginUseCase,
    required this.checkPasswordUseCase,
    required this.forgetPasswordUseCase,
    required this.completeProfileUseCase,
    required this.resetPasswordUseCase,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>(_mapEventToState);
  }
  FutureOr _mapEventToState(AuthEvent event, Emitter<AuthState> emit) async {
    return event.map(
      forgetpassword: (data) async {
        emit(const AuthState.loading());
        var result = await forgetPasswordUseCase(
          data.request,
        );
        return emit(result.when(
            failure: (error) =>
                AuthState.error(error: error?.localizedErrorMessage),
            success: (s) => AuthState.success(msg: s)));
      },
      checkPassword: (data) async {
        emit(const AuthState.loading());
        var result = await checkPasswordUseCase(
          data.request,
        );
        return emit(result.when(
            failure: (error) =>
                AuthState.error(error: error?.localizedErrorMessage),
            success: (s) => AuthState.success(msg: s)));
      },
      resetpassword: (data) async {
        emit(const AuthState.loading());
        var result = await resetPasswordUseCase(
          data.request,
        );
        return emit(result.when(
            failure: (error) => AuthState.error(
                error: error?.getException.localizedErrorMessage),
            success: (s) => AuthState.success(msg: s)));
      },
      completeRegister: (value) async {
        emit(const AuthState.loading());
        var result = await completeProfileUseCase(value.request);
        return emit(result.when(
            failure: (error) {
              return error!.maybeWhen(
                orElse: () =>
                    AuthState.error(error: error.localizedErrorMessage),
              );
            },
            success: (s) => const AuthState.profileCompleted()));
      },
      signUpGoogle: (social) async {
        emit(const AuthState.socialLoading());
        var result = await signInGoogleUseCase(
          NoParams(),
        );
        return emit(result.when(
            failure: (error) =>
                AuthState.error(error: error?.localizedErrorMessage),
            success: (s) => const AuthState.socialRegistered()));
      },
      signUpFacebook: (value) async {
        emit(const AuthState.socialLoading());
        var result = await signInFacebookUseCase(
          NoParams(),
        );
        return emit(result.when(
            failure: (error) =>
                AuthState.error(error: error?.localizedErrorMessage),
            success: (s) => const AuthState.socialRegistered()));
      },
      registerPrimary: (request) async {
        emit(const AuthState.socialLoading());
        var result = await registerPrimarySellerUseCase(
          request.request,
        );
        return emit(result.when(
            failure: (error) {
              return error!.maybeWhen(
                  orElse: () =>
                      AuthState.error(error: error.localizedErrorMessage),
                  emailInvalude: (data) =>
                      AuthState.emailError(error: error.localizedErrorMessage),
                  passwordInvalude: (data) => AuthState.passworderror(
                      error: error.localizedErrorMessage));
            },
            success: (s) => const AuthState.registered(msg: '')));
      },
      confirmEmail: (value) async {
        emit(const AuthState.loading());
        var result = await confirmEmailUseCase(
            ConfirmEmailRequest(email: value.email, code: value.code));
        return emit(result.when(
            failure: (error) {
              return error!.maybeWhen(
                invalidConfirmationCode: (data) => AuthState.error(
                    errorState: ErrorState.other(message: data)),
                orElse: () =>
                    AuthState.error(error: error.localizedErrorMessage),
              );
            },
            success: (s) => const AuthState.emailConfirmed()));
      },
      resendEmailConfirmationCode: (value) async {
        emit(const AuthState.resendingEmail());
        var result = await resendEmailConfirmationCodeUseCase(
            ResendEmailConfirmationCode(
          email: value.email,
          type: 'sellers',
        ));
        return emit(
          result.when(
            failure: (error) {
              return error!.maybeWhen(
                orElse: () =>
                    AuthState.error(error: error.localizedErrorMessage),
              );
            },
            success: (s) => const AuthState.emailValid(),
          ),
        );
      },
      login: (request) async {
        emit(const AuthState.loading());

        var result = await loginUseCase(
          request.request,
        );
        return emit(result.when(
            failure: (error) {
              return error!.maybeWhen(
                  orElse: () =>
                      AuthState.error(error: error.localizedErrorMessage),
                  emailInvalude: (data) =>
                      AuthState.emailError(error: error.localizedErrorMessage),
                  passwordInvalude: (data) => AuthState.passworderror(
                      error: error.localizedErrorMessage));
            },
            success: (s) => AuthState.logedIn(commercialActivity: s ?? false)));
      },
      loginAssistant: (request) async {
        emit(const AuthState.loading());

        var result = await loginAssistantUseCase(
          request.request,
        );
        return emit(result.when(
            failure: (error) {
              return error!.maybeWhen(
                  orElse: () =>
                      AuthState.error(error: error.localizedErrorMessage),
                  emailInvalude: (data) =>
                      AuthState.emailError(error: error.localizedErrorMessage),
                  passwordInvalude: (data) => AuthState.passworderror(
                      error: error.localizedErrorMessage));
            },
            success: (s) => AuthState.logedIn(commercialActivity: s ?? true)));
      },
      resetState: (v) => emit(const AuthState.initial()),
      uploadImage: (value) async {
        var result = await pickImage(value.source);
        if (result != null) {
          emit(AuthState.imagePicked(image: result));
          print(result.path);
        } else {
          emit(AuthState.initial());
        }
      },
    );
  }
}
