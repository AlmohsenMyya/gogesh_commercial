import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/request/company/add_assistant.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/add_assistant_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/delete_assistant_usecase.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/get_assistant_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'assistant_event.dart';
part 'assistant_state.dart';
part 'assistant_bloc.freezed.dart';

class AssistantBloc extends Bloc<AssistantEvent, AssistantState> {
  final AddAssistantUseCase addAssistantUseCase;
  final GetAssistantUseCase getAssistantUseCase;
  final DeleteAssistantUseCase deleteAssistantUseCase;
  AssistantBloc(
      {required this.addAssistantUseCase, required this.getAssistantUseCase,required this.deleteAssistantUseCase})
      : super(const _Initial()) {
    on<AssistantEvent>(_mapEventToState);
  }
  FutureOr<dynamic> _mapEventToState(
      AssistantEvent event, Emitter<AssistantState> emit) async {
    return event.map(
      addAssistant: (value) async {
        emit(const AssistantState.loadingAdd());
        var result = await addAssistantUseCase(value.request);

        return emit(
          result.when(
            failure: (error) =>
                AssistantState.error(error: error?.localizedErrorMessage),
            success: (s) {
              return const AssistantState.succes();
            },
          ),
        );
      },
      load: (value) async {
        emit(const AssistantState.loading());

        var result = await getAssistantUseCase(NoParams());

        return emit(
          result.when(
            failure: (error) =>
                AssistantState.error(error: error?.localizedErrorMessage),
            success: (s) {
              return AssistantState.dataLoaded(data: s!.data);
            },
          ),
        );
      },
      deleteAssistant: (value) async {
        emit(AssistantState.loadingDelete(indx: value.index));
         var result = await deleteAssistantUseCase(ModelID(id: value.id));
        return emit(
          result.when(
            failure: (error) =>
                AssistantState.error(error: error?.localizedErrorMessage),
            success: (s) {
              return const AssistantState.successDelete();
            },
          ),
        );
      },
      uploadImage: (value) async {
        var result = await pickImage(value.source);
        if (result != null) {
          emit(AssistantState.imagePicked(image: result));
        } else {
          emit(const AssistantState.initial());
        }
      },
    );
  }
}
