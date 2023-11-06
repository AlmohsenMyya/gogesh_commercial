import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:commmercial_directory_seller/presentaation/offer/add_edit_offer/add_edit_offer_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/offer/widgets/skelton_widget_shimmer.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/carsoul_slider_widget.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletons/skeletons.dart';

import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../widgets/costume_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class OfferDetailsScreen extends StatelessWidget {
  const OfferDetailsScreen({required this.id, Key? key}) : super(key: key);
  final int? id;
  @override
  Widget build(BuildContext context) {
    final role = sl<LocalDataSource>().getValue(LocalDataKeys.role);
    timeago.setLocaleMessages('ar', timeago.ArMessages());

    return BlocProvider(
      create: (context) => AddEditOfferBloc(
        deleteOffersUseCase: sl(),
        getOfferDetailsUseCase: sl(),
      )..add(
          AddEditOfferEvent.loadOfferDetails(
            id: id!,
            path: '/seller/offers/',
          ),
        ),
      child: BlocListener<AddEditOfferBloc, AddEditOfferState>(
        listener: (context, state) {
          state.maybeWhen(
            succes: (msg) {
              AlertController.show("", msg!, TypeAlert.success);
              context.pop();
            },
            orElse: () {},
            error: (error) {
              AlertController.show("", error!, TypeAlert.error);
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Offer details").tr(),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<AddEditOfferBloc, AddEditOfferState>(
                buildWhen: (previous, current) => current.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                  dataLoaded: (data) => true,
                ),
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () => const SizedBox(),
                      loading: () => const SkeltonwidgetShimmer(),
                      dataLoaded: (value) => Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CarsoulSliderWidget(
                                          images: value.data.images!),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      value.data.reason != null
                                          ? Text("The_reason_for_rejecting_your_id",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17.sp))
                                              .tr()
                                          : const SizedBox(),
                                      value.data.reason != null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                value.data.reason ?? '',
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            )
                                          : const SizedBox(),
                                      value.data.reasonUpdated != null &&
                                              value.data.updatedId != null
                                          ? Text("The_reason_for_rejecting_your_uptadet_id",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17.sp))
                                              .tr()
                                          : const SizedBox(),
                                      value.data.reasonUpdated != null &&
                                              value.data.updatedId != null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                value.data.reasonUpdated ?? '',
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            )
                                          : const SizedBox(),
                                      Row(
                                        children: [
                                          Text(value.data.title!,
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
                                                  value.data.createdAt ??
                                                      '2002-12-28'),
                                              locale:
                                                  context.locale.languageCode,
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
                                          Text(
                                              "${value.data.price} ${"riyal".tr()}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.sp)),
                                          const Expanded(child: SizedBox()),
                                          const Icon(
                                              Icons.remove_red_eye_outlined),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            value.data.views == null
                                                ? "0"
                                                : value.data.views.toString(),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text("Offer details",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17.sp))
                                          .tr(),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          value.data.description!,
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Text("Offer terms",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17.sp))
                                          .tr(),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          value.data.condition ?? '',
                                          style: const TextStyle(
                                              color: Colors.grey),
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
                                  SizedBox(
                                    height: 6.h,
                                    width: double.infinity,
                                    child: custombuttom(
                                        onTap: () async {
                                          await bottomsheet(
                                              context, value.data);
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ).tr(),
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  value.data.status == 'Not_Paid'&&
                                    role == TypeSeller.admin.name
                                      ? SizedBox(
                                          height: 6.h,
                                          width: double.infinity,
                                          child: custombuttom(
                                              onTap: () async {
                                                await dialogPayment(
                                                        context,
                                                        value.data.total ?? 0,
                                                        'Offer_Paid',
                                                        null,
                                                        value.data.id,
                                                        null)
                                                    .then((value) =>
                                                        context.pop());
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
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ).tr(),
                                                ],
                                              )),
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                    height: value.data.status == 'Not_Paid'
                                        ? 2.h
                                        : 0.h,
                                  ),
                                  BlocBuilder<AddEditOfferBloc,
                                      AddEditOfferState>(
                                    builder: (context, state) {
                                      return SizedBox(
                                        height: 6.h,
                                        width: double.infinity,
                                        child: custombuttom(
                                          onTap: () {
                                            context
                                                .read<AddEditOfferBloc>()
                                                .add(
                                                  AddEditOfferEvent
                                                      .deleteOffers(
                                                    id: id!,
                                                  ),
                                                );
                                          },
                                          color: Colors.redAccent,
                                          child: state.maybeWhen(
                                              loading: () =>
                                                  LoadingAnimationWidget
                                                      .prograssiveDots(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    size: 20.sp,
                                                  ),
                                              orElse: () => Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ).tr(),
                                                    ],
                                                  )),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              ),
                            ],
                          ));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottomsheet(BuildContext context, OfferEntity? offer) {
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
                  "We would like to warn you that the amendment to the id is made after approval by the administration",
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
                  height: 5.h,
                ),
                SizedBox(
                  // height: 5.h,
                  width: double.infinity,
                  child: custombuttom(
                    onTap: () {
                      context.pop();
                      context.pushNamed(Routes.editoffers.name, extra: offer);
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
                  // height: 5.h,
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
