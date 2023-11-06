import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/subscription_entity/subscription_response.dart';
import 'package:commmercial_directory_seller/domain/usecase/subscription/get_package_sub_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscriptions_event.dart';
part 'subscriptions_state.dart';
part 'subscriptions_bloc.freezed.dart';

class SubscriptionsBloc extends Bloc<SubscriptionsEvent, SubscriptionsState> {
  final GetPackageSubscrptionUseCase getPackageSubscrptionUseCase;
  SubscriptionsBloc({required this.getPackageSubscrptionUseCase})
      : super(const SubscriptionsState.initial()) {
    on<SubscriptionsEvent>(_mapEventToState);
  }
  FutureOr _mapEventToState(
      SubscriptionsEvent event, Emitter<SubscriptionsState> emit) {
    return event.map(loadPackage: (value) async {
      emit(const SubscriptionsState.loading());
      var result = await getPackageSubscrptionUseCase(NoParams());
      return emit(result.when(
        failure: (error) {
          return const SubscriptionsState.error(error: '');
        },
        success: (s) {
          return SubscriptionsState.dataLoaded(package: s!.package);
        },
      ));
    });
  }
}
