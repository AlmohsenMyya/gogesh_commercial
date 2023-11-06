import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/add_edit_ads/advertising_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/offer/widgets/skelton_widget_shimmer.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/carsoul_slider_widget.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../widgets/costume_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class AdsDetailsScreen extends StatelessWidget {
  const AdsDetailsScreen({required this.id, Key? key}) : super(key: key);
  final int? id;
  @override
  Widget build(BuildContext context) {
    final role = sl<LocalDataSource>().getValue(LocalDataKeys.role);
    return BlocProvider(
      create: (context) => AddEditAdsBloc(
        getAdsDetailsUseCase: sl(),
        deleteAdsUseCase: sl(),
      )..add(
          AddEditAdsEvent.loadAdsDetails(id: id!, path: '/ads/'),
        ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("ads_details").tr(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<AddEditAdsBloc, AddEditAdsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loading: () => const SkeltonwidgetShimmer(),
                  dataLoaded: (ads) => Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarsoulSliderWidget(images: [ads.images!]),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text(ads.title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp)),
                                  const Expanded(child: SizedBox()),
                                  const Icon(Icons.timelapse),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    timeago.format(
                                      DateTime.parse(
                                          ads.createdAt ?? '2002-12-28'),
                                      locale: context.locale.languageCode,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Text("${"price".tr()} : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp)),
                                  Text("${ads.price} ${"riyal".tr()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp)),
                                  const Expanded(child: SizedBox()),
                                  const Icon(Icons.remove_red_eye_outlined),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    ads.views == null
                                        ? "0"
                                        : ads.views.toString(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text("descrption_ads",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.sp))
                                  .tr(),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  ads.description!,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        children: [
                          ads.status == 'rejected' ||
                                  ads.status == 'Pending' ||
                                  ads.status == 'Not_Paid'
                              ? SizedBox(
                                  height: 6.h,
                                  width: double.infinity,
                                  child: custombuttom(
                                      onTap: () async {
                                        await bottomsheet(context);
                                      },
                                      color: AppTheme.secondaryColor,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Iconsax.message_edit4,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const Text(
                                            "edit",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ).tr(),
                                        ],
                                      )),
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: ads.status == 'Not_Paid' &&
                                    role == TypeSeller.admin.name
                                ? 2.h
                                : 0.h,
                          ),
                          ads.status == 'Not_Paid' &&
                                  role == TypeSeller.admin.name
                              ? SizedBox(
                                  height: 6.h,
                                  width: double.infinity,
                                  child: custombuttom(
                                      onTap: () async {
                                        await dialogPayment(
                                                context,
                                                ads.total ?? 0,
                                                'Ads_Paid',
                                                null,
                                                null,
                                                ads.id)
                                            .then((value) =>
                                                SmartDialog.dismiss());
                                      },
                                      color: AppTheme.green,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.credit_card,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const Text(
                                            "not_paid",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ).tr(),
                                        ],
                                      )),
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 6.h,
                            width: double.infinity,
                            child: custombuttom(
                                onTap: () {},
                                color: Colors.redAccent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.delete_forever,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    const Text(
                                      "delete",
                                      style: TextStyle(color: Colors.white),
                                    ).tr(),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottomsheet(BuildContext context) {
    return showModalBottomSheet(
        // useRootNavigator: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (_) {
          return Container(
            padding: EdgeInsets.only(top: 2.5.h, right: 1.0.h, left: 1.0.h),
            height: 40.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "alert",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.green),
                ).tr(),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "We would like to warn you that the amendment to the offer is made after approval by the administration",
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
                ).tr(),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "You will be notified if the amendment is approved",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ).tr(),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  height: 5.h,
                  width: double.infinity,
                  child: custombuttom(
                    onTap: () {
                      context.pop();
                      context.goNamed(Routes.editAdvertising.name, extra: id);
                    },
                    color: AppTheme.secondaryColor,
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ).tr(),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 5.h,
                  width: double.infinity,
                  child: custombuttom(
                    onTap: () {
                      context.pop();
                    },
                    color: AppTheme.green,
                    child: const Text(
                      "back",
                      style: TextStyle(color: Colors.white),
                    ).tr(),
                  ),
                )
              ],
            ),
          );
        });
  }
}
