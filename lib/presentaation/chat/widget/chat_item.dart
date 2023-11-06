import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/domain/entities/chat_entity/conversation_response.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({required this.conversation, this.type, Key? key})
      : super(key: key);
  final ConversationEntity conversation;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        conversation.unread = 0;
        context.pushNamed(Routes.chat.name,
            extra: conversation, queryParameters: {"type": type ?? ""});
      },
      leading: SizedBox(
        width: 6.h,
        height: 6.h,
        child: CachedNetworkImage(
          imageUrl: conversation.avatar ?? "",
          imageBuilder: (_, imageProvider) {
            return Container(
              width: 6.h,
              height: 6.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  )),
            );
          },
          errorWidget: (context, url, error) => ProfileAvatar(
              width: 6.h,
              height: 6.h,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Colors.white),
              firstName: conversation.name?.split(" ")[0] ?? " ",
              lastName: ""),
          placeholder: (_, __) => Center(
            child: SkeletonItem(
                child: Container(
              width: 6.h,
              height: 6.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Theme.of(context).colorScheme.background),
            )),
          ),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Row(
          children: [
            Text(
              conversation.name ?? "",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 1.w,
            ),
            const Icon(
              Icons.circle,
              size: 8,
              color: Colors.black,
            ),
            SizedBox(
              width: 1.w,
            ),
            if (conversation.name == "Support")
              Text(
                "${conversation.id}",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
              ),
            if (conversation.name != "Support")
              Text(
                conversation.offerTitle ?? conversation.adTitle ?? "",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
              )
          ],
        ),
      ),
      subtitle: Text(
        conversation.lastMessage ?? '',
        style: TextStyle(
            color: conversation.unread == 0 ? Colors.grey : Colors.black26,
            fontSize: 13.sp),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: () {
        if ((conversation.unread ?? 0) != 0) {
          return Container(
            alignment: Alignment.center,
            width: 7.w,
            height: 7.w,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: Text(
              () {
                if (conversation.unread! <= 9) {
                  return "${conversation.unread}";
                } else {
                  return "${9}+";
                }
              }(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        }
      }(),
    );
  }
}
