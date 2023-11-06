import 'dart:convert';

import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/screens/details_project.dart';
import 'package:commmercial_directory_seller/presentaation/auth/bloc/auth_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/search_dropdown_widget.dart';
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
import '../activity/activity_bloc.dart';
import '../bloc/register_company_bloc.dart';
import '../widget/custome_text_field.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/error_widget.dart'
    as error_widget;

Delevery? delevery;

String typeCompanty = "";
String? dialCode;

int? sectorId;
int? specializationId;
int? activityId;
String logo = "";

PhoneNumber? phoneNumber;
List<StandarEntity> selectedItemsSeasons = [];
List<StandarEntity> selectedItemsSpesialization = [];

class MerchantAccountDevelopment extends HookWidget {
  MerchantAccountDevelopment({
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
    bool? isChecked = false;

//
    final country = useTextEditingController();
    final region = useTextEditingController();
    final city = useTextEditingController();
    final urlGoogleMaps = useTextEditingController();
    final nameMoull = useTextEditingController();
    final longutideController = useTextEditingController();
    final latitudeController = useTextEditingController();
    final price = useTextEditingController();
    final season = useTextEditingController();
    final scroll = useScrollController();
    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);

    return BlocProvider(
      create: (context) =>
          LocationBloc(sl())..add(const LocationEvent.pickLocation()),
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
                  builder: (context) => const LocationBottomSheet(),
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
                                        const LocationBottomSheet(),
                                    alignment: Alignment.bottomCenter,
                                  );
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
                                  orElse: () => Container(
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
                                  // context: context,
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.only(
                                  //         topRight: Radius.circular(3.h),
                                  //         topLeft: Radius.circular(3.h))),
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
                                            controller: season,
                                            onChanged: (value) {
                                              context
                                                  .read<SpecializationBloc>()
                                                  .add(SpecializationEvent
                                                      .loadData(
                                                          filter: Filter(
                                                    q: season.text,
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
                                                                              if (selectedItemsSpesialization.length < 3) {
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
                                                                              } else {}
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
                                locationFounded:
                                    (county, cit, regio, dialCode) {
                                  country.text = county;
                                  city.text = cit;
                                  region.text = regio;
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
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: country,
                                        readOnly: true,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: region,
                                        readOnly: true,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: city,
                                        readOnly: true,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                    ],
                                  );
                                },
                                serviceUnEnabled: () {
                                  SmartDialog.showLoading(
                                    builder: (_) {
                                      return Container(
                                        height: 20.h,
                                        width: 70.w,
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "to_continue_turn_on_device_location"
                                                    .tr()),
                                            const Expanded(child: SizedBox()),
                                            Row(
                                              children: [
                                                TextButton(
                                                  onPressed: () async {
                                                    Geolocator
                                                        .openLocationSettings();
                                                    SmartDialog.dismiss();
                                                    SmartDialog.show(
                                                      backDismiss: false,
                                                      clickMaskDismiss: false,
                                                      builder: (context) =>
                                                          const LocationBottomSheet(),
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                    );
                                                  },
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      foregroundColor: AppTheme
                                                          .secondaryColor),
                                                  child: const Text(
                                                    "ok",
                                                    style: TextStyle(
                                                        color: AppTheme.green),
                                                  ).tr(),
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    context
                                                        .read<LocationBloc>()
                                                        .add(const LocationEvent
                                                            .addEventManually());
                                                    SmartDialog.dismiss();
                                                  },
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      foregroundColor: AppTheme
                                                          .secondaryColor),
                                                  child: const Text(
                                                    "no_thanks",
                                                    style: TextStyle(
                                                        color: AppTheme.green),
                                                  ).tr(),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );

                                  return const SizedBox();
                                },
                                loadingLocation: () => const Center(
                                      child: SizedBox(
                                          child: CircularProgressIndicator(
                                              strokeWidth: 1)),
                                    ),
                                manually: () => Column(
                                      children: [
                                        InputTextField(
                                          label:
                                              "Link_to_your_business_coordinates",
                                          hint:
                                              "Link_to_your_business_coordinates",
                                          textInputAction: TextInputAction.next,
                                          controller: urlGoogleMaps,
                                          validator: (p0) {
                                            //  return googleMapsValidator(p0);
                                          },
                                        ),
                                      ],
                                    ),
                                orElse: () => const SizedBox());
                          },
                        ),
                        SizedBox(height: .5.h),
                        InputTextField(
                          label: "Name_of_the_shopping_center",
                          hint: "Name_of_the_shopping_center",
                          textInputAction: TextInputAction.next,
                          controller: nameMoull,
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              if (value.length < 3) {
                                return "The_name_of_the_mall_is_very_short";
                              }

                              return null;
                            } else {
                              return "please_enter_Name_of_the_shopping_center";
                            }
                          },
                        ),
                        SizedBox(height: .5.h),
                        SizedBox(
                          height: 1.h,
                        ),
                        StatefulBuilder(builder: (context, setState) {
                          return Row(
                            children: [
                              Checkbox(
                                activeColor: AppTheme.green,
                                value: isChecked,
                                onChanged: (v) {
                                  isChecked = v;
                                  setState(() {});
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.5.h)),
                              ),
                              Expanded(
                                child: const Text(
                                        "I agree to pay the activation fee for the first time only + a free subscription for 3 months")
                                    .tr(),
                              )
                            ],
                          );
                        }),
                        SizedBox(
                          height: 2.h,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
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
                                      if (isChecked == false) {
                                        AlertController.show(
                                            "",
                                            "To continue, you must agree to pay the activation fee"
                                                .tr(),
                                            TypeAlert.warning);
                                        return;
                                      }
                                      // if (latitudeController.text.isEmpty &&
                                      //     longutideController.text.isEmpty) {
                                      //   AlertController.show(
                                      //       "",
                                      //       "please_choose_Your_activitie_coordinates"
                                      //           .tr(),
                                      //       TypeAlert.warning);
                                      //   return;
                                      // }
                                      context.pushNamed(
                                        Routes.socialAccounts.name,
                                        extra: RegisterPartTwoSeller(
                                          logo: logo,
                                          price: delevery == Delevery.accept
                                              ? double.parse(price.text)
                                              : null,
                                          // address: addressStreet.text +
                                          //     addressBuilding.text +
                                          //     addressFloor.text,
                                          // latitude: latitudeController.text,
                                          // longutide: longutideController.text,
                                          seasons: selectedItemsSeasons,
                                          specialities:
                                              selectedItemsSpesialization,
                                        ),
                                      );

                                      return;
                                    }
                                  },
                                  child:
                                      const Text("Add communication accounts")
                                          .tr()),
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
