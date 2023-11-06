import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local_data_source/local_data_keys.dart';
import '../../data/local_data_source/local_data_source.dart';

part 'chec_out_network_state.dart';
part 'chec_out_network_cubit.freezed.dart';

class ChecOutNetworkCubit extends Cubit<ChecOutNetworkState> {
  ChecOutNetworkCubit() : super(const ChecOutNetworkState.initial());

  connectInternet() {
    // StreamSubscription<ConnectivityResult> subscription =
    //     Connectivity().onConnectivityChanged.listen(
    //   (ConnectivityResult result) {
    //     if (result == ConnectivityResult.mobile) {
    //     } else if (result == ConnectivityResult.wifi) {
    //       emit(const ChecOutNetworkState.connected());
    //     } else if (result == ConnectivityResult.ethernet) {
    //       emit(const ChecOutNetworkState.connected());
    //     } else {
    //       emit(const ChecOutNetworkState.notConnected());
    //     }
    //   },
    // );
  }
}
