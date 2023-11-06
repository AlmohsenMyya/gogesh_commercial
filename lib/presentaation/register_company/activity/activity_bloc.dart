import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/model_id.dart';
import '../../../domain/entities/standard_entity/standar_response.dart';
import '../../../domain/usecase/categories/fetch_activities_usecase.dart';

part 'activity_event.dart';
part 'activity_state.dart';
part 'activity_bloc.freezed.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final FetchActivitiesUseCase getActivityUseCase;

  ActivityBloc({required this.getActivityUseCase})
      : super(const ActivityState.initial()) {
    on<ActivityEvent>(_mapEventToState);
  }

  var data = <StandarEntity>[];
  StandarEntity? value;
  FutureOr<dynamic> _mapEventToState(
      ActivityEvent event, Emitter<ActivityState> emit) async {
    return event.map(
      load: (e) async {
        emit(const ActivityState.loading());
        var result = await getActivityUseCase(
         e.filter);

        return emit(result.when(
            failure: (error) => const ActivityState.initial(),
            success: (s) {
              data = s!.data;

              return ActivityState.dataLoaded(data: s.data);
            }));
      },
      changeItem: (e) =>
          emit(ActivityState.itemChanged(item: e.item, data: data)),
    );
  }
}
