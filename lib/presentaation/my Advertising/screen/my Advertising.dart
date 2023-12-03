import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/assets.dart';
import 'package:commmercial_directory_seller/core/bloc/error.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:commmercial_directory_seller/presentaation/filter_cubit/filter_cubit.dart';
import 'package:commmercial_directory_seller/presentaation/main/main_screen.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/ads_bloc/ads_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/widget/ads_widget.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/error_widget.dart'
    as error_widget;
import 'package:commmercial_directory_seller/presentaation/widgets/filter_ads_widget.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/network_error_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../domain/enums/enums.dart';

class myAdvertising extends HookWidget {
  const myAdvertising({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? role = sl<LocalDataSource>().getValue(
      LocalDataKeys.role,
    );

    ProfileEntity? user = sl<LocalDataSource>().getValue(
      LocalDataKeys.profile,
    );
    final bloc = context.read<AdsBloc>();
    final filtecubit = context.read<FilterAdsCubit<ServiceTypeEnum>>();
    // CompanyEntity activityes =
    //     sl<LocalDataSource>().getValue(LocalDataKeys.activity);
    bloc.pagingController.addPageRequestListener((pageKey) {
      bloc.add(AdsEvent.load(
          filter: Filter(page: pageKey, status: filtecubit.state?.name)));
    });

    return MultiBlocListener(
      listeners: [
        BlocListener<AdsBloc, AdsState>(
          listener: (context, state) {
            state.whenOrNull(
                loaded: (data, pageKey) => bloc.pagingController.appendPage(
                      data,
                      pageKey,
                    ),
                lastPageLoaded: (data) =>
                    bloc.pagingController.appendLastPage(data),
                error: (error) => bloc.pagingController.error = error);
          },
        ),
        BlocListener<FilterAdsCubit<ServiceTypeEnum>, ServiceTypeEnum?>(
          listener: (context, state) {
            bloc.pagingController.refresh();
          },
        ),
      ],
      child: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //       onPressed: () {
        //         context.read<SideMenuCubit>().sideMenuActionTaken();
        //       },
        //       icon: const Icon(Icons.menu)),
        //   title: const Text("My ads").tr(),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: RefreshIndicator(
              color: AppTheme.secondaryColor,
              onRefresh: () async {
                bloc.pagingController.refresh();
              },
              child: Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: 6.h,
                      child: const FilterAdsWidget(),
                    ),
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          PagedSliverList<int, AdsEntity>(
                            pagingController: bloc.pagingController,
                            builderDelegate:
                                PagedChildBuilderDelegate<AdsEntity>(
                              itemBuilder: (context, item, index) => AdsWidget(
                                ads: item,
                              ),
                              firstPageErrorIndicatorBuilder: (context) => (bloc
                                      .pagingController.error as ErrorState)
                                  .when(
                                      networkError: (message) =>
                                          NetworkErrorWidget(
                                              tryAgain: () => bloc
                                                  .pagingController
                                                  .refresh()),
                                      other: (message) =>
                                          error_widget.ErrorWidget(
                                            tryAgain: () =>
                                                bloc.pagingController.refresh(),
                                          )),
                              noItemsFoundIndicatorBuilder: (context) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.assets_icons_no_data_svg,
                                    width: 150,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "no_ads_found",
                                    style: TextStyle(fontSize: 18),
                                  ).tr()
                                ],
                              ),
                              firstPageProgressIndicatorBuilder: (context) =>
                                  Column(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey.shade200,
                                    highlightColor: Colors.grey.shade50,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 1.h),
                                      padding: EdgeInsets.all(1.h),
                                      height: 20.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 15.h,
                                              width: 15.h,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black26),
                                              )),
                                          SizedBox(
                                            width: 1.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                  height: 2.5.h,
                                                  width: 20.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black26),
                                                  )),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                  height: 2.5.h,
                                                  width: 15.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black26),
                                                  )),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 40.w,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey.shade200,
                                    highlightColor: Colors.grey.shade50,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 1.h),
                                      padding: EdgeInsets.all(1.h),
                                      height: 20.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 15.h,
                                              width: 15.h,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black26),
                                              )),
                                          SizedBox(
                                            width: 1.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                  height: 2.5.h,
                                                  width: 20.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black26),
                                                  )),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                  height: 2.5.h,
                                                  width: 15.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black26),
                                                  )),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 40.w,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey.shade200,
                                    highlightColor: Colors.grey.shade50,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 1.h),
                                      padding: EdgeInsets.all(1.h),
                                      height: 20.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 15.h,
                                              width: 15.h,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black26),
                                              )),
                                          SizedBox(
                                            width: 1.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                  height: 2.5.h,
                                                  width: 20.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black26),
                                                  )),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                  height: 2.5.h,
                                                  width: 15.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black26),
                                                  )),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 40.w,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey.shade200,
                                    highlightColor: Colors.grey.shade50,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 1.h),
                                      padding: EdgeInsets.all(1.h),
                                      height: 20.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 15.h,
                                              width: 15.h,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black26),
                                              )),
                                          SizedBox(
                                            width: 1.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                  height: 2.5.h,
                                                  width: 20.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black26),
                                                  )),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                  height: 2.5.h,
                                                  width: 15.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black26),
                                                  )),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 40.w,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              newPageProgressIndicatorBuilder: (context) =>
                                  const Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                  ),
                                ),
                              ),
                              newPageErrorIndicatorBuilder: (context) =>
                                  GestureDetector(
                                      onTap: () {
                                        bloc.pagingController
                                            .retryLastFailedRequest();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "try_again".tr(),
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.refresh_rounded,
                                            size: 20,
                                          )
                                        ],
                                      )),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              //  color: Colors.transparent,
                              height: 10.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (user?.status == "Active" ||
                    user?.status == "Inactive" && user?.upgraded != null)
                  if (user?.actived == true && role == TypeSeller.admin.name)
                    Positioned(
                      bottom: 9.h,
                      right: context.locale.languageCode == "ar" ? 82.w : 0,
                      left: context.locale.languageCode == "ar" ? 0.w : 82.w,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (user != null && user.status == "Inactive") {
                            SmartDialog.show(
                              builder: (context) => Container(
                                height: 35.h,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            child:
                                                const Text("contact_us").tr(),
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
                          if (user != null &&
                              user.upgraded?.upgradedStatus == "Pending") {
                            SmartDialog.show(
                              builder: (context) => Container(
                                height: 25.h,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                          if (user != null &&
                              user.upgraded?.upgradedStatus == "Not_Paid" &&
                              user.actived == false) {
                            context.pushNamed(Routes.addOffers.name);
                            // smartDialogPayment(context);

                            return;
                          }

                          if (user != null &&
                              user.upgraded?.upgradedStatus == "Rejected") {
                            SmartDialog.show(
                              builder: (_) => Container(
                                height: 40.h,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                alignment: Alignment.topCenter,
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
                                                      alignment:
                                                          Alignment.topRight,
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
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Text(
                                                        user.reason ?? "",
                                                        textAlign:
                                                            TextAlign.start,
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
                                        child:
                                            const Text('View_details_and_edit')
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
                          if (user != null &&
                              user.upgraded?.upgradedStatus == "Approved" &&
                              user.actived!) {
                          context.pushNamed(Routes.addAdvertising.name);
                          return;
                          }

                          //}
                        },
                        child: Icon(
                          Icons.add,
                          size: 20.sp,
                          color: Colors.white ,
                        ),
                      ),
                    )
                  else
                    Positioned(
                      bottom: 15.h,
                      right: context.locale.languageCode == "ar" ? 82.w : 0,
                      left: context.locale.languageCode == "ar" ? 0.w : 82.w,
                      child: FloatingActionButton(
                        // isExtended: true,
                        tooltip:
                            "Develop_this_account_benefit_from_the_full_services"
                                .tr(),
                        onPressed: () {
                          if (user != null && user.status == "Rejected") {
                            SmartDialog.show(
                              builder: (contex) => Container(
                                height: 40.h,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                alignment: Alignment.topCenter,
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
                                            const Text('View_details_and_edit')
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
                          if (user != null && user.status == "Pending") {
                            SmartDialog.show(
                              builder: (context) => Container(
                                height: 25.h,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                          if (user != null && user.status == "Active") {
                            context.pushNamed(Routes.upgradeAccount.name);
                            return;
                          }
                        },
                        child: Icon(
                          Icons.upgrade_outlined,
                          size: 20.sp,
                          color: Colors.white ,
                        ),
                      ),
                    ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
