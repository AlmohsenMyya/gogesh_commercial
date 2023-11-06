import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/usecase/subscription/get_information_sub_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'information_activity_event.dart';
part 'information_activity_state.dart';
part 'information_activity_bloc.freezed.dart';

class InformationActivityBloc
    extends Bloc<InformationActivityEvent, InformationActivityState> {
  InformationActivityBloc({required this.getInformationSubscrptionUseCase})
      : super(const _Initial()) {
    on<InformationActivityEvent>(_mapEventToState);
  }
  final GetInformationSubscrptionUseCase getInformationSubscrptionUseCase;
  FutureOr _mapEventToState(
      InformationActivityEvent event, Emitter<InformationActivityState> emit) {
    return event.map(
      loadData: (value) async {
        emit(const InformationActivityState.initial());
        var result = await getInformationSubscrptionUseCase(NoParams());
        return emit(result.when(
            failure: (error) => const InformationActivityState.error(),
            success: (s) => InformationActivityState.dataLoaded(request: s!)));
      },
    );
  }
}
