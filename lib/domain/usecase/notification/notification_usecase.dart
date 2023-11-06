import 'dart:io';
import 'dart:typed_data';

import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/core/paginated/notificaton_paginated/notification_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/domain/repositories/notification_repository.dart';
import 'package:commmercial_directory_seller/domain/repositories/offer_repository.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/register_company_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../app/locator.dart';
import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';

class GetNotificationUseCase extends UseCase<NotificationPaginated, Filter> {
  final NoticationRepository notificationRepository;

  GetNotificationUseCase({required this.notificationRepository});
  @override
  Future<Result<NotificationPaginated, Exceptions>> call(
    Filter params,
  ) async {
    return notificationRepository.fetchNotification(params.toJson());
  }
}
