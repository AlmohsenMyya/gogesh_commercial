import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/bloc/error.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/core/utils/model_id.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/usecase/categories/fetch_section_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sections_event.dart';
part 'sections_state.dart';
part 'sections_bloc.freezed.dart';

class SectionsBloc extends Bloc<SectionsEvent, SectionsState> {
  final FetchSectionUseCase getSectionsUseCase;
  SectionsBloc(this.getSectionsUseCase) : super(const SectionsState.initial()) {
    on<SectionsEvent>(_mapEventToState);
  }
 var data = <StandarEntity>[];
  Meta? meta;
  bool lastPage = false;
  FutureOr<dynamic> _mapEventToState(
      SectionsEvent event, Emitter<SectionsState> emit) async {
    return event.map(
      loadData: (value) async {
      data.clear();
      emit(const SectionsState.loading());
      var result = await getSectionsUseCase(value.filter);

      return emit(
        result.when(failure: (failure) {
          return failure!.maybeWhen(
            orElse: () => const SectionsState.error(
              ErrorState.other(message: ""),
            ),
            network: (message) =>
                const SectionsState.error(ErrorState.networkError(message: '')),
          );
        }, success: (success) {
          meta = success!.meta;
          if (success.data.isEmpty) {
            return const SectionsState.empty();
          }

          data.addAll(success.data);

          lastPage = success.meta!.currentPage! == success.meta!.lastPage;

          return SectionsState.loaded(
              data: data,
              pageKey: success.meta!.nextPage ?? success.meta!.currentPage! + 1,
              lastPage: lastPage);
        }),
      );
    }, loadMore: (value) async {
      emit(const SectionsState.loading());
      var result = await getSectionsUseCase(value.filter);

      return emit(
        result.when(failure: (failure) {
          return const SectionsState.loadingMoreFailed();
        }, success: (success) {
          meta = success!.meta;
          if (success.data.isEmpty) {
            return const SectionsState.empty();
          }
          data.addAll(success.data);

          lastPage = success.meta!.currentPage! == success.meta!.lastPage;
          return SectionsState.loaded(
              data: data,
              pageKey: success.meta!.nextPage ?? success.meta!.currentPage! + 1,
              lastPage: lastPage);
        }),
      );
    },
        //
        changeItem: (e) {
      return emit(SectionsState.itemChanged(data: e.items.toList()));
    }
        // load: (e) async {
        //   emit(const SectionsState.loading());
        //   var result = await getServicesUseCase( Filter(page: e.page, q:e.searchKey));

        //   return emit(result.when(
        //       failure: (error) => const SectionsState.initial(),
        //       success: (s) {
        //         data = s!.data;

        //         return SectionsState.dataLoaded(data: s.data);
        //       }));
        // },
        // changeItem: (e) =>
        //     emit(SectionsState.itemChanged(item: e.item, data: data)),
        );
  }
}
