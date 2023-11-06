import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/assets.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/request/payment/payment_request.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/activity_bloc/activity_project_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/payment/payment_bloc/payment_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/profile/screens/profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ProfileProjectScreen extends StatelessWidget {
  const ProfileProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);

    return BlocProvider(
      create: (context) => ActivityProjectBloc(
          getDetailsCompanyUseCase: sl(), editCompanyUseCase: sl())
      // ..add(const ActivityProjectEvent.loadDetailsProfile()
      ,
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          state.whenOrNull(
            succes: (url) {
              context.pushNamed(
                Routes.paymentScreen.name,
                extra: url,
              );
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("your_activity").tr(),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: user?.upgraded?.logo ?? "",
                          imageBuilder: (ctx, imageProvider) {
                            return Container(
                              height: 13.h,
                              width: 13.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  // border: Border.all(
                                  //     color: Colors.grey, width: 8),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                          errorWidget: (context, url, error) => Container(
                            height: 13.h,
                            width: 13.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      Assets.assets_icons_person_png),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          placeholder: (_, __) => Shimmer.fromColors(
                            baseColor: Colors.grey.shade200,
                            highlightColor: Colors.grey.shade50,
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.3.h,
                          right: 1.h,
                          child: user?.verification == false
                              ? GestureDetector(
                                  onTap: () => dialogVerification(context, 50),
                                  child: Container(
                                    height: 2.5.h,
                                    width: 2.5.h,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(3.h),
                                    ),
                                    child: SvgPicture.asset(
                                        Assets.assets_icons_exclamation_svg),
                                  ),
                                )
                              : SizedBox(
                                  height: 2.5.h,
                                  width: 2.5.h,
                                  child: Image.asset(
                                    Assets.assets_icons_verivication_png,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      user?.commerialActivityName ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 17.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      user?.commerialActivityPhone ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 15.sp),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                ProfileItem(
                  title: "edit_activity".tr(),
                  leading: const Icon(Iconsax.menu_board),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () async {
                    await context.pushNamed(Routes.detailsProject.name).then(
                        (value) => context.read<ActivityProjectBloc>().add(
                            const ActivityProjectEvent.loadDetailsProfile()));
                  },
                ),
                ProfileItem(
                  title: 'edit_schedule'.tr(),
                  leading: const Icon(Iconsax.menu_board),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () async {
                    await context.pushNamed(Routes.editworkdays.name).then(
                      (value) {
                        value as bool;
                        if (value) {
                          context.read<ActivityProjectBloc>().add(
                              const ActivityProjectEvent.loadDetailsProfile());
                        }
                      },
                    );
                  },
                ),
                ProfileItem(
                  title: 'edit_social_account'.tr(),
                  leading: const Icon(Iconsax.menu_board),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () async {
                    await context.pushNamed(Routes.editsocialaccount.name).then(
                      (value) {
                        value as bool;
                        if (value) {
                          context.read<ActivityProjectBloc>().add(
                              const ActivityProjectEvent.loadDetailsProfile());
                        }
                      },
                    );
                  },
                ),
                ProfileItem(
                  onTap: () async {
                    await context.pushNamed(Routes.addassistant.name).then(
                      (value) {
                        value as bool;
                        if (value) {
                          context.read<ActivityProjectBloc>().add(
                              const ActivityProjectEvent.loadDetailsProfile());
                        }
                      },
                    );
                  },
                  title: 'add_assistant'.tr(),
                  leading: const Icon(Iconsax.menu_board),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                ProfileItem(
                  title: "Statistics".tr(),
                  leading: const Icon(Iconsax.chart),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> dialogVerification(BuildContext context, double amount) {
    return SmartDialog.show(
      builder: (_) => Container(
        height: 25.h,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(children: [
            Text(
              "Documentation_request",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ).tr(),
            const Text('هنا تضع مزايا وخصائص التوثيق'),
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(5)),
                  onPressed: () async {
                    SmartDialog.dismiss();

                    await dialogPayment(
                      context,
                      50,
                      "Verification",
                      null,
                      null,
                      null,
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: const Text("Documentation_request").tr(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 7.h,
                ),
                TextButton(
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(5)),
                  onPressed: () async {
                    SmartDialog.dismiss();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: const Text("cancel").tr(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
          ]),
        ),
      ),
    );
  }
}
