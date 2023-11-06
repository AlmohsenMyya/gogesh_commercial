import 'dart:async';

import 'package:commmercial_directory_seller/core/bloc/error.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/notificaton_paginated/notification_paginated.dart';
import 'package:commmercial_directory_seller/domain/entities/notification_entity/notification_entity.dart';
import 'package:commmercial_directory_seller/domain/usecase/notification/notification_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationUseCase getNotificationUseCase;
  NotificationBloc(this.getNotificationUseCase) : super(const NotificationState.initial()) {
    on<NotificationEvent>(_mapEventToState);
  }
  final PagingController<int, NotificationEntity> pagingController =
      PagingController(firstPageKey: 1);
  FutureOr _mapEventToState(
      NotificationEvent event, Emitter<NotificationState> emit) {
    return event.map(
      loadNotification: (value) async {
        emit(const NotificationState.loading());
        final result = await getNotificationUseCase(value.filter);
        return emit(result.when(failure: (failure) {
          return failure!.maybeWhen(
            orElse: () => const NotificationState.error(
              ErrorState.other(message: ""),
            ),
            network: (message) => const NotificationState.error(
                ErrorState.networkError(message: '')),
          );
        }, success: (success) {
          if (success!.data.isEmpty) {
            return const NotificationState.loaded(notification: []);
          }

          if (success.meta!.currentPage! == success.meta!.lastPage) {
            return NotificationState.lastPageLoaded(notification: success.data);
          }
          return NotificationState.loaded(
              notification: success.data,
              pageKey:
                  success.meta!.nextPage ?? success.meta!.currentPage! + 1);
        }));
      },
    );
  }
}
