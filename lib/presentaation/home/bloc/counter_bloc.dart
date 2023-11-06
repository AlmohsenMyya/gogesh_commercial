import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_bloc/stream_bloc.dart';

abstract class CounterEvent {} // Shared counter event type

class Increment implements CounterEvent {} // Increment counter event

class Decrement implements CounterEvent {} // Decrement counter event

class OnCounterBloc extends Bloc<CounterEvent, int> { // Official Bloc – `on`s
  OnCounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }
}

class StreamCounterBloc extends StreamBloc<CounterEvent, int> { // StreamBloc – `mapEventToStates`
  StreamCounterBloc() : super(0);

  @override
  Stream<int> mapEventToStates(CounterEvent event) async* {
    if (event is Increment) {
      yield state + 1;
    } else if (event is Decrement) {
      yield state - 1;
    }
  }
}
