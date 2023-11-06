import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:commmercial_directory_seller/domain/request/company/add_assistant.dart';
import 'package:commmercial_directory_seller/domain/request/company/update_activity_request.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/edit_company_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/get_company_details_usecase.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/screens/details_project.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/screens/update_company_screen.dart';
import 'package:flutter/material.dart';
// import 'package:commmercial_directory_seller/presentaation/activity_project/screens/details_project.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'activity_project_event.dart';
part 'activity_project_state.dart';
part 'activity_project_bloc.freezed.dart';

class ActivityProjectBloc
    extends Bloc<ActivityProjectEvent, ActivityProjectState> {
  final GetDetailsCompanyUseCase getDetailsCompanyUseCase;
  final EditCompanyUseCase editCompanyUseCase;
  ActivityProjectBloc(
      {required this.getDetailsCompanyUseCase,
      required this.editCompanyUseCase})
      : super(const _Initial()) {
    on<ActivityProjectEvent>(_mapEventToState);
  }
  FutureOr<dynamic> _mapEventToState(
      ActivityProjectEvent event, Emitter<ActivityProjectState> emit) async {
    return event.map(
      loadDetailsProfile: (e) async {
        emit(const ActivityProjectState.loading());
        var result = await getDetailsCompanyUseCase(NoParams());

        return emit(
          result.when(
            failure: (error) => const ActivityProjectState.initial(),
            success: (s) {
              return ActivityProjectState.dataLoaded(data: s!);
            },
          ),
        );
      },
      changeItem: (e) => emit(ActivityProjectState.itemChanged(
        item: e.item,
      )),
      uploadImageLogo: (value) async {
        var result = await pickImage(value.source);
        if (result != null) {
          emit(ActivityProjectState.loadedImageLogo(image: result));
          print(result.path);
        } else {
          emit(const ActivityProjectState.initial());
        }
      },
      uploadImageSignature: (value) async {
        var result = await pickImage(value.source);
        if (result != null) {
          emit(ActivityProjectState.loadedImageSignuature(image: result));
          print(result.path);
        } else {
          emit(const ActivityProjectState.initial());
        }
      },
      uploadImageLisence: (value) async {
        var result = await pickImage(value.source);
        if (result != null) {
          emit(ActivityProjectState.loadedImageLisence(image: result));
          print(result.path);
        } else {
          emit(const ActivityProjectState.initial());
        }
      },
      editActivity: (value) async {
        emit(const ActivityProjectState.loadingEdit());
        var result = await editCompanyUseCase(value.request);

        return emit(
          result.when(
            failure: (error) =>  ActivityProjectState.error(error: error?.localizedErrorMessage),
            success: (s) {
              return const ActivityProjectState.success();
            },
          ),
        );
      },
    );
  }
}
