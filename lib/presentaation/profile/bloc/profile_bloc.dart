import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_email_request.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_password_request.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/change_email_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/change_password_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/edit_profile_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/get_details_profile_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/profile/get_profile_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/entities/profile_entity/profile_response.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase? getProfileUseCase;
  final GetProfileDetailsUseCase? getProfileDetailsUseCase;
  final EditProfileUseCase? editProfileUseCase;
  final ChangePasswordUseCase? changePasswordUseCase;
  final ChangeEmailUseCase? changeEmailUseCase;
  ProfileBloc({
    this.changeEmailUseCase,
    this.getProfileUseCase,
    this.changePasswordUseCase,
    this.editProfileUseCase,
    this.getProfileDetailsUseCase,
  }) : super(const ProfileState.initial()) {
    on<ProfileEvent>((_mapEventToState));
  }
  FutureOr _mapEventToState(ProfileEvent event, Emitter<ProfileState> emit) {
    return event.map(
      changePassword: (value) async {
        emit(const ProfileState.loading());
        var result = await changePasswordUseCase!(value.request);
        return emit(
          result.when(
            failure: (error) =>
                ProfileState.error(error: error?.localizedErrorMessage),
            success: (s) => const ProfileState.succes(),
          ),
        );
      },
      loadDetailsProfile: (value) async {
        emit(const ProfileState.loadingDetails());
        var result = await getProfileDetailsUseCase!(NoParams());
        return emit(
          result.when(
              failure: (error) =>
                  ProfileState.error(error: error?.localizedErrorMessage),
              success: (s) => ProfileState.loadedDetailsProfile(data: s!)),
        );
      },
      changeEmail: (value) async {
        emit(const ProfileState.loading());
        var result = await changeEmailUseCase!(EditEmailRequest(
          email: value.email,
        ));
        return emit(
          result.when(
              failure: (error) =>
                  ProfileState.error(error: error?.localizedErrorMessage),
              success: (s) => const ProfileState.succes()),
        );
      },
      loadedProfile: (_) async {
        emit(const ProfileState.loading());
        var result = await getProfileUseCase!(NoParams());
        return emit(
          result.when(
              failure: (error) =>
                  ProfileState.error(error: error?.localizedErrorMessage),
              success: (s) => ProfileState.loaded(data: s!)),
        );
      },
      editProfile: (value) async {
        emit(const ProfileState.loading());
        var result = await editProfileUseCase!(value.request);
        return emit(
          result.when(
              failure: (error) =>
                  ProfileState.error(error: error?.localizedErrorMessage),
              success: (s) => const ProfileState.succes()),
        );
      },
    );
  }
}
