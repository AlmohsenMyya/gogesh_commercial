import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/usecase/categories/Fetch_sector_usecase.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/use_case/use_case.dart';
import '../../../domain/entities/standard_entity/standar_response.dart';

part 'sector_event.dart';

part 'sector_state.dart';

part 'sector_bloc.freezed.dart';

class SectorBloc extends Bloc<SectorEvent, SectorState> {
  final FetchSecorsUseCase getSectorsUseCase;

  SectorBloc({required this.getSectorsUseCase})
      : super(const SectorState.initial()) {
    on<SectorEvent>(_mapEventToState, transformer: droppable());
  }

  var data = <StandarEntity>[];

  FutureOr<dynamic> _mapEventToState(
      SectorEvent event, Emitter<SectorState> emit) async {
    return event.map(
        load: (e) async {
          emit(const SectorState.loading());
          var result = await getSectorsUseCase(e.filter);

          return emit(result.when(
              failure: (error) => const SectorState.initial(),
              success: (s) {
                data = s?.data ?? [];
                return SectorState.dataLoaded(data: s?.data ?? [],meta: s!.meta!);
              }));
        },
        changeItem: (e) =>
            emit(SectorState.itemChanged(item: e.item, data: data)),
        loadMore: (_LoadMore value) {},
        refresh: (_Refresh value) {});
  }
}
