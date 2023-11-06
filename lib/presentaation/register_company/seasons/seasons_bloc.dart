import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/usecase/categories/Fetch_sector_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/bloc/error.dart';
import '../../../domain/entities/standard_entity/standar_response.dart';
import '../../../domain/usecase/categories/fetch_occasions_usecase.dart';

part 'seasons_event.dart';

part 'seasons_state.dart';

part 'seasons_bloc.freezed.dart';

class SeasonsBloc extends Bloc<SeasonsEvent, SeasonsState> {
  final FetchOccasionsUseCase getSeasonsUseCase;

  SeasonsBloc(
      {required this.getSeasonsUseCase, })
      : super(const SeasonsState.initial()) {
    on<SeasonsEvent>(_mapEventToState);
  }

  var seasons = <StandarEntity>[];
  Meta? meta;
  bool lastPage = false;

  FutureOr<dynamic> _mapEventToState(
      SeasonsEvent event, Emitter<SeasonsState> emit) async {
    return event.map(
      loadSeasons: (value) async {
        seasons.clear();
        emit(const SeasonsState.loading());
        var result = await getSeasonsUseCase(value.filter);

        return emit(
          result.when(failure: (failure) {
            return failure!.maybeWhen(
              orElse: () => const SeasonsState.error(
                ErrorState.other(message: ""),
              ),
              network: (message) => const SeasonsState.error(
                  ErrorState.networkError(message: '')),
            );
          }, success: (success) {
            meta = success!.meta;
            if (success.data.isEmpty) {
              return const SeasonsState.empty();
            }

            seasons.addAll(success.data);

            lastPage = success.meta!.currentPage! == success.meta!.lastPage;

            return SeasonsState.Loaded(
                data: success.data,
                pageKey:
                    success.meta!.nextPage ?? success.meta!.currentPage! + 1,
                lastPage: lastPage);
          }),
        );
      },
      loadMore: (value) async {
        emit(const SeasonsState.loading());
        var result = await getSeasonsUseCase(value.filter);

        return emit(
          result.when(failure: (failure) {
            return const SeasonsState.loadingMoreFailed();
          }, success: (success) {
            meta = success!.meta;
            if (success.data.isEmpty) {
              return const SeasonsState.empty();
            }
            seasons.addAll(success.data);

            lastPage = success.meta!.currentPage! == success.meta!.lastPage;
            return SeasonsState.Loaded(
                data: success.data,
                pageKey:
                    success.meta!.nextPage ?? success.meta!.currentPage! + 1,
                lastPage: lastPage);
          }),
        );
      },
      changedItem: (value) {
        return emit(
          SeasonsState.changedItems(
              data: value.data,
              lastPage: value.lastPage,
              itemsSelected: value.itemsSelected,
              pageKey: value.pageKey),
        );
      },
      //
      changeItem: (e) {
        return emit(SeasonsState.itemChanged(data: e.items.toList()));
      },
    );
  }
}
