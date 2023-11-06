import 'dart:async';

import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/domain/entities/location_entity/country_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/use_case/use_case.dart';
import '../../../domain/usecase/location/get_country_use_case.dart';

part 'country_event.dart';
part 'country_state.dart';
part 'country_bloc.freezed.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountryUseCase getCountryUseCase;
  CountryBloc({required this.getCountryUseCase})
      : super(const CountryState.initial()) {
    on<CountryEvent>(_mapEventToState);
  }

  var data = <StandarEntity>[];
  FutureOr<dynamic> _mapEventToState(
      CountryEvent event, Emitter<CountryState> emit) async {
    return event.map(
        load: (e) async {
          emit(const CountryState.loading());
          var result = await getCountryUseCase(
            Filter(),
          );

          return emit(result.when(
              failure: (error) => const CountryState.initial(),
              success: (s) {
              data = s!.data;
                return CountryState.dataLoaded(
                  data:
                  s.data,
                  meta: s.meta
                );
              }));
        },
        changeItem: (e) =>
            emit(CountryState.itemChanged(item: e.item, data: [])));
  }
}
