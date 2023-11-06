import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_plus/share_plus.dart';
part 'main_event.dart';
part 'main_state.dart';
part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(_Initial()) {
    on<MainEvent>(_mapEventToState);
  }
  FutureOr _mapEventToState(MainEvent event, Emitter<MainState> emit) {
    return event.map(
      share: (value) {
        Future<void> share() async {
          await Share.share(
            'https://play.google.com/store/apps/details?id=com.playsportgames.motorsportrivals&hl=en_US&gl=US',
          );
        }
      },
    );
  }
}
