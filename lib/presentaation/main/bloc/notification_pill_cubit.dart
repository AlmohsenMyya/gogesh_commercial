import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';

class NotificationPillCubit extends Cubit<int> {
  NotificationPillCubit(this.localDataSource)
      : super(
            localDataSource.getValue<int>(LocalDataKeys.unreadNotifications) ??
                0);

  final LocalDataSource localDataSource;
  updateNotificationCount(bool newP) async {
    final count =
        localDataSource.getValue<int>(LocalDataKeys.unreadNotifications) ?? 0;
    if (newP) {
      await localDataSource.setValue(
          LocalDataKeys.unreadNotifications, count + 1);
      return emit(count + 1);
    } else {
      emit(count);
    }
  }

  read() async {
    await localDataSource.setValue(
        LocalDataKeys.unreadNotifications, state - 1);
    return emit(state - 1);
  }
}
