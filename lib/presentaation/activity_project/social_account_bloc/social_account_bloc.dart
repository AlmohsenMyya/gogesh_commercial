import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/social_account_response.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_social_account.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/edit_social_account_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/get_social_account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_account_event.dart';
part 'social_account_state.dart';
part 'social_account_bloc.freezed.dart';

class SocialAccountBloc extends Bloc<SocialAccountEvent, SocialAccountState> {
  final GetSocialAccountUseCase getSocialAccountUseCase;
  final EditSocialAccountUseCase editSocialAccountUseCase;
  SocialAccountBloc(
      {required this.getSocialAccountUseCase,
      required this.editSocialAccountUseCase})
      : super(_Initial()) {
    on<SocialAccountEvent>(_mapEventToState);
  }
  FutureOr<dynamic> _mapEventToState(
      SocialAccountEvent event, Emitter<SocialAccountState> emit) async {
    return event.map(
      load: (value) async {
        emit(const SocialAccountState.loading());
        var result = await getSocialAccountUseCase(NoParams());

        return emit(
          result.when(
            failure: (error) =>
                SocialAccountState.error(error: error?.localizedErrorMessage),
            success: (s) {
              return SocialAccountState.dataLoaded(data: s!);
            },
          ),
        );
      },
      editSocialAccount: (value) async {
        emit(const SocialAccountState.loadingEdit());
        var result = await editSocialAccountUseCase(value.request);

        return emit(
          result.when(
            failure: (error) =>
                SocialAccountState.error(error: error?.localizedErrorMessage),
            success: (s) {
              return const SocialAccountState.succes();
            },
          ),
        );
      },
    );
  }
}
