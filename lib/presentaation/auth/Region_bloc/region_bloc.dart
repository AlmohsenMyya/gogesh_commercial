import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/entities/location_entity/region_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/model_id.dart';
import '../../../domain/usecase/location/gat_region_use_case.dart';
import '../../../domain/usecase/location/get_city_use_case.dart';

part 'region_event.dart';
part 'region_state.dart';
part 'region_bloc.freezed.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  final GetRegionUseCase getRegionUseCase;

  RegionBloc({required this.getRegionUseCase})
      : super(const RegionState.initial()) {
    on<RegionEvent>(_mapEventToState);
  }
  var data = <StandarEntity>[];

  FutureOr<dynamic> _mapEventToState(
      RegionEvent event, Emitter<RegionState> emit) async {
    return event.map(
      load: (e) async {
        emit(const RegionState.loading());
        var result = await getRegionUseCase(e.filter);

        return emit(result.when(
            failure: (error) => const RegionState.initial(),
            success: (s) {
              data = s!.data;

              return RegionState.dataLoaded(data: s.data, meta: s.meta);
            }));
      },
      changeItem: (e) =>
          emit(RegionState.itemChanged(item: e.item, data: [])),
    );
  }
}
