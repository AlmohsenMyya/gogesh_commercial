import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/entities/notification_entity/notification_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'notification_paginated.g.dart';

@JsonSerializable()
//@HiveType(typeId: 46)
class NotificationPaginated {
  NotificationPaginated({
    required this.data,
    required this.meta,
  });
  final List<NotificationEntity> data;
  Meta meta;
  factory NotificationPaginated.fromJson(Map<String, dynamic> json) =>
      _$NotificationPaginatedFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationPaginatedToJson(this);
}
