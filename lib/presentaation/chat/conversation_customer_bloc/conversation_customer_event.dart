part of 'conversation_customer_bloc.dart';

@freezed
class ConversationCustomerEvent with _$ConversationCustomerEvent {
  const factory ConversationCustomerEvent.loadConversationSeller(
      {required Filter filter}) = _loadConversationSeller;
  const factory ConversationCustomerEvent.refresh() = _Refresh;

  const factory ConversationCustomerEvent.loadMore({required Filter filter}) =
      _LoadMore;
}
