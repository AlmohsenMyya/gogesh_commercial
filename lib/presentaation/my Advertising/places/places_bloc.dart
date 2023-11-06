import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/location_entity/city_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/places_entity/places_response.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/get_places_ads_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_event.dart';
part 'places_state.dart';
part 'places_bloc.freezed.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final GetPlacesUseCase getPlacesUseCase;
  PlacesBloc({required this.getPlacesUseCase}) : super(_Initial()) {
    on<PlacesEvent>(_mapEventToState);
  }
  var data = <PlacesEntity>[];

  FutureOr<dynamic> _mapEventToState(
      PlacesEvent event, Emitter<PlacesState> emit) async {
    return event.map(
      load: (e) async {
        emit(const PlacesState.loading());
        var result = await getPlacesUseCase(NoParams());

        return emit(result.when(
            failure: (error) => const PlacesState.initial(),
            success: (s) {
              data = s!.data;
              // return const PlacesState.initial();
              return PlacesState.dataLoaded(data: s.data);
            }));
      },
      changeItem: (e) => emit(
        PlacesState.itemChanged(item: e.item, data: data),
        // ),
      ),
    );
  }
}
