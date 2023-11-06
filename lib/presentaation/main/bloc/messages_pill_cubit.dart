import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';

class MessagesPillCubit extends Cubit<int> {
  MessagesPillCubit(this.localDataSource)
      : super(localDataSource.getValue<int>(LocalDataKeys.unreadMessages) ?? 0);
  final LocalDataSource localDataSource;

  updateMessageCount(bool newP) async {
    final count =
        localDataSource.getValue<int>(LocalDataKeys.unreadMessages) ?? 0;
    if (newP) {
      await localDataSource.setValue(LocalDataKeys.unreadMessages, count + 1);
      return emit(count + 1);
    } else {
      emit(count);
    }
  }

  read() async {
    await localDataSource.setValue(LocalDataKeys.unreadMessages, state - 1);
    return emit(state + 1);
  }
}
