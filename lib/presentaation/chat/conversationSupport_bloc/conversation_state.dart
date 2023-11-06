part of 'conversation_bloc.dart';

@freezed
class ConversationState with _$ConversationState {
  const factory ConversationState.loading() = _loading;
  const factory ConversationState.empty() = _Empty;
  const factory ConversationState.error(ErrorState error) = _Error;
  const factory ConversationState.loaded(
      {required List<ConversationEntity> conversation,
      required bool isLastPage}) = _Loaded;
}
