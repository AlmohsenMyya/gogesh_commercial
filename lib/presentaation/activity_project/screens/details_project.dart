import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/activity_bloc/activity_project_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/screens/details_project.dart';
import 'package:commmercial_directory_seller/presentaation/auth/bloc/auth_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/search_dropdown_widget.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/bloc/register_company_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/seasons/seasons_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:searchable_paginated_dropdown/searchable_dropdown_controller.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:shimmer/shimmer.dart';
import 'package:string_validator/string_validator.dart';
import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/widget/multi_select_drop_.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/sector/sector_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/specialization/specialization_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:sizer/sizer.dart';
import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../assets.dart';
import 'package:search_choices/search_choices.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../../domain/request/auth/register/register_part_two_seller.dart';
import '../../auth/location/location_bloc.dart';
import '../../auth/widgets/location_bottom_sheet.dart';
import '../../widgets/input_text_field.dart';
import '../../auth/widgets/drop_down.dart';
import '../../widgets/network_error_widget.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/error_widget.dart'
    as error_widget;

Delevery? delevery;

String logo = "";

PhoneNumber? phoneNumber;
List<StandarEntity> selectedItemsSeasons = [];
List<StandarEntity> selectedItemsSpesialization = [];

class DetailsProjectScreen extends HookWidget {
  DetailsProjectScreen({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final SearchableDropdownController<StandarEntity> sectorController =
      SearchableDropdownController();
  final SearchableDropdownController<StandarEntity> activityController =
      SearchableDropdownController();
  final SearchableDropdownController<StandarEntity> specializationController =
      SearchableDropdownController();

  @override
  Widget build(BuildContext context) {
//
    final addressStreet = useTextEditingController();
    final addressBuilding = useTextEditingController();

    final addressFloor = useTextEditingController();
    final reason = useTextEditingController();
    final longutideController = useTextEditingController();
    final latitudeController = useTextEditingController();
    final price = useTextEditingController();
    final season = useTextEditingController();
    final scroll = useScrollController();
    final spesiality = useTextEditingController();
    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);
    if (user != null) {
      selectedItemsSeasons.addAll(user.upgraded!.seasonsId!);
      selectedItemsSpesialization.addAll(user.upgraded!.specialitiesId!);
      price.text = user.upgraded?.deliveryPrice == null
          ? "0"
          : "${user.upgraded?.deliveryPrice}";
      delevery = user.upgraded?.deliveryPrice == null
          ? Delevery.revuse
          : Delevery.accept;
      context.read<SpecializationBloc>().add(
          SpecializationEvent.changeItem(items: selectedItemsSpesialization));
      context
          .read<SeasonsBloc>()
          .add(SeasonsEvent.changeItem(items: selectedItemsSeasons));
      logo = user.upgraded?.logo ?? "";
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc(sl()),
        ),
        BlocProvider(
          create: (context) => ActivityProjectBloc(
              getDetailsCompanyUseCase: sl(), editCompanyUseCase: sl()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              state.whenOrNull(error: (error) {
                AlertController.show("", error.tr(), TypeAlert.error);
              }, locationPicked: () {
                SmartDialog.show(
                  backDismiss: false,
                  clickMaskDismiss: false,
                  builder: (context) =>
                      const LocationBottomSheet(isLatLon: true),
                  alignment: Alignment.bottomCenter,
                );
              }, serviceUnEnabled: () {
                SmartDialog.showLoading(
                  builder: (_) {
                    return Container(
                      height: 20.h,
                      width: 70.w,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("to_continue_turn_on_device_location".tr()),
                          const Expanded(child: SizedBox()),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () async {
                                  Geolocator.openLocationSettings();
                                  SmartDialog.dismiss();
                                  SmartDialog.show(
                                    backDismiss: false,
                                    clickMaskDismiss: false,
                                    builder: (context) =>
                                        const LocationBottomSheet(
                                            isLatLon: true),
                                    alignment: Alignment.bottomCenter,
                                  );
                                  // showModalBottomSheet(
                                  //     isDismissible: false,
                                  //     enableDrag: false,
                                  //     context: context,
                                  //     useSafeArea: true,
                                  //     shape: const OutlineInputBorder(
                                  //       borderRadius: BorderRadius.only(
                                  //         topLeft: Radius.circular(20),
                                  //         topRight: Radius.circular(20),
                                  //       ),
                                  //     ),
                                  //     builder: (context) =>
                                  //         const LocationBottomSheet(
                                  //           isLatLon: true,
                                  //         ));
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: AppTheme.secondaryColor),
                                child: const Text(
                                  "ok",
                                  style: TextStyle(color: AppTheme.green),
                                ).tr(),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<LocationBloc>().add(
                                      const LocationEvent.addEventManually());
                                  SmartDialog.dismiss();
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: AppTheme.secondaryColor),
                                child: const Text(
                                  "no_thanks",
                                  style: TextStyle(color: AppTheme.green),
                                ).tr(),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              });
            },
          ),
          BlocListener<RegisterCompanyBloc, RegisterCompanyState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loadedImageLogo: (image) {
                  logo = image.path;
                },
              );
            },
          ),
        ],
        child: WillPopScope(
          onWillPop: () async {
            selectedItemsSeasons.clear();
            selectedItemsSpesialization.clear();
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("create_commercial_activity").tr(),
              leading: GestureDetector(
                  onTap: () async {
                    selectedItemsSeasons.clear();
                    selectedItemsSpesialization.clear();
                    context.pop();
                  },
                  child: const Icon(Icons.arrow_back)),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            BlocBuilder<RegisterCompanyBloc,
                                RegisterCompanyState>(
                              buildWhen: (previous, current) {
                                return current.maybeWhen(
                                    orElse: () => false,
                                    loadedImageLogo: (file) => true);
                              },
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () => CachedNetworkImage(
                                    imageUrl: user?.upgraded?.logo ?? "",
                                    imageBuilder: (ctx, imageProvider) {
                                      return Container(
                                        height: 35.w,
                                        width: 35.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            // border: Border.all(
                                            //     color: Colors.grey, width: 8),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            )),
                                      );
                                    },
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      height: 35.w,
                                      width: 35.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
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
                                        height: 35.w,
                                        width: 35.w,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                  ),
                                  loadedImageLogo: (image) => Container(
                                    height: 35.w,
                                    width: 35.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: FileImage(File(image.path)),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                                onPressed: () {
                                  context.read<RegisterCompanyBloc>().add(
                                      const RegisterCompanyEvent
                                              .uploadImageLogo(
                                          source: ImageSource.gallery));
                                },
                                style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.zero)),
                                icon: SvgPicture.asset(
                                  Assets.assets_icons_edit_svg,
                                  width: 40,
                                  height: 40,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Your_activity_logo",
                          style: TextStyle(fontSize: 14.sp),
                        ).tr(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.5.h,
                            ),
                            const Text("Specialization").tr(),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            GestureDetector(
                              onTap: () async {
                                context.read<SpecializationBloc>().add(
                                    SpecializationEvent.loadData(
                                        filter: Filter(
                                            page: 1,
                                            type: 'paginate',
                                            id: user?.activityId?.id)));
                                await SmartDialog.show(
                                  backDismiss: true,
                                  clickMaskDismiss: true,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8))),
                                      height: 50.h,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Specialization".tr()),
                                            controller: spesiality,
                                            onChanged: (value) {
                                              context
                                                  .read<SpecializationBloc>()
                                                  .add(SpecializationEvent
                                                      .loadData(
                                                          filter: Filter(
                                                    q: spesiality.text,
                                                    id: user?.activityId?.id,
                                                    type: 'paginate',
                                                  )));
                                            },
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Expanded(
                                              //height: 40.h,
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomScrollView(
                                              controller: scroll,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              // reverse: true,
                                              slivers: [
                                                BlocBuilder<SpecializationBloc,
                                                    SpecializationState>(
                                                  buildWhen:
                                                      (previous, current) =>
                                                          current.maybeWhen(
                                                    orElse: () => false,
                                                    loaded: (chat, pageKey,
                                                            lastPage) =>
                                                        true,
                                                    error: (error) => true,
                                                    empty: () => true,
                                                    loading: () => true,
                                                  ),
                                                  builder: (context, state) {
                                                    return state.maybeWhen(
                                                      orElse: () =>
                                                          const SliverToBoxAdapter(
                                                              child:
                                                                  SizedBox()),
                                                      loading: () =>
                                                          const SliverToBoxAdapter(
                                                              child: Center(
                                                        child: SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child:
                                                              CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      2),
                                                        ),
                                                      )),
                                                      loaded: (data, pageKey,
                                                              lastPage) =>
                                                          NotificationListener<
                                                              ScrollNotification>(
                                                        onNotification:
                                                            (notification) {
                                                          if (notification
                                                              is ScrollEndNotification) {
                                                            if (scroll.position
                                                                    .pixels ==
                                                                scroll.position
                                                                    .maxScrollExtent) {}
                                                            context.read<SpecializationBloc>().add(SpecializationEvent.loadMore(
                                                                filter: Filter(
                                                                    page:
                                                                        pageKey,
                                                                    id: user
                                                                        ?.activityId
                                                                        ?.id,
                                                                    type:
                                                                        'paginate')));
                                                          }
                                                          return true;
                                                        },
                                                        child: SliverList(
                                                          delegate:
                                                              SliverChildBuilderDelegate(
                                                                  (context,
                                                                          index) =>
                                                                      StatefulBuilder(
                                                                          builder: (context,
                                                                              setState) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            if (selectedItemsSpesialization.contains(StandarEntity(
                                                                              id: data[index].id,
                                                                              name: data[index].name,
                                                                            ))) {
                                                                              setState(
                                                                                () {
                                                                                  selectedItemsSpesialization.remove(
                                                                                    StandarEntity(
                                                                                      id: data[index].id,
                                                                                      name: data[index].name,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              // context.read<SeasonsBloc>().add(SeasonsEvent.changeItem(items: selectedItemsSeasons));
                                                                              setState(
                                                                                () {
                                                                                  selectedItemsSpesialization.add(
                                                                                    StandarEntity(
                                                                                      id: data[index].id,
                                                                                      name: data[index].name,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                EdgeInsets.only(bottom: 1.h),
                                                                            decoration: BoxDecoration(
                                                                                color: selectedItemsSpesialization.contains(StandarEntity(
                                                                                  id: data[index].id,
                                                                                  name: data[index].name,
                                                                                ))
                                                                                    ? AppTheme.green
                                                                                    : null,
                                                                                borderRadius: BorderRadius.circular(1.h)),
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                            height:
                                                                                5.h,
                                                                            width:
                                                                                double.infinity,
                                                                            child:
                                                                                Text(data[index].name.toString()),
                                                                          ),
                                                                        );
                                                                      }),
                                                                  childCount: data
                                                                      .length),
                                                        ),
                                                      ),
                                                      error: (error) =>
                                                          error.when(
                                                              networkError: (message) =>
                                                                  SliverToBoxAdapter(child:
                                                                      NetworkErrorWidget(
                                                                          tryAgain:
                                                                              () {
                                                                    context.read<SpecializationBloc>().add(SpecializationEvent.loadData(
                                                                        filter: Filter(
                                                                            page:
                                                                                1,
                                                                            q: season.text)));
                                                                  })),
                                                              other: (message) =>
                                                                  SliverToBoxAdapter(
                                                                    child: error_widget
                                                                        .ErrorWidget(
                                                                      tryAgain:
                                                                          () {},
                                                                    ),
                                                                  )),
                                                      empty: () =>
                                                          const SliverToBoxAdapter(
                                                              child:
                                                                  SizedBox()),
                                                    );
                                                  },
                                                ),
                                                BlocBuilder<SpecializationBloc,
                                                    SpecializationState>(
                                                  buildWhen:
                                                      (previous, current) =>
                                                          current.maybeWhen(
                                                    orElse: () => false,
                                                    loadingMore: () => true,
                                                  ),
                                                  builder: (context, state) {
                                                    return SliverToBoxAdapter(
                                                      child: Center(
                                                        child: context
                                                                .read<
                                                                    SpecializationBloc>()
                                                                .lastPage
                                                            ? const SizedBox()
                                                            : const SizedBox(
                                                                width: 20,
                                                                height: 20,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      3,
                                                                ),
                                                              ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                SliverToBoxAdapter(
                                                  child: SizedBox(
                                                    height: 10.h,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                    );
                                  },
                                  alignment: Alignment.bottomCenter,
                                ).then((value) => context
                                    .read<SpecializationBloc>()
                                    .add(SpecializationEvent.changeItem(
                                        items: selectedItemsSpesialization)));
                              },
                              child: BlocBuilder<SpecializationBloc,
                                  SpecializationState>(
                                buildWhen: (previous, current) =>
                                    current.maybeWhen(
                                  orElse: () => false,
                                  itemChanged: (data) => true,
                                ),
                                builder: (context, state) {
                                  return Container(
                                      // height: 6.h,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(
                                          right: 3.w,
                                          left: 3.w,
                                          top: 2.w,
                                          bottom: 2.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.h),
                                        border: Border.all(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      child: state.maybeMap(
                                        itemChanged: (value) => value
                                                .data.isEmpty
                                            ? Text(
                                                "Specialization".tr(),
                                                style: const TextStyle(
                                                    color: Colors.black26),
                                              )
                                            : Wrap(
                                                spacing: 1.w,
                                                children: [
                                                  ...value.data.map(
                                                    (e) => Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 1.w),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppTheme.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1.h)),
                                                        child: Text(e.name!)),
                                                  )
                                                ],
                                              ),
                                        orElse: () => Text(
                                          "Specialization".tr(),
                                          style: const TextStyle(
                                              color: Colors.black26),
                                        ),
                                      ));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            const Text("seasions").tr(),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            GestureDetector(
                              onTap: () async {
                                context.read<SeasonsBloc>().add(
                                    SeasonsEvent.loadSeasons(
                                        filter:
                                            Filter(page: 1, type: 'paginate')));
                                await SmartDialog.show(
                                  backDismiss: true,
                                  clickMaskDismiss: true,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8))),
                                      height: 50.h,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "seasions".tr()),
                                            controller: season,
                                            onChanged: (value) {
                                              context.read<SeasonsBloc>().add(
                                                  SeasonsEvent.loadSeasons(
                                                      filter: Filter(
                                                          q: season.text,
                                                          type: 'paginate')));
                                            },
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Expanded(
                                              //height: 40.h,
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomScrollView(
                                              controller: scroll,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              // reverse: true,
                                              slivers: [
                                                BlocBuilder<SeasonsBloc,
                                                    SeasonsState>(
                                                  buildWhen:
                                                      (previous, current) =>
                                                          current.maybeWhen(
                                                    orElse: () => false,
                                                    Loaded: (chat, pageKey,
                                                            lastPage) =>
                                                        true,
                                                    error: (error) => true,
                                                    empty: () => true,
                                                    loading: () => true,
                                                  ),
                                                  builder: (context, state) {
                                                    return state.maybeWhen(
                                                      orElse: () =>
                                                          const SliverToBoxAdapter(
                                                              child:
                                                                  SizedBox()),
                                                      loading: () =>
                                                          const SliverToBoxAdapter(
                                                              child: Center(
                                                        child: SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child:
                                                              CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      2),
                                                        ),
                                                      )),
                                                      Loaded: (data, pageKey,
                                                              lastPage) =>
                                                          NotificationListener<
                                                              ScrollNotification>(
                                                        onNotification:
                                                            (notification) {
                                                          if (notification
                                                              is ScrollEndNotification) {
                                                            if (scroll.position
                                                                    .pixels ==
                                                                scroll.position
                                                                    .maxScrollExtent) {}
                                                            context
                                                                .read<
                                                                    SeasonsBloc>()
                                                                .add(SeasonsEvent.loadMore(
                                                                    filter: Filter(
                                                                        page:
                                                                            pageKey,
                                                                        type:
                                                                            'paginate')));
                                                          }
                                                          return true;
                                                        },
                                                        child: SliverList(
                                                          delegate:
                                                              SliverChildBuilderDelegate(
                                                                  (context,
                                                                          index) =>
                                                                      StatefulBuilder(
                                                                          builder: (context,
                                                                              setState) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            if (selectedItemsSeasons.contains(StandarEntity(
                                                                              id: data[index].id,
                                                                              name: data[index].name,
                                                                            ))) {
                                                                              setState(
                                                                                () {
                                                                                  selectedItemsSeasons.remove(
                                                                                    StandarEntity(
                                                                                      id: data[index].id,
                                                                                      name: data[index].name,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              // context.read<SeasonsBloc>().add(SeasonsEvent.changeItem(items: selectedItemsSeasons));
                                                                              setState(
                                                                                () {
                                                                                  selectedItemsSeasons.add(
                                                                                    StandarEntity(
                                                                                      id: data[index].id,
                                                                                      name: data[index].name,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                EdgeInsets.only(bottom: 1.h),
                                                                            decoration: BoxDecoration(
                                                                                color: selectedItemsSeasons.contains(StandarEntity(
                                                                                  id: data[index].id,
                                                                                  name: data[index].name,
                                                                                ))
                                                                                    ? AppTheme.green
                                                                                    : null,
                                                                                borderRadius: BorderRadius.circular(1.h)),
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                            height:
                                                                                5.h,
                                                                            width:
                                                                                double.infinity,
                                                                            child:
                                                                                Text(data[index].name.toString()),
                                                                          ),
                                                                        );
                                                                      }),
                                                                  childCount: data
                                                                      .length),
                                                        ),
                                                      ),
                                                      error: (error) =>
                                                          error.when(
                                                              networkError: (message) =>
                                                                  SliverToBoxAdapter(child:
                                                                      NetworkErrorWidget(
                                                                          tryAgain:
                                                                              () {
                                                                    context.read<SeasonsBloc>().add(SeasonsEvent.loadSeasons(
                                                                        filter: Filter(
                                                                            page:
                                                                                1,
                                                                            q: season.text)));
                                                                  })),
                                                              other: (message) =>
                                                                  SliverToBoxAdapter(
                                                                    child: error_widget
                                                                        .ErrorWidget(
                                                                      tryAgain:
                                                                          () {},
                                                                    ),
                                                                  )),
                                                      empty: () =>
                                                          const SliverToBoxAdapter(
                                                              child:
                                                                  SizedBox()),
                                                    );
                                                  },
                                                ),
                                                BlocBuilder<SeasonsBloc,
                                                    SeasonsState>(
                                                  buildWhen:
                                                      (previous, current) =>
                                                          current.maybeWhen(
                                                    orElse: () => false,
                                                    loadingMore: () => true,
                                                  ),
                                                  builder: (context, state) {
                                                    return SliverToBoxAdapter(
                                                      child: Center(
                                                        child: context
                                                                .read<
                                                                    SeasonsBloc>()
                                                                .lastPage
                                                            ? const SizedBox()
                                                            : const SizedBox(
                                                                width: 20,
                                                                height: 20,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      3,
                                                                ),
                                                              ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                SliverToBoxAdapter(
                                                  child: SizedBox(
                                                    height: 10.h,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                    );
                                  },
                                  alignment: Alignment.bottomCenter,
                                ).then((value) => context
                                    .read<SeasonsBloc>()
                                    .add(SeasonsEvent.changeItem(
                                        items: selectedItemsSeasons)));
                              },
                              child: BlocBuilder<SeasonsBloc, SeasonsState>(
                                buildWhen: (previous, current) =>
                                    current.maybeWhen(
                                  orElse: () => false,
                                  itemChanged: (data) => true,
                                ),
                                builder: (context, state) {
                                  return Container(
                                    // height: 6.h,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        right: 3.w,
                                        left: 3.w,
                                        top: 2.w,
                                        bottom: 2.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                    ),
                                    child: state.maybeMap(
                                      itemChanged: (value) => value.data.isEmpty
                                          ? Text(
                                              "seasions".tr(),
                                              style: const TextStyle(
                                                  color: Colors.black26),
                                            )
                                          : Wrap(
                                              spacing: 1.w,
                                              children: [
                                                ...value.data.map(
                                                  (e) => Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      decoration: BoxDecoration(
                                                          color: AppTheme.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      1.h)),
                                                      child: Text(e.name!)),
                                                )
                                              ],
                                            ),
                                      orElse: () => Text(
                                        "seasions".tr(),
                                        style: const TextStyle(
                                            color: Colors.black26),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        StatefulBuilder(builder: (context, setState) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  const Text("Delivery_Service").tr(),
                                  const Expanded(child: SizedBox()),
                                  Checkbox(
                                    activeColor: AppTheme.green,
                                    value: delevery == Delevery.accept,
                                    onChanged: (v) {
                                      setState(() {
                                        delevery = v! ? Delevery.accept : null;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.5.h)),
                                  ),
                                  const Text("support").tr(),
                                  const Expanded(child: SizedBox()),
                                  Checkbox(
                                    activeColor: AppTheme.green,
                                    value: delevery == Delevery.revuse,
                                    onChanged: (v) {
                                      setState(() {
                                        delevery = v! ? Delevery.revuse : null;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.5.h)),
                                  ),
                                  const Text("not_support").tr(),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                              delevery == Delevery.accept
                                  ? InputTextField(
                                      label: "Delevery_price",
                                      hint: "Delevery_price",
                                      textInputAction: TextInputAction.done,
                                      inputType: TextInputType.number,
                                      controller: price,
                                      validator: (value) {
                                        if (value != null && value.isNotEmpty) {
                                          if (isFloat(value)) {
                                            return null;
                                          }
                                          return "please_enter_price_valid";
                                        }
                                        return "please_enter_delevery_price"
                                            .tr();
                                      },
                                    )
                                  : const SizedBox()
                            ],
                          );
                        }),
                        BlocBuilder<LocationBloc, LocationState>(
                          bloc: context.read<LocationBloc>(),
                          builder: (context, state) {
                            return state.maybeWhen(
                                locationLatLon: (latitude, longutide) {
                                  latitudeController.text = latitude;
                                  longutideController.text = longutide;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      const Text("Your_activities_coordinates")
                                          .tr(),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40.w,
                                            child: TextFormField(
                                              textInputAction:
                                                  TextInputAction.next,
                                              controller: latitudeController,
                                              readOnly: true,
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 40.w,
                                            child: TextFormField(
                                              textInputAction:
                                                  TextInputAction.next,
                                              controller: longutideController,
                                              readOnly: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                    ],
                                  );
                                },
                                loadingLocation: () => const Center(
                                      child: SizedBox(
                                          child: CircularProgressIndicator(
                                              strokeWidth: 1)),
                                    ),
                                manually: () => Column(
                                      children: [
                                        InputTextField(
                                            label: "Street",
                                            hint: "Street",
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: addressStreet,
                                            validator: (value) {
                                              if (value != null &&
                                                  value.isNotEmpty &&
                                                  value.length >= 4) {
                                                return null;
                                              } else if (value!.length < 4 &&
                                                  value.isNotEmpty) {
                                                return "The_street_name_is_too_short"
                                                    .tr();
                                              }
                                              return "Please_enter_street_name"
                                                  .tr();
                                            }),
                                        InputTextField(
                                            label: "Building",
                                            hint: "Building",
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: addressBuilding,
                                            validator: (value) {
                                              if (value != null &&
                                                  value.isNotEmpty &&
                                                  value.length >= 4) {
                                                return null;
                                              } else if (value!.length < 4 &&
                                                  value.isNotEmpty) {
                                                return "The_Building_name_is_too_short"
                                                    .tr();
                                              }
                                              return "Please_enter_Building_name"
                                                  .tr();
                                            }),
                                        InputTextField(
                                          label: "Floor",
                                          hint: "Floor",
                                          textInputAction: TextInputAction.next,
                                          controller: addressFloor,
                                          validator: (value) {
                                            if (value != null &&
                                                value.isNotEmpty &&
                                                value.length >= 4) {
                                              return null;
                                            } else if (value!.length < 4 &&
                                                value.isNotEmpty) {
                                              return "The_Floor_name_is_too_short"
                                                  .tr();
                                            }
                                            return "Please_enter_Floor_name"
                                                .tr();
                                          },
                                        ),
                                      ],
                                    ),
                                orElse: () => const SizedBox());
                          },
                        ),
                        InputTextField(
                          label: "reason",
                          hint: "reason",
                          controller: reason,
                          validator: (p0) {
                            return reasonValidator(p0);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              SmartDialog.show(
                                backDismiss: true,
                                clickMaskDismiss: true,
                                builder: (context) =>
                                    const LocationBottomSheet(isLatLon: true),
                                alignment: Alignment.bottomCenter,
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: AppTheme.green,
                            ),
                            child: const Text("update_location").tr(),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        BlocBuilder<ActivityProjectBloc, ActivityProjectState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: double.infinity,
                              child: custombuttom(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (logo.isEmpty) {
                                        AlertController.show(
                                            "",
                                            "Please_enter_logo".tr(),
                                            TypeAlert.warning);
                                        return;
                                      }
                                      if (selectedItemsSpesialization.isEmpty) {
                                        AlertController.show(
                                            "",
                                            "please_enter_speciality".tr(),
                                            TypeAlert.warning);
                                        return;
                                      }
                                      if (selectedItemsSeasons.isEmpty) {
                                        AlertController.show(
                                            "",
                                            "Please choose the seasons in which you will present your offers and advertisements"
                                                .tr(),
                                            TypeAlert.warning);
                                        return;
                                      }

                                      if (delevery == null) {
                                        AlertController.show(
                                            "",
                                            "please_choose_delevery".tr(),
                                            TypeAlert.warning);
                                        return;
                                      }
                                      if (latitudeController.text.isEmpty &&
                                          longutideController.text.isEmpty) {
                                        AlertController.show(
                                            "",
                                            "please_choose_Your_activitie_coordinates"
                                                .tr(),
                                            TypeAlert.warning);
                                        return;
                                      }

                                      context.read<ActivityProjectBloc>().add(
                                              ActivityProjectEvent.editActivity(
                                            request: RegisterPartTwoSeller(
                                              logo: logo,
                                              price: delevery == Delevery.accept
                                                  ? double.parse(price.text)
                                                  : null,
                                              address: addressStreet.text +
                                                  addressBuilding.text +
                                                  addressFloor.text,
                                              latitude: latitudeController.text,
                                              longutide:
                                                  longutideController.text,
                                              seasons: selectedItemsSeasons,
                                              specialities:
                                                  selectedItemsSpesialization,
                                            ),
                                          ));

                                      return;
                                    }
                                  },
                                  child: const Text("edit").tr()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
