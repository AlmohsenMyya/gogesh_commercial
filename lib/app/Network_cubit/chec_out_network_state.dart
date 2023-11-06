part of 'chec_out_network_cubit.dart';

@freezed
class ChecOutNetworkState with _$ChecOutNetworkState {
  const factory ChecOutNetworkState.initial() = _Initial;

  const factory ChecOutNetworkState.connected() = _Connected;
    const factory ChecOutNetworkState.notConnected() = _NotConnected;}
