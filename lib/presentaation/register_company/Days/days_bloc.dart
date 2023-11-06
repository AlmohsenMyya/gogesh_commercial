import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/use_case/use_case.dart';
import '../../../domain/entities/standard_entity/standar_response.dart';
import '../../../domain/usecase/register_company/get_days_usecase.dart';

part 'days_event.dart';
part 'days_state.dart';
part 'days_bloc.freezed.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {
  final GetdaysUseCase getdaysUseCase;

  DaysBloc({required this.getdaysUseCase}) : super(const DaysState.loading()) {
    on<DaysEvent>(_mapEventToState);
  }
  FutureOr<dynamic> _mapEventToState(
      DaysEvent event, Emitter<DaysState> emit) async {
    return event.map(
      loadDays: (e) async {
        emit(const DaysState.loading());
        var result = await getdaysUseCase(NoParams());

        return emit(result.when(
            failure: (error) => const DaysState.error(),
            success: (s) {
              // data = s?.data??[] ;

              return DaysState.daysLoaded(data: s?.data ?? []);
            }));
      },
    );
  }
}
