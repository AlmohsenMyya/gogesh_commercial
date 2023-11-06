import 'dart:async';

import 'package:collection/collection.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/entities/chat_entity/conversation_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/bloc/error.dart';
import '../../../domain/usecase/chat/get_conversation_support_usecase.dart';

part 'conversation_bloc.freezed.dart';
part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final GetConversationSupportUseCase getConversationSupportUseCase;

  ConversationBloc({
    required this.getConversationSupportUseCase,
  }) : super(const ConversationState.loading()) {
    on<ConversationEvent>(_mapEventToState);
  }

  late List<ConversationEntity> conversations;
  late Meta meta;
  bool isLastPage = false;

  FutureOr<dynamic> _mapEventToState(
      ConversationEvent event, Emitter<ConversationState> emit) async {
    return event.map(
      loadConversationSupport: (value) async {
        conversations = [];
        meta = const Meta();
        var result = await getConversationSupportUseCase(
            value.filter.copyWith(page: meta.currentPage));
        return emit(
          result.when(failure: (failure) {
            return failure!.maybeWhen(
              orElse: () => const ConversationState.error(
                ErrorState.other(message: ""),
              ),
              network: (message) => const ConversationState.error(
                  ErrorState.networkError(message: '')),
            );
          }, success: (success) {
            conversations.addAll(success!.data);
            meta = success.meta ?? const Meta();
            isLastPage = meta.currentPage == meta.lastPage;
            if (success.data.isEmpty) {
              return const ConversationState.empty();
            }

            return ConversationState.loaded(
              conversation: success.data,
              isLastPage: success.meta!.currentPage == success.meta!.lastPage,
            );
          }),
        );
      },
      loadMore: (_LoadMore value) async {
        var result = await getConversationSupportUseCase(
            value.filter.copyWith(page: meta.nextPage));
        return emit(
          result.maybeWhen(
              orElse: () => ConversationState.loaded(
                    conversation: conversations,
                    isLastPage: meta.currentPage == meta.lastPage,
                  ),
              success: (success) {
                conversations.addAll(success!.data);
                meta = success.meta ?? const Meta();
                isLastPage = meta.currentPage == meta.lastPage;

                return ConversationState.loaded(
                  conversation: List.from(conversations),
                  isLastPage:
                      success.meta!.currentPage == success.meta!.lastPage,
                );
              }),
        );
      },
      refresh: (_Refresh value) {
        return emit(ConversationState.loaded(
          conversation: List.from(conversations),
          isLastPage: meta.currentPage == meta.lastPage,
        ));
      },
    );
  }

  conversationUpdated(ConversationEntity conversationEntity) {
    ConversationEntity? conversation = conversations.firstWhereOrNull(
      (element) => element.id == conversationEntity.id,
    );

    if (conversation != null) {
      conversations.remove(conversation);
      conversation.lastMessage = conversationEntity.lastMessage;
      conversation.unread = (conversation.unread ?? 0) + 1;
      conversations.insert(0, conversation);
    } else {
      conversations.insert(0, conversationEntity);
    }

    add(const ConversationEvent.refresh());
  }
}
