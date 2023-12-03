import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/costume_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class StateSubscriptionScreen extends HookWidget {
  const StateSubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());

    InformationEntity package = sl<LocalDataSource>().getValue(
      LocalDataKeys.infoamationPackage,
    ) ?? InformationEntity();

    ProfileEntity? user = sl<LocalDataSource>().getValue(
      LocalDataKeys.profile,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription_status').tr(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      padding: EdgeInsets.all(1.5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            "${"Your_package".tr()} ${package.name?? ''}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${"Its_duration".tr()} ${package.duration??''} ${"months".tr()}",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 2.h,
                              ),
                              Text("${package.price??''}💲",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Properties",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp),
                              ).tr(),
                              ...?package.features?.map(
                                (e) {
                                  return Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    '⚫'
                                            " "
                                        '${e??'1665'}'
                                    ,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                              ).toList(),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '⚫${"You_are_registered_with_us".tr()}',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Text(
                          timeago.format(
                            DateTime.parse(user?.createdAt ?? ""),
                            locale: context.locale.languageCode,
                          ),
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 6.h,
                      width: 30.h,
                      child: custombuttom(
                        //color: Colors.,
                        onTap: () async {
                          context.pushNamed(Routes.subscriptions.name);
                        },
                        child: Text(
                          "Subscription_renewal",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w800),
                        ).tr(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
