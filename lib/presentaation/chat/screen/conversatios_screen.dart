import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/presentaation/chat/screen/tap/seller_conversation_tap.dart';
import 'package:commmercial_directory_seller/presentaation/chat/screen/tap/support_conversation_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text("inbox").tr(),
        // ),
        body: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: 5.h,
              child: TabBar(
                // controller: controller,
                padding: EdgeInsets.only(left: 1.w, right: 1.w),
                tabs: [
                  Tab(text: "chat".tr()),
                  Tab(text: 'technical_support'.tr()),
                ],
                indicatorColor: AppTheme.green,
                // labelColor: Colors.black,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: AppTheme.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                onTap: (value) {},
              ),
            ),
            const Expanded(
              child: TabBarView(children: [
                SellerConversationTap(),
                SupportConversationTap(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
