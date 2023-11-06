import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/domain/entities/chat_entity/conversation_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/bloc/error.dart';
import '../../../core/paginated/meta.dart';
import '../../../domain/usecase/chat/get_conversation_customer_usecase.dart';

part 'conversation_customer_bloc.freezed.dart';
part 'conversation_customer_event.dart';
part 'conversation_customer_state.dart';

class ConversationCustomerBloc
    extends Bloc<ConversationCustomerEvent, ConversationCustomerState> {
  final GetConversationCustomerUseCase getConversationCustomerUseCase;

  ConversationCustomerBloc({required this.getConversationCustomerUseCase})
      : super(const ConversationCustomerState.loading()) {
    on<ConversationCustomerEvent>(_mapEventToState);
  }

  late List<ConversationEntity> conversations;
  late Meta meta;
  bool isLastPage = false;

  FutureOr<dynamic> _mapEventToState(ConversationCustomerEvent event,
      Emitter<ConversationCustomerState> emit) async {
    return event.map(loadConversationSeller: (value) async {
      conversations = [];
      meta = const Meta();
      var result = await getConversationCustomerUseCase(
          value.filter.copyWith(page: meta.currentPage));
      return emit(
        result.when(failure: (failure) {
          return failure!.maybeWhen(
            orElse: () => const ConversationCustomerState.error(
              ErrorState.other(message: ""),
            ),
            network: (message) => const ConversationCustomerState.error(
                ErrorState.networkError(message: '')),
          );
        }, success: (success) {
          conversations.addAll(success!.data);
          meta = success.meta ?? const Meta();
          isLastPage = meta.currentPage == meta.lastPage;
          if (success.data.isEmpty) {
            return const ConversationCustomerState.empty();
          }

          return ConversationCustomerState.loaded(
            conversation: success.data,
            isLastPage: success.meta!.currentPage == success.meta!.lastPage,
          );
        }),
      );
    }, loadMore: (_LoadMore value) async {
      var result = await getConversationCustomerUseCase(
          value.filter.copyWith(page: meta.nextPage));
      return emit(
        result.maybeWhen(success: (success) {
          conversations.addAll(success!.data);
          meta = success.meta ?? const Meta();
          isLastPage = meta.currentPage == meta.lastPage;

          return ConversationCustomerState.loaded(
            conversation: conversations,
            isLastPage: success.meta!.currentPage == success.meta!.lastPage,
          );
        }, orElse: () {
          return ConversationCustomerState.loaded(
            conversation: conversations,
            isLastPage: meta.currentPage == meta.lastPage,
          );
        }),
      );
    }, refresh: (_Refresh value) {
      return emit(ConversationCustomerState.loaded(
        conversation: List.from(conversations),
        isLastPage: meta.currentPage == meta.lastPage,
      ));
    });
  }

  conversationUpdated(ConversationEntity conversationEntity) {
    ConversationEntity? conversation = conversations.firstWhereOrNull(
      (element) => element.id == conversationEntity.id,
    );

    if (conversation != null) {
      conversations.remove(conversation);
      conversation.lastMessage = conversationEntity.lastMessage;
      conversation.unread = (conversation.unread ?? 0) + 1;

      conversations.insert(0, conversationEntity);
    } else {
      conversations.insert(0, conversationEntity);
    }

    add(const ConversationCustomerEvent.refresh());
  }
}
