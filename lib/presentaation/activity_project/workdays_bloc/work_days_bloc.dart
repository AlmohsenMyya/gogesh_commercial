import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/work_days_response.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_work_days_request.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/edit_work_days_use_case.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/get_work_days.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_days_event.dart';
part 'work_days_state.dart';
part 'work_days_bloc.freezed.dart';

class WorkDaysBloc extends Bloc<WorkDaysEvent, WorkDaysState> {
  final GetWorkDaysUseCase getWorkDaysUseCase;
  final EditWorkDaysUseCase editWorkDaysUseCase;
  WorkDaysBloc({required this.getWorkDaysUseCase,required this.editWorkDaysUseCase}) : super(_Initial()) {
    on<WorkDaysEvent>(_mapEventToState);
  }
  FutureOr<dynamic> _mapEventToState(
      WorkDaysEvent event, Emitter<WorkDaysState> emit) async {
    return event.map(
      load: (value) async {
        emit(const WorkDaysState.loading());
        var result = await getWorkDaysUseCase(NoParams());

        return emit(
          result.when(
            failure: (error) => const WorkDaysState.initial(),
            success: (s) {
              return WorkDaysState.dataLoaded(data: s!);
            },
          ),
        );
      },
      editWorkDays: (value) async {
        emit(const WorkDaysState.loadingEdit());
        var result = await editWorkDaysUseCase(value.request);

        return emit(
          result.when(
            failure: (error) =>
                WorkDaysState.error(error: error?.localizedErrorMessage),
            success: (s) {
              return const WorkDaysState.succes();
            },
          ),
        );
      },
    );
  }
}
