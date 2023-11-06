import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.dart';
part 'counter_cubit.freezed.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  Stream<int> mapEventToStates() async* {
    yield state + 1;
  }
}
