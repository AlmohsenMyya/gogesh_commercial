import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:commmercial_directory_seller/core/bloc/error.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/domain/usecase/ads/get_ads_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'ads_event.dart';
part 'ads_state.dart';
part 'ads_bloc.freezed.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  AdsBloc(
    this.getAdsUseCase,
  ) : super(const AdsState.loading()) {
    on<AdsEvent>(_mapEventToState, transformer: droppable());
  }

  final PagingController<int, AdsEntity> pagingController =
      PagingController(firstPageKey: 1);

  final GetAdsUseCase getAdsUseCase;

  FutureOr _mapEventToState(AdsEvent event, Emitter<AdsState> emit) {
    return event.map(
      load: (load) async {
        emit(const AdsState.loading());
        final result = await getAdsUseCase(load.filter);
        return emit(result.when(failure: (failure) {
          /// TODO: handle the failure
          return failure!.maybeWhen(
            orElse: () => const AdsState.error(
              ErrorState.other(message: ""),
            ),
            network: (message) =>
                const AdsState.error(ErrorState.networkError(message: '')),
          );
        }, success: (success) {
          if (success!.data.isEmpty) {
            return AdsState.loaded(ads: []);
          }

          if (success.meta?.currentPage! == success.meta?.lastPage) {
            return AdsState.lastPageLoaded(ads: success.data);
          }
          return AdsState.loaded(
              ads: success.data,
              pageKey:
                  success.meta?.nextPage ?? success.meta!.currentPage! + 1);
        }));
      },
    );
  }
}
