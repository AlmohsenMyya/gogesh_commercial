part of 'conversation_bloc.dart';

@freezed
class ConversationEvent with _$ConversationEvent {
  const factory ConversationEvent.loadConversationSupport(
      {required Filter filter}) = _loadConversation;
  const factory ConversationEvent.refresh() = _Refresh;

  const factory ConversationEvent.loadMore({required Filter filter}) =
      _LoadMore;
}
