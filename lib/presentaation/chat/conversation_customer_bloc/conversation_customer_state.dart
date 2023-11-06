part of 'conversation_customer_bloc.dart';

@freezed
class ConversationCustomerState with _$ConversationCustomerState {
  const factory ConversationCustomerState.loading() = _loading;
  const factory ConversationCustomerState.empty() = _Empty;
  const factory ConversationCustomerState.error(ErrorState error) = _Error;
  const factory ConversationCustomerState.loaded(
      {required List<ConversationEntity> conversation,
      required bool isLastPage}) = _Loaded;
}
