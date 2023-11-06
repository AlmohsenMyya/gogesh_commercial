import 'dart:convert';

import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/activity_bloc/activity_project_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/main/information_activity_bloc/information_activity_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/main/widget/costume_bottom_navigation.dart';
import 'package:commmercial_directory_seller/presentaation/main/widget/side_menu_widget.dart';
import 'package:commmercial_directory_seller/presentaation/payment/payment_bloc/payment_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/profile/bloc/profile_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:sizer/sizer.dart';

import '../../app/pusher.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../assets.dart';
import '../../domain/entities/chat_entity/conversation_response.dart';
import '../chat/conversationSupport_bloc/conversation_bloc.dart';
import '../chat/conversation_customer_bloc/conversation_customer_bloc.dart';
import 'bloc/bottom_nav_cubit.dart';
import 'bloc/messages_pill_cubit.dart';
import 'bloc/notification_pill_cubit.dart';
import 'bloc/side_menu_cubit.dart';

final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

class MainScreen extends StatefulWidget {
  const MainScreen({required this.child, required this.name, Key? key})
      : super(key: key);
  final Widget child;
  final String name;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    saveLocale(context.locale.languageCode);
    print(sl<LocalDataSource>()
        .getValue<ProfileEntity>(
          LocalDataKeys.profile,
        )
        ?.toJson());
    CompanyEntity? activityes;

    return SideMenu(
      menu: GestureDetector(
          onTap: () => _sideMenuKey.currentState?.closeSideMenu(),
          child: SideMenuWidget()),
      key: _sideMenuKey,
      background: AppTheme.green,
      closeIcon: null,
      inverse: true,
      type: SideMenuType.slideNRotate,
      child: MultiBlocListener(
        listeners: [
          BlocListener<SideMenuCubit, bool>(
            listener: (_, __) {
              final state = _sideMenuKey.currentState;
              if (state?.isOpened ?? false) {
                state?.closeSideMenu(); // close side menu
              } else {
                state?.openSideMenu(); // open side menu
              }
            },
          ),
          BlocListener<PaymentBloc, PaymentState>(
            listener: (context, state) {
              state.whenOrNull(
                loading: () => SmartDialog.showLoading(),
                succes: (value) {
                  SmartDialog.dismiss();
                  context.pushNamed(
                    Routes.paymentScreen.name,
                    extra: value,
                  );
                },
              );
            },
          ),
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (data) {
                  ProfileEntity? user =
                      sl<LocalDataSource>().getValue(LocalDataKeys.profile);
                  if (user != null) {
                    if (user.status == "Rejected") {
                      SmartDialog.show(
                        builder: (contex) => Container(
                          height: 40.h,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          alignment: Alignment.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "Notice",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ).tr(),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "-${'description'.tr()}",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "We would like to alert you that your account has been rejected by the administration. Modify the account and re-submit the request",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ).tr(),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "-${"details".tr()}",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            user.reason ?? "",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ).tr(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: custombuttom(
                                  onTap: () async {
                                    SmartDialog.dismiss();
                                    context.pushNamed(
                                      Routes.editProfile.name,
                                    );
                                  },
                                  child:
                                      const Text('View_details_and_edit').tr(),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                        ),
                      );
                      return;
                    }
                    if (user.status == "Pending") {
                      SmartDialog.show(
                        builder: (context) => Container(
                          height: 25.h,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      "Notice",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).tr(),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'description',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).tr(),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "We would like to alert you that your account is under review by the administration and you will be notified of a response within 48 hours",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).tr(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      return;
                    }
                    if (user.status == "Inactive") {
                      SmartDialog.show(
                        builder: (context) => Container(
                          height: 35.h,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      "Notice",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).tr(),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'description',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).tr(),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "We would like to alert you that your account has been disabled by the administration due to a violation of a regulatory matter. Please contact support for further inquiries",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).tr(),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    child: custombuttom(
                                      onTap: () async {
                                        SmartDialog.dismiss();
                                        context.pushNamed(
                                          Routes.report.name,
                                        );
                                      },
                                      child: const Text("contact_us").tr(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      return;
                    }
                    if (user.upgraded != null) {
                      if (user.upgraded?.upgradedStatus == "Pending") {
                        SmartDialog.show(
                          builder: (context) => Container(
                            height: 25.h,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            alignment: Alignment.topCenter,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        "Notice",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).tr(),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'description',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).tr(),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "We would like to alert you that the development of your account is under review by the administration and you will be notified of the response within 48 hours",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).tr(),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                        return;
                      }
                      if (user.upgraded?.upgradedStatus == "Rejected") {
                        SmartDialog.show(
                          builder: (_) => Container(
                            height: 40.h,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            alignment: Alignment.topCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "Notice",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ).tr(),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              "-${'description'.tr()}",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              "We would like to alert you that your account has been rejected by the administration. Modify the account and re-submit the request",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ).tr(),
                                          ),
                                          user.reason == null
                                              ? Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    "-${"details".tr()}",
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(),
                                          user.reason == null
                                              ? Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    user.reason ?? "",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ).tr(),
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: custombuttom(
                                    onTap: () async {
                                      SmartDialog.dismiss();
                                      context.pushNamed(
                                        Routes.detailsProject.name,
                                      );
                                    },
                                    child: const Text('View_details_and_edit')
                                        .tr(),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                              ],
                            ),
                          ),
                        );
                        return;
                      }
                    }
                  }
                },
              );
            },
          ),
          BlocListener<InformationActivityBloc, InformationActivityState>(
            listener: (context, state) {
              state.whenOrNull();
            },
          ),
          BlocListener<ActivityProjectBloc, ActivityProjectState>(
            listener: (context, state) {
              state.whenOrNull(
                dataLoaded: (data) {
                  activityes =
                      sl<LocalDataSource>().getValue(LocalDataKeys.activity);
                  if (activityes?.status != 'Approved') {
                    print(activityes?.status);
                    smartDialogNotActivated(context);
                  } else {
                    data.data.actived! ? null : smartDialogPayment(context);
                  }
                },
              );
            },
          ),
        ],
        child: WillPopScope(
          onWillPop: () async {
            final state = _sideMenuKey.currentState;
            if (state?.isOpened ?? false) {
              state?.closeSideMenu();
              return false; // close side menu
            }
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              actions: [
                // IconButton(
                //   onPressed: () {
                //     context.pushNamed(Routes.listchatscreen.name);
                //   },
                //   icon: BlocBuilder<MessagesPillCubit, int>(
                //     builder: (context, state) {
                //       return Badge(
                //         isLabelVisible: state != 0,
                //         label: Text(
                //           state.toString(),
                //           style: const TextStyle(fontWeight: FontWeight.w500),
                //         ),
                //         child: const Icon(
                //           Ionicons.chatbubble_ellipses_outline,
                //         ),
                //       );
                //     },
                //   ),
                // ),
                IconButton(onPressed: () {
                  context.pushNamed(Routes.notification.name);
                }, icon: BlocBuilder<NotificationPillCubit, int>(
                  builder: (context, state) {
                    return Badge(
                      isLabelVisible: state != 0,
                      label: Text(
                        state.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      child: const Icon(
                        Ionicons.notifications_outline,
                      ),
                    );
                  },
                ))
              ],
              leading: IconButton(
                onPressed: () {
                  context.read<SideMenuCubit>().sideMenuActionTaken();
                },
                icon: const Icon(Icons.menu),
              ),
              centerTitle: true,
              title: Text(widget.name).tr(),
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  widget.child,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BlocBuilder<BottomNavCubit, int>(
                      builder: (context, state) {
                        return CostumeBottomNavigation(
                          index: state,
                          onTap: (int index) {
                            context.read<BottomNavCubit>().changeIndex(index);
                            switch (index) {
                              case 0:
                                context.goNamed(Routes.home.name,
                                    queryParameters: {"name": "home"});
                                break;
                              case 1:
                                context.goNamed(Routes.myAdvertising.name,
                                    queryParameters: {"name": "My ads"});
                                break;
                              case 2:
                                context.goNamed(Routes.listchatscreen.name,
                                    queryParameters: {"name": "inbox"});

                                break;
                              case 3:
                                context.goNamed(Routes.me.name,
                                    extra: false,
                                    queryParameters: {"name": "me"});

                                break;
                            }
                          },
                          items: [
                            Item(
                              icon: SvgPicture.asset(
                                  Assets.assets_home_bottom_icons_home_svg),
                              activeIcon: SvgPicture.asset(
                                Assets.assets_home_bottom_icons_home_active_svg,
                              ),
                              title: Text(
                                "offers",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ).tr(),
                              activeTitle: Text(
                                "offers",
                                style: TextStyle(fontSize: 11.5.sp),
                              ).tr(),
                            ),
                            Item(
                              icon: Icon(
                                Icons.rectangle_outlined,
                                size: 3.h,
                                color: Colors.white,
                              ),
                              // SvgPicture.asset(
                              //   Assets.assets_home_bottom_icons_fav_svg,
                              //   height: 20,
                              //   width: 20,
                              //   color: Colors.white,
                              // ),
                              activeIcon: Icon(
                                Icons.rectangle_outlined,
                                size: 3.h,
                                color: Colors.black,
                              ),
                              title: Text(
                                "My ads",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11.sp),
                              ).tr(),
                              activeTitle: Text(
                                "My ads",
                                style: TextStyle(fontSize: 11.5.sp),
                              ).tr(),
                            ),
                            Item(
                              icon: const Icon(
                                Iconsax.message,
                                color: Colors.white,
                              ),
                              activeIcon: const Icon(Iconsax.message),
                              title: Text(
                                "chat",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11.sp),
                              ).tr(),
                              activeTitle: Text(
                                "chat",
                                style: TextStyle(fontSize: 10.sp),
                              ).tr(),
                            ),
                            Item(
                              icon: SvgPicture.asset(
                                  Assets.assets_home_bottom_icons_user_svg),
                              activeIcon: SvgPicture.asset(
                                Assets.assets_home_bottom_icons_user_active_svg,
                              ),
                              title: Text(
                                "me",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ).tr(),
                              activeTitle: Text(
                                "me",
                                style: TextStyle(fontSize: 11.5.sp),
                              ).tr(),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pusher.unsubscribe(
        channelName:
            "seller.${sl<LocalDataSource>().getValue<ProfileEntity>(LocalDataKeys.profile)?.id}");
    super.dispose();
  }

  @override
  void initState() {
    pusherListener();
    super.initState();
  }

  Future<void> pusherListener() async {
    await pusher.connect();
    final userId = sl<LocalDataSource>()
        .getValue<ProfileEntity>(LocalDataKeys.profile)
        ?.id;
    await pusher.subscribe(
      channelName: "seller.$userId",
      onEvent: (dynamic event) {
        event as PusherEvent;
        if (event.eventName != "pusher:subscription_succeeded") {
          if (router.location != Routes.listchatscreen.path ||
              router.location != Routes.chat.path) {
            sl<MessagesPillCubit>().updateMessageCount(true);
          }
          final conversation =
              ConversationEntity.fromJson(jsonDecode(event.data)["contact"]);
          if (conversation.name == "Support") {
            context.read<ConversationBloc>().conversationUpdated(conversation);
          } else {
            context
                .read<ConversationCustomerBloc>()
                .conversationUpdated(conversation);
          }
        }
      },
    );
  }
}

Future<dynamic> smartDialogPayment(BuildContext context) {
  return SmartDialog.show(
    builder: (_) {
      return Container(
        height: 300,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Notice",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'description',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "You did not pay the dues to activate the account for the first time and benefit from the free package for 3 months.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr(),
                    ),
                    const Spacer(),
                    SizedBox(
                      child: custombuttom(
                        onTap: () async {
                          SmartDialog.dismiss();

                          await dialogPayment(context, 35,
                              'Active_Cmmercial_Activity', null, null, null);
                        },
                        child: const Text('activate').tr(),
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
      );
    },
  );
}

Future<dynamic> smartDialogNotActivated(BuildContext context) {
  return SmartDialog.show(
    builder: (_) {
      return Container(
        height: 30.h,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Notice",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'description',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "We would like to alert you that your business is being reviewed by management",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<dynamic> smartDialogNotSubscription(BuildContext context) {
  return SmartDialog.show(
    builder: (_) {
      return Container(
        height: 30.h,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Notice",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'description',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "You have not yet activated a subscription package for your business",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 52.w,
                  child: custombuttom(
                    onTap: () async {
                      SmartDialog.dismiss();

                      context.pushNamed(Routes.subscriptions.name);
                    },
                    child: const Text("show_more_details").tr(),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
