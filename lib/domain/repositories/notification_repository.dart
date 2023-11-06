
import 'package:commmercial_directory_seller/core/paginated/notificaton_paginated/notification_paginated.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';

import '../../core/excptions/exceptions.dart';

abstract class NoticationRepository {
  Future<Result<NotificationPaginated, Exceptions>> fetchNotification(
      Map<String, dynamic> filter);
 
}
