import 'package:carousel_slider/carousel_slider.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/presentaation/Subscriptions/bloc/subscriptions_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/payment/payment_bloc/payment_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../app/theme.dart';
import '../../widgets/costume_button.dart';
import '../bloc/subscriptions_cubit.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({super.key});
  @override
  Widget build(BuildContext context) {
    List<Color> items = const [
      Color(0xFFF0E68C),
      Color(0xFFE5E4E2),
      Color(0xFF70FE73)
    ];

    return BlocListener<PaymentBloc, PaymentState>(
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SubscriptionsCubit()),
          BlocProvider(
              create: (context) =>
                  SubscriptionsBloc(getPackageSubscrptionUseCase: sl())
                    ..add(const SubscriptionsEvent.loadPackage()))
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Subscriptions").tr(),
            centerTitle: true,
          ),
          body: SafeArea(
            child: BlocBuilder<SubscriptionsCubit, int>(
              builder: (context, state) {
                return BlocBuilder<SubscriptionsBloc, SubscriptionsState>(
                  builder: (context, stat) {
                    return stat.maybeWhen(
                      loading: () => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade50,
                          child: Container(
                            height: 80.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      orElse: () => const Text("data"),
                      dataLoaded: (package) => CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Column(
                              children: [
                                // SizedBox()
                                CarouselSlider(
                                  options: CarouselOptions(
                                    // autoPlay: true,
                                    height: 70.h,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.4,
                                    onPageChanged: (index, reason) {
                                      context
                                          .read<SubscriptionsCubit>()
                                          .changeIndex(index);
                                    },
                                  ),
                                  items: package.map((i) {
                                    return Builder(
                                      builder: (
                                        BuildContext context,
                                      ) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0,
                                          ),
                                          padding: EdgeInsets.all(1.5.h),
                                          decoration: BoxDecoration(
                                              color: items[state],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Text(
                                                i.name!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.sp),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${i.duration}" +
                                                        " " +
                                                        "months".tr(),
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 2.h,
                                                  ),
                                                  Text("${i.price}💲",
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Properties",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13.sp),
                                                      ).tr(),
                                                      ...?i.features?.map(
                                                        (e) {
                                                          return Text(
                                                            '⚫' " " + e,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          );
                                                        },
                                                      ).toList(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                                width: 30.h,
                                                child: custombuttom(
                                                  color: Colors.white,
                                                  onTap: () async {
                                                    await dialogPayment(
                                                      context,
                                                      i.price!,
                                                      'Subscription',
                                                      i.id,
                                                      null,
                                                      null,
                                                    ).then((value) =>
                                                        context.pop());
                                                  },
                                                  child: Text(
                                                    "Subscribe",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ).tr(),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                DotsIndicator(
                                  dotsCount: items.length,
                                  position: state,
                                  decorator: DotsDecorator(
                                    color: const Color.fromARGB(
                                        255, 241, 218, 218), // Inactive color
                                    activeColor: items[state],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
