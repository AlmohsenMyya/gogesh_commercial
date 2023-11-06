import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/entities/location_entity/city_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/model_id.dart';
import '../../../domain/usecase/location/get_city_use_case.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final GetCityUseCase getCityUseCase;

  CityBloc({required this.getCityUseCase}) : super(const CityState.initial()) {
    on<CityEvent>(_mapEventToState);
  }

  var data = <StandarEntity>[];
  FutureOr<dynamic> _mapEventToState(
      CityEvent event, Emitter<CityState> emit) async {
    return event.map(
        load: (e) async {
          emit(const CityState.loading());
          var result = await getCityUseCase(
            e.filter,
          );

          return emit(result.when(
              failure: (error) => const CityState.initial(),
              success: (s) {
                data = s!.data;

                return CityState.dataLoaded(data: 
                s.data,meta: s.meta
                );
              }));
        },
        changeItem: (e) =>
            emit(CityState.itemChanged(item: e.item, data:[] )),
        loadMore: (_LoadMore value) {},
        refresh: (_Refresh value) {});
  }
}
