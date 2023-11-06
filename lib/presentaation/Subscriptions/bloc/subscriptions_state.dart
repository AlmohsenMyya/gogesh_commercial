part of 'subscriptions_bloc.dart';

@freezed
class SubscriptionsState with _$SubscriptionsState {
  const factory SubscriptionsState.initial() = _Initial;
  const factory SubscriptionsState.loading() = _loading;
  const factory SubscriptionsState.dataLoaded(
    {required List<SubscriptionEntity>package}
  ) = _dataLoaded;
  const factory SubscriptionsState.error({String? error}) = _error;
  
  
  
}
