import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:commmercial_directory_seller/core/bloc/error.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/domain/usecase/offer/get_offers_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'offer_event.dart';

part 'offer_state.dart';

part 'offer_bloc.freezed.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferBloc(
    this.getOfferUseCase,
  ) : super(const OfferState.loading()) {
    on<OfferEvent>(_mapEventToState, transformer: droppable());
  }

  final PagingController<int, OfferEntity> pagingController =
      PagingController(firstPageKey: 1);

  final GetOfferUseCase getOfferUseCase;

  FutureOr _mapEventToState(OfferEvent event, Emitter<OfferState> emit) {
    return event.map(
      load: (load) async {
        emit(const OfferState.loading());
        final result = await getOfferUseCase(load.filter);
        return emit(result.when(failure: (failure) {
          return failure!.maybeWhen(
            orElse: () => const OfferState.error(
              ErrorState.other(message: ""),
            ),
            network: (message) => const OfferState.error(
                  ErrorState.networkError(message: '')),
          );
        }, success: (success) {
          if (success!.data.isEmpty) {
            return const OfferState.loaded(offers: []);
          }

          if (success.meta!.currentPage! == success.meta!.lastPage) {
            return OfferState.lastPageLoaded(offers: success.data);
          }
          return OfferState.loaded(
              offers: success.data,
              pageKey: success.meta!.nextPage ?? success.meta!.currentPage! + 1);
        }));
      },
    );
  }



}
