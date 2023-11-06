import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../assets.dart';
import '../../../domain/entities/notification_entity/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({required this.notificationEntity, Key? key})
      : super(key: key);
  final NotificationEntity notificationEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 20.w,
        height: 20.w,
        child: Container(
          width: 20.w,
          height: 20.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: _notificationImage(),
        ),
      ),
      title: Text(
        "${notificationEntity.title}",
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis),
      ),
      subtitle: Text(
        "${notificationEntity.content}",
        style: TextStyle(color: Colors.grey, fontSize: 13.sp),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _notificationImage() {
    switch (notificationEntity.type ?? "success") {
      case "success":
        return SvgPicture.asset(
            Assets.assets_notifications_transaction_done_svg);
      case "warning":
        return SvgPicture.asset(
            Assets.assets_notifications_transaction_failed_svg);
      case "danger":
        return SvgPicture.asset(
            Assets.assets_notifications_transaction_failed_svg);
      default:
        return SvgPicture.asset(
            Assets.assets_notifications_transaction_failed_svg);
    }
  }
}
