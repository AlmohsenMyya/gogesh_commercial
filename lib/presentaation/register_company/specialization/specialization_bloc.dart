import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/bloc/error.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/usecase/categories/fetch_specializations_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/model_id.dart';
import '../../../domain/entities/standard_entity/standar_response.dart';

part 'specialization_event.dart';
part 'specialization_state.dart';
part 'specialization_bloc.freezed.dart';

class SpecializationBloc
    extends Bloc<SpecializationEvent, SpecializationState> {
  final FetchSpecializationsUseCase getSpesialityUseCase;

  SpecializationBloc({required this.getSpesialityUseCase})
      : super(const SpecializationState.initial()) {
    on<SpecializationEvent>(_mapEventToState);
  }
 var data = <StandarEntity>[];
  Meta? meta;
  bool lastPage = false;

  FutureOr<dynamic> _mapEventToState(
      SpecializationEvent event, Emitter<SpecializationState> emit) async {
    return event.map(loadData: (value) async {
      data.clear();
      emit(const SpecializationState.loading());
      var result = await getSpesialityUseCase(value.filter);

      return emit(
        result.when(failure: (failure) {
          return failure!.maybeWhen(
            orElse: () => const SpecializationState.error(
              ErrorState.other(message: ""),
            ),
            network: (message) =>
                const SpecializationState.error(ErrorState.networkError(message: '')),
          );
        }, success: (success) {
          meta = success!.meta;
          if (success.data.isEmpty) {
            return const SpecializationState.empty();
          }

          data.addAll(success.data);

          lastPage = success.meta!.currentPage! == success.meta!.lastPage;

          return SpecializationState.loaded(
              data: success.data,
              pageKey: success.meta!.nextPage ?? success.meta!.currentPage! + 1,
              lastPage: lastPage);
        }),
      );
    }, loadMore: (value) async {
      emit(const SpecializationState.loading());
      var result = await getSpesialityUseCase(value.filter);

      return emit(
        result.when(failure: (failure) {
          return const SpecializationState.loadingMoreFailed();
        }, success: (success) {
          meta = success!.meta;
          if (success.data.isEmpty) {
            return const SpecializationState.empty();
          }
          data.addAll(success.data);

          lastPage = success.meta!.currentPage! == success.meta!.lastPage;
          return SpecializationState.loaded(
              data: success.data,
              pageKey: success.meta!.nextPage ?? success.meta!.currentPage! + 1,
              lastPage: lastPage);
        }),
      );
    },
        //
        changeItem: (e) {
      return emit(SpecializationState.itemChanged(data: e.items.toList()));
    }
        // load: (e) async {
        //   emit(const SpecializationState.loading());
        //   var result = await getSpesialityUseCase( Filter(page: e.page, q:e.searchKey));

        //   return emit(result.when(
        //       failure: (error) => const SpecializationState.initial(),
        //       success: (s) {
        //         data = s!.data;

        //         return SpecializationState.dataLoaded(data: s.data);
        //       }));
        // },
        // changeItem: (e) =>
        //     emit(SpecializationState.itemChanged(item: e.item, data: data)),
        );
  }
}
