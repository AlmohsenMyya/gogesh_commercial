import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/usecase/categories/fetch_subsectors_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_suctors_event.dart';
part 'sub_suctors_state.dart';
part 'sub_suctors_bloc.freezed.dart';


class SubSuctorsBloc extends Bloc<SubSuctorsEvent, SubSuctorsState> {
  final FetchSubSecorsUseCase getSubSectorsUseCase;

  SubSuctorsBloc({required this.getSubSectorsUseCase})
      : super(const SubSuctorsState.initial()) {
    on<SubSuctorsEvent>(_mapEventToState, transformer: droppable());
  }

  var data = <StandarEntity>[];

  FutureOr<dynamic> _mapEventToState(
      SubSuctorsEvent event, Emitter<SubSuctorsState> emit) async {
    return event.map(
        load: (e) async {
          emit(const SubSuctorsState.loading());
          var result = await getSubSectorsUseCase(e.filter);

          return emit(result.when(
              failure: (error) => const SubSuctorsState.initial(),
              success: (s) {
                data = s?.data ?? [];
                return SubSuctorsState.dataLoaded(data: s?.data ?? [],meta: s!.meta!);
              }));
        },
        changeItem: (e) =>
            emit(SubSuctorsState.itemChanged(item: e.item, data: data)),
        loadMore: (_LoadMore value) {},
        refresh: (_Refresh value) {});
  }
}