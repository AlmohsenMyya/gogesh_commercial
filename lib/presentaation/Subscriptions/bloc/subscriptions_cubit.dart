import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionsCubit extends Cubit<int> {
  SubscriptionsCubit() : super((0));

  changeIndex(int index) {
    emit(index);
  }
}


