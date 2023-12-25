import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:commmercial_directory_seller/presentaation/main/bloc/bloc/main_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/profile_avatar.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart' as easy_localization;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../assets.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../widgets/condition_builder.dart';

class SideMenuWidget extends StatelessWidget {
  SideMenuWidget({Key? key}) : super(key: key);

  final sideMenuContent = <Map<String, dynamic>>[
    {
      "title": "notifications",
      "icon": const Icon(Icons.notification_important),
      "route_name": Routes.notification.name
    },
    {
      "title": "Subscription_status",
      "icon": const Icon(Iconsax.chart_1),
      'route_name': Routes.stateSubscrption.name
    },
    // {
    //   "title": "report_abuse",
    //   "icon": const Icon(Iconsax.chart),
    //   "route_name": Routes.report.name
    // },
    {
      "title": "privacy_policy",
      "icon": const Icon(Icons.lock_open),
      "route_name": Routes.privacyPolicy.name
    },
    {
      "title": "Terms and Conditions",
      "icon": const Icon(
        Icons.question_mark_outlined,
      )
    },
    {
      "title": "rate_app",
      "icon": const Icon(
        Icons.star_border_rounded,
      )
    },
    {
      "title": "contact_us",
      "icon": SvgPicture.asset(Assets.assets_icons_c_phone_svg),
      "route_name": Routes.report.name
    },
  ];

  @override
  Widget build(BuildContext context) {
    ProfileEntity profile =
        sl<LocalDataSource>().getValue(LocalDataKeys.profile);
    final role = sl<LocalDataSource>().getValue(LocalDataKeys.role);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            ConditionBuilder(
                condition: () => true,
                builder: (context) => Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        CachedNetworkImage(
                          imageUrl: profile.image ?? "",
                          imageBuilder: (ctx, imageProvider) {
                            return Container(
                              height: 8.h,
                              width: 8.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                          errorWidget: (context, url, error) => ProfileAvatar(
                            height: 8.h,
                            width: 8.h,
                            lastName: profile.lastName ?? '',
                            firstName: profile.firstName ?? '',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          placeholder: (_, __) => Shimmer.fromColors(
                              baseColor: Colors.grey.shade200,
                              highlightColor: Colors.grey.shade50,
                              child: Container(
                                height: 8.h,
                                width: 8.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey),
                              )),
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 35.w,
                              child: FittedBox(
                                child: Text(
                                  "${profile.firstName ?? ''} ${profile.lastName ?? ''}",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  profile.email ?? "",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                elseBuilder: (context) => Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(8),
                      child: custombuttom(
                          onTap: () {}, child: const Text("login").tr()),
                    )),
            SizedBox(
              height: 2.h,
            ),
            role == TypeSeller.admin.name
                ? SideMenuItem(
                    title: "your_activity",
                    icon: const Icon(Icons.business),
                    routeName: Routes.profileProject.name,
                    current: true,
                  )
                : const SizedBox(),
            role == TypeSeller.admin.name
                ? SideMenuItem(
                    title: "Subscriptions",
                    icon: const Icon(Icons.credit_card),
                    routeName: Routes.subscriptions.name,
                    // current: true,
                  )
                : const SizedBox(),
            ...sideMenuContent.map((e) => SideMenuItem(
                  title: e['title'],
                  icon: e['icon'],
                  routeName: e['route_name'],
                )),
            SideMenuItem(
              title: "send_app_to_friend",
              icon: SvgPicture.asset(
                Assets.assets_icons_awesome_share_svg,
                width: 30,
                height: 30,
              ),
              onTap: () async => await Share.share(
                'https://play.google.com/store/apps/details?id=your.package.name',
              ),
            ),
            SideMenuItem(
              onTap: () async {
                final keylanguage =
                    sl<LocalDataSource>().getValue(LocalDataKeys.languageKey);

                context.goNamed(Routes.auth.name);
                await sl<LocalDataSource>().clear();
                await sl<Dio>().options.headers.remove("Authorization");
                await GoogleSignIn().signOut();
                await FacebookAuth.instance.logOut();
                sl<LocalDataSource>().setValue(
                  LocalDataKeys.userType,
                  UserType.onboarding,
                );

                GoogleSignIn().signOut();
              },
              title: "logout",
              icon: const Icon(Icons.logout),
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem(
      {required this.title,
      required this.icon,
      this.current = false,
      this.onTap,
      Key? key,
      this.routeName})
      : super(key: key);
  final String title;
  final String? routeName;
  final Widget icon;
  final VoidCallback? onTap;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => context.pushNamed(routeName!),
      child: LayoutBuilder(builder: (_, c) {
        return SizedBox(
          width: c.maxWidth / 1.2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(bottom: 3),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: current ? Colors.white : null,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )),
              child: Row(
                children: [
                  Theme(
                    data: ThemeData(
                        iconTheme: const IconThemeData(color: Colors.white)),
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppTheme.secondaryColor,
                      ),
                      child: Center(child: icon),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ).tr(),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
