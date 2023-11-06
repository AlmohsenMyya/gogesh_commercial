import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/bloc/error.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/usecase/categories/fetch_services_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_event.dart';
part 'service_state.dart';
part 'service_bloc.freezed.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final FetchServicesUseCase getServicesUseCase;
  ServiceBloc({required this.getServicesUseCase})
      : super(const ServiceState.initial()) {
    on<ServiceEvent>(_mapEventToState);
    //Sector? value;
  }

  var data = <StandarEntity>[];
  Meta? meta;
  bool lastPage = false;
  FutureOr<dynamic> _mapEventToState(
      ServiceEvent event, Emitter<ServiceState> emit) async {
    return event.map(loadData: (value) async {
      data.clear();
      emit(const ServiceState.loading());
      var result = await getServicesUseCase(value.filter);

      return emit(
        result.when(failure: (failure) {
          return failure!.maybeWhen(
            orElse: () => const ServiceState.error(
              ErrorState.other(message: ""),
            ),
            network: (message) =>
                const ServiceState.error(ErrorState.networkError(message: '')),
          );
        }, success: (success) {
          meta = success!.meta;
          if (success.data.isEmpty) {
            return const ServiceState.empty();
          }

          data.addAll(success.data);

          lastPage = success.meta!.currentPage! == success.meta!.lastPage;

          return ServiceState.loaded(
              data: success.data,
              pageKey: success.meta!.nextPage ?? success.meta!.currentPage! + 1,
              lastPage: lastPage);
        }),
      );
    }, loadMore: (value) async {
      emit(const ServiceState.loading());
      var result = await getServicesUseCase(value.filter);

      return emit(
        result.when(failure: (failure) {
          return const ServiceState.loadingMoreFailed();
        }, success: (success) {
          meta = success!.meta;
          if (success.data.isEmpty) {
            return const ServiceState.empty();
          }
          data.addAll(success.data);

          lastPage = success.meta!.currentPage! == success.meta!.lastPage;
          return ServiceState.loaded(
              data: success.data,
              pageKey: success.meta!.nextPage ?? success.meta!.currentPage! + 1,
              lastPage: lastPage);
        }),
      );
    },
        //
        changeItem: (e) {
      return emit(ServiceState.itemChanged(data: e.items.toList()));
    }
        // load: (e) async {
        //   emit(const ServiceState.loading());
        //   var result = await getServicesUseCase( Filter(page: e.page, q:e.searchKey));

        //   return emit(result.when(
        //       failure: (error) => const ServiceState.initial(),
        //       success: (s) {
        //         data = s!.data;

        //         return ServiceState.dataLoaded(data: s.data);
        //       }));
        // },
        // changeItem: (e) =>
        //     emit(ServiceState.itemChanged(item: e.item, data: data)),
        );
  }
}
