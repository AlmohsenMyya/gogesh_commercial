import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_primary_seller.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';
import 'package:commmercial_directory_seller/presentaation/auth/bloc/auth_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/completed_profile_screen.dart';
import 'package:commmercial_directory_seller/presentaation/auth/sections_bloc/sections_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/services_bloc/service_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/drop_down.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/search_dropdown_widget.dart';
import 'package:commmercial_directory_seller/presentaation/profile/bloc/profile_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/activity/activity_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/bloc/register_company_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/sector/sector_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/sub_sectors/sub_suctors_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/input_text_field.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/network_error_widget.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:commmercial_directory_seller/presentaation/widgets/error_widget.dart'
    as error_widget;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:searchable_paginated_dropdown/searchable_dropdown_controller.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:string_validator/string_validator.dart';

class CompletEditProfile extends HookWidget {
  CompletEditProfile({
    Key? key,
    required this.informationPrimay,
  }) : super(key: key);
  List<StandarEntity> selectedItemsService = [];
  List<StandarEntity> selectedItemsSections = [];
// Gender? gender;
  int? countryId;
  int? cityId;
  int? regionId;
  String signature = "", lisence = "";
  List<String> intityCard = [];
  PhoneNumber? phoneNumber;
// List<String> sections = [];
  String? typeCompanty;
  String? imageSelected;
  final _formKey = GlobalKey<FormState>();
  StandarEntity? sector;
  int? sectorId;
  int? subSuctorId;
  final EditProfileRequest informationPrimay;

  bool hassections = false;

  StandarEntity? subSuctor;
  int? activityId;
  final SearchableDropdownController<StandarEntity> sectorController =
      SearchableDropdownController();
  final SearchableDropdownController<StandarEntity> subsuctorsController =
      SearchableDropdownController();
  final SearchableDropdownController<StandarEntity> activityController =
      SearchableDropdownController();

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;
    final phoneCommercial = useTextEditingController();
    final nameCommercial = useTextEditingController();
    final descriptionCommercial = useTextEditingController();
    final service = useTextEditingController();
    final section = useTextEditingController();
    final reason = useTextEditingController();
    final scroll = useScrollController();
    final sectionscroll = useScrollController();

    String? isoCode;
    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);
    if (user != null) {
      sectorController.selectedItem.value = SearchableDropdownMenuItem(
        child: Text(user.sectorId?.name ?? ""),
        label: user.sectorId?.name ?? "",
        value: user.sectorId,
      );
      subsuctorsController.selectedItem.value = SearchableDropdownMenuItem(
        child: Text(user.subSectorId?.name ?? ""),
        label: user.subSectorId?.name ?? "",
        value: user.subSectorId,
      );
      activityController.selectedItem.value = SearchableDropdownMenuItem(
        child: Text(user.activityId?.name ?? ""),
        label: user.activityId?.name ?? "",
        value: user.activityId,
      );
      sectorId = user.sectorId?.id;
      subSuctorId = user.subSectorId?.id;
      activityId = user.activityId?.id;
      nameCommercial.text = user.commerialActivityName ?? '';
      descriptionCommercial.text = user.commerialActivityDescription ?? '';
      isoCode = user.commerialActivityPhone!.split("-")[0];
      phoneCommercial.text = user.commerialActivityPhone!.split("-")[2];
      typeCompanty = user.type;
      intityCard = [user.civilCard ?? ""];
      signature = user.signature ?? "";
      lisence = user.lisence ?? "";
      selectedItemsService.addAll(user.servicesId ?? []);
      selectedItemsSections.addAll(user.sectionsId ?? []);
    }

    context
        .read<SectionsBloc>()
        .add(SectionsEvent.changeItem(items: selectedItemsSections));
    context
        .read<ServiceBloc>()
        .add(ServiceEvent.changeItem(items: selectedItemsService));
    sectorController.addListener((p, searchKey) {
      context.read<SectorBloc>().add(SectorEvent.load(
          filter: Filter(page: p, q: searchKey, type: 'paginate')));
    });
    subsuctorsController.addListener((p, searchKey) {
      context.read<SubSuctorsBloc>().add(SubSuctorsEvent.load(
          filter:
              Filter(page: p, q: searchKey, type: 'paginate', id: sectorId)));
    });

    activityController.addListener((p, searchKey) {
      context.read<ActivityBloc>().add(ActivityEvent.load(
          filter: Filter(
              page: p, q: searchKey, id: subSuctorId, type: 'paginate')));
    });
    return BlocProvider(
      create: (context) => ProfileBloc(
        editProfileUseCase: sl(),
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              state.whenOrNull(
                succes: () {
                  context.pushNamed(
                    Routes.me.name,
                    extra: true,
                  );
                },
              );
            },
          ),
          BlocListener<SectorBloc, SectorState>(
            listener: (context, state) {
              state.whenOrNull(dataLoaded: (data, m) {
                sectorController
                    .appendNewPage(_mapDataToDropDownItem<StandarEntity>(data));
              });
            },
          ),
          BlocListener<SubSuctorsBloc, SubSuctorsState>(
            listener: (context, state) {
              state.whenOrNull(dataLoaded: (data, m) {
                subsuctorsController
                    .appendNewPage(_mapDataToDropDownItem<StandarEntity>(data));
              });
            },
          ),
          BlocListener<ActivityBloc, ActivityState>(
            listener: (context, state) {
              state.whenOrNull(dataLoaded: (data) {
                activityController
                    .appendNewPage(_mapDataToDropDownItem<StandarEntity>(data));
              });
            },
          ),
          BlocListener<RegisterCompanyBloc, RegisterCompanyState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loadedImagecardIntity: (image) {
                  if (image.length == 2) {
                    for (var element in image) {
                      intityCard.add(element.path);
                    }
                    AlertController.show(
                        "",
                        "Photos_of_your_civil_ID_have_been_uploaded".tr(),
                        TypeAlert.success);
                  } else {
                    AlertController.show(
                        "",
                        "Please_upload_a_photo_of_the_front_and_back_of_your_civil_ID"
                            .tr(),
                        TypeAlert.warning);
                  }
                },
                loadedImageLisence: (image) {
                  lisence = image.path;
                  AlertController.show(
                      "",
                      "A_copy_of_the_commercial_license_has_been_uploaded".tr(),
                      TypeAlert.success);
                },
                loadedImageSignuature: (image) {
                  signature = image.path;
                  AlertController.show(
                      "",
                      "A_copy_of_the_signature_authorization_has_been_uploaded"
                          .tr(),
                      TypeAlert.success);
                },
              );
            },
          ),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: WillPopScope(
            onWillPop: () async {
              selectedItemsSections.clear();
              selectedItemsService.clear();
              context.pop();
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text("edit_profile").tr(),
                leading: IconButton(
                    onPressed: () async {
                      selectedItemsSections.clear();
                      selectedItemsService.clear();
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("type_account").tr(),
                              SizedBox(
                                height: 1.h,
                              ),
                              BlocBuilder<RegisterCompanyBloc,
                                  RegisterCompanyState>(
                                buildWhen: (previous, current) =>
                                    current.maybeWhen(
                                  orElse: () => false,
                                  itemChanged: (item) => true,
                                ),
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    itemChanged: (item) => DropDownWidget(
                                      hint: "choose_type_account",
                                      icon: true,
                                      data: type,
                                      value: item,
                                      onChange: (value) {
                                        context.read<RegisterCompanyBloc>().add(
                                              RegisterCompanyEvent.changeItem(
                                                  item: value!),
                                            );
                                        typeCompanty = value.type.name;
                                      },
                                    ),
                                    orElse: () => DropDownWidget(
                                      hint: "choose_type_account",
                                      icon: true,
                                      data: type,
                                      value: user?.type == Type.Company.name
                                          ? type.first
                                          : type.last,
                                      onChange: (value) {
                                        context.read<RegisterCompanyBloc>().add(
                                              RegisterCompanyEvent.changeItem(
                                                  item: value!),
                                            );
                                        typeCompanty = value.type.name;
                                      },
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const Text("I'am provide").tr(),
                              Builder(builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return Column(
                                    // "I'am provide"
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          selectedItemsService.clear();
                                          context.read<ServiceBloc>().add(
                                              ServiceEvent.loadData(
                                                  filter: Filter(
                                                      page: 1,
                                                      type: "paginate")));

                                          await SmartDialog.show(
                                            backDismiss: true,
                                            clickMaskDismiss: true,
                                            builder: (BuildContext context) {
                                              return Container(
                                                color: Colors.white,
                                                height: 50.h,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "I'am provide"
                                                                      .tr()),
                                                      controller: service,
                                                      onChanged: (value) {
                                                        context
                                                            .read<ServiceBloc>()
                                                            .add(ServiceEvent.loadData(
                                                                filter: Filter(
                                                                    type:
                                                                        "paginate",
                                                                    q: service
                                                                        .text)));
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Expanded(
                                                        //height: 40.h,
                                                        child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CustomScrollView(
                                                        controller: scroll,
                                                        physics:
                                                            const BouncingScrollPhysics(),
                                                        // reverse: true,
                                                        slivers: [
                                                          BlocBuilder<
                                                              ServiceBloc,
                                                              ServiceState>(
                                                            buildWhen: (previous,
                                                                    current) =>
                                                                current
                                                                    .maybeWhen(
                                                              orElse: () =>
                                                                  false,
                                                              loaded: (chat,
                                                                      pageKey,
                                                                      lastPage) =>
                                                                  true,
                                                              error: (error) =>
                                                                  true,
                                                              empty: () => true,
                                                              loading: () =>
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                state) {
                                                              return state
                                                                  .maybeWhen(
                                                                orElse: () =>
                                                                    const SliverToBoxAdapter(
                                                                        child:
                                                                            SizedBox()),
                                                                loading: () =>
                                                                    const SliverToBoxAdapter(
                                                                        child:
                                                                            Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 20,
                                                                    height: 20,
                                                                    child: CircularProgressIndicator(
                                                                        strokeWidth:
                                                                            2),
                                                                  ),
                                                                )),
                                                                loaded: (data,
                                                                        pageKey,
                                                                        lastPage) =>
                                                                    NotificationListener<
                                                                        ScrollNotification>(
                                                                  onNotification:
                                                                      (notification) {
                                                                    print(notification
                                                                        .depth);
                                                                    if (notification
                                                                        is ScrollEndNotification) {
                                                                      if (scroll
                                                                              .position
                                                                              .pixels ==
                                                                          scroll
                                                                              .position
                                                                              .maxScrollExtent) {}
                                                                      context
                                                                          .read<
                                                                              ServiceBloc>()
                                                                          .add(ServiceEvent.loadMore(
                                                                              filter: Filter(type: "paginate", page: pageKey)));
                                                                    }
                                                                    return true;
                                                                  },
                                                                  child:
                                                                      SliverList(
                                                                    delegate: SliverChildBuilderDelegate(
                                                                        (context, index) => StatefulBuilder(builder: (context, setState) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  if (selectedItemsService.contains(
                                                                                    StandarEntity(
                                                                                      id: data[index].id,
                                                                                      name: data[index].name,
                                                                                      hasSections: data[index].hasSections,
                                                                                    ),
                                                                                  )) {
                                                                                    setState(
                                                                                      () {
                                                                                        selectedItemsService.remove(
                                                                                          StandarEntity(
                                                                                            id: data[index].id,
                                                                                            name: data[index].name,
                                                                                            hasSections: data[index].hasSections,
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    // context.read<SeasonsBloc>().add(SeasonsEvent.changeItem(items: selectedItemsService));
                                                                                    setState(
                                                                                      () {
                                                                                        selectedItemsService.add(
                                                                                          StandarEntity(
                                                                                            id: data[index].id,
                                                                                            name: data[index].name,
                                                                                            hasSections: data[index].hasSections,
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(bottom: 1.h),
                                                                                  decoration: BoxDecoration(
                                                                                      color: selectedItemsService.contains(StandarEntity(
                                                                                        id: data[index].id,
                                                                                        name: data[index].name,
                                                                                        hasSections: data[index].hasSections,
                                                                                      ))
                                                                                          ? AppTheme.green
                                                                                          : null,
                                                                                      borderRadius: BorderRadius.circular(1.h)),
                                                                                  padding: const EdgeInsets.all(8),
                                                                                  height: 5.h,
                                                                                  width: double.infinity,
                                                                                  child: Text(data[index].name.toString()),
                                                                                ),
                                                                              );
                                                                            }),
                                                                        childCount: data.length),
                                                                  ),
                                                                ),
                                                                error: (error) =>
                                                                    error.when(
                                                                        networkError: (message) =>
                                                                            SliverToBoxAdapter(child: NetworkErrorWidget(tryAgain:
                                                                                () {
                                                                              context.read<ServiceBloc>().add(ServiceEvent.loadData(filter: Filter(page: 1, q: service.text, type: "paginate")));
                                                                            })),
                                                                        other: (message) =>
                                                                            SliverToBoxAdapter(
                                                                              child: error_widget.ErrorWidget(
                                                                                tryAgain: () {},
                                                                              ),
                                                                            )),
                                                                empty: () =>
                                                                    const SliverToBoxAdapter(
                                                                        child:
                                                                            SizedBox()),
                                                              );
                                                            },
                                                          ),
                                                          BlocBuilder<
                                                              ServiceBloc,
                                                              ServiceState>(
                                                            buildWhen: (previous,
                                                                    current) =>
                                                                current
                                                                    .maybeWhen(
                                                              orElse: () =>
                                                                  false,
                                                              loadingMore: () =>
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                state) {
                                                              return SliverToBoxAdapter(
                                                                child: Center(
                                                                  child: context
                                                                          .read<
                                                                              ServiceBloc>()
                                                                          .lastPage
                                                                      ? const SizedBox(
                                                                          width:
                                                                              20,
                                                                          height:
                                                                              20,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            strokeWidth:
                                                                                10,
                                                                          ),
                                                                        )
                                                                      : const SizedBox(),
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
                                          ).then((value) {
                                            context.read<ServiceBloc>().add(
                                                ServiceEvent.changeItem(
                                                    items:
                                                        selectedItemsService));
                                            // setState(
                                            //   () {},
                                            // );
                                          });
                                        },
                                        child: BlocBuilder<ServiceBloc,
                                            ServiceState>(
                                          buildWhen: (previous, current) =>
                                              current.maybeWhen(
                                            orElse: () => false,
                                            itemChanged: (data) => true,
                                          ),
                                          builder: (context, state) {
                                            return Column(
                                              children: [
                                                Container(
                                                    // height: 6.h,
                                                    width: double.infinity,
                                                    padding: EdgeInsets.only(
                                                        right: 3.w,
                                                        left: 3.w,
                                                        top: 2.w,
                                                        bottom: 2.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.h),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    child: state.maybeMap(
                                                      itemChanged: (value) =>
                                                          value.data.isEmpty
                                                              ? Text(
                                                                  "I'am provide"
                                                                      .tr(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black26),
                                                                )
                                                              : Wrap(
                                                                  spacing: 1.w,
                                                                  children: [
                                                                    ...value
                                                                        .data
                                                                        .map(
                                                                      (e) => Container(
                                                                          margin: EdgeInsets.only(
                                                                              bottom: 1
                                                                                  .w),
                                                                          padding: const EdgeInsets.all(
                                                                              2),
                                                                          decoration: BoxDecoration(
                                                                              color: AppTheme.green,
                                                                              borderRadius: BorderRadius.circular(1.h)),
                                                                          child: Text(e.name!)),
                                                                    )
                                                                  ],
                                                                ),
                                                      orElse: () => Text(
                                                        "I'am provide".tr(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black26),
                                                      ),
                                                    )),
                                                state.maybeWhen(
                                                    orElse: () =>
                                                        const SizedBox(),
                                                    itemChanged: (data) =>
                                                        data.any((element) =>
                                                                element
                                                                    .hasSections ??
                                                                false)
                                                            ? Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                          "Subservices")
                                                                      .tr(),
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      selectedItemsSections
                                                                          .clear();
                                                                      if (data
                                                                          .isNotEmpty) {
                                                                        context
                                                                            .read<SectionsBloc>()
                                                                            .add(SectionsEvent.loadData(filter: Filter(page: 1, type: "paginate", id: data.last.id)));
                                                                        await SmartDialog
                                                                            .show(
                                                                          backDismiss:
                                                                              true,
                                                                          clickMaskDismiss:
                                                                              true,
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return Container(
                                                                              color: Colors.white,
                                                                              height: 50.h,
                                                                              child: Column(
                                                                                children: [
                                                                                  TextFormField(
                                                                                    decoration: InputDecoration(hintText: "Subservices".tr()),
                                                                                    controller: section,
                                                                                    onChanged: (value) {
                                                                                      context.read<SectionsBloc>().add(
                                                                                            SectionsEvent.loadData(
                                                                                              filter: Filter(type: "paginate", q: service.text, id: data.last.id),
                                                                                            ),
                                                                                          );
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
                                                                                      controller: sectionscroll,
                                                                                      physics: const BouncingScrollPhysics(),
                                                                                      // reverse: true,
                                                                                      slivers: [
                                                                                        BlocBuilder<SectionsBloc, SectionsState>(
                                                                                          buildWhen: (previous, current) => current.maybeWhen(
                                                                                            orElse: () => false,
                                                                                            loaded: (chat, pageKey, lastPage) => true,
                                                                                            error: (error) => true,
                                                                                            empty: () => true,
                                                                                            loading: () => true,
                                                                                          ),
                                                                                          builder: (context, state) {
                                                                                            return state.maybeWhen(
                                                                                              orElse: () => const SliverToBoxAdapter(child: SizedBox()),
                                                                                              loading: () => const SliverToBoxAdapter(
                                                                                                  child: Center(
                                                                                                child: SizedBox(
                                                                                                  width: 20,
                                                                                                  height: 20,
                                                                                                  child: CircularProgressIndicator(strokeWidth: 2),
                                                                                                ),
                                                                                              )),
                                                                                              loaded: (data, pageKey, lastPage) => NotificationListener<ScrollNotification>(
                                                                                                onNotification: (notification) {
                                                                                                  if (notification is ScrollEndNotification) {
                                                                                                    if (sectionscroll.position.pixels == sectionscroll.position.maxScrollExtent) {}
                                                                                                    context.read<SectionsBloc>().add(SectionsEvent.loadMore(filter: Filter(type: "paginate", page: pageKey, id: data.last.id)));
                                                                                                  }
                                                                                                  return true;
                                                                                                },
                                                                                                child: SliverList(
                                                                                                  delegate: SliverChildBuilderDelegate(
                                                                                                      (context, index) => StatefulBuilder(builder: (context, setState) {
                                                                                                            return GestureDetector(
                                                                                                              onTap: () {
                                                                                                                if (selectedItemsSections.contains(
                                                                                                                  StandarEntity(
                                                                                                                    id: data[index].id,
                                                                                                                    name: data[index].name,
                                                                                                                    hasSections: data[index].hasSections,
                                                                                                                  ),
                                                                                                                )) {
                                                                                                                  setState(
                                                                                                                    () {
                                                                                                                      selectedItemsSections.remove(
                                                                                                                        StandarEntity(
                                                                                                                          id: data[index].id,
                                                                                                                          name: data[index].name,
                                                                                                                          hasSections: data[index].hasSections,
                                                                                                                        ),
                                                                                                                      );
                                                                                                                      // hassections.removeAt(index);
                                                                                                                    },
                                                                                                                  );
                                                                                                                } else {
                                                                                                                  // context.read<SeasonsBloc>().add(SeasonsEvent.changeItem(items: selectedItemsService));
                                                                                                                  setState(
                                                                                                                    () {
                                                                                                                      selectedItemsSections.add(
                                                                                                                        StandarEntity(
                                                                                                                          id: data[index].id,
                                                                                                                          name: data[index].name,
                                                                                                                          hasSections: data[index].hasSections,
                                                                                                                        ),
                                                                                                                      );
                                                                                                                      // hassections.add(data[index].hasSections!);
                                                                                                                    },
                                                                                                                  );
                                                                                                                }
                                                                                                              },
                                                                                                              child: Container(
                                                                                                                margin: EdgeInsets.only(bottom: 1.h),
                                                                                                                decoration: BoxDecoration(
                                                                                                                    color: selectedItemsSections.contains(StandarEntity(
                                                                                                                      id: data[index].id,
                                                                                                                      name: data[index].name,
                                                                                                                      hasSections: data[index].hasSections,
                                                                                                                    ))
                                                                                                                        ? AppTheme.green
                                                                                                                        : null,
                                                                                                                    borderRadius: BorderRadius.circular(1.h)),
                                                                                                                padding: const EdgeInsets.all(8),
                                                                                                                height: 5.h,
                                                                                                                width: double.infinity,
                                                                                                                child: Text(data[index].name.toString()),
                                                                                                              ),
                                                                                                            );
                                                                                                          }),
                                                                                                      childCount: data.length),
                                                                                                ),
                                                                                              ),
                                                                                              error: (error) => error.when(
                                                                                                  networkError: (message) => SliverToBoxAdapter(child: NetworkErrorWidget(tryAgain: () {
                                                                                                        context.read<SectionsBloc>().add(SectionsEvent.loadData(filter: Filter(page: 1, q: service.text, type: "paginate", id: data.last.id)));
                                                                                                      })),
                                                                                                  other: (message) => SliverToBoxAdapter(
                                                                                                        child: error_widget.ErrorWidget(
                                                                                                          tryAgain: () {},
                                                                                                        ),
                                                                                                      )),
                                                                                              empty: () => const SliverToBoxAdapter(child: SizedBox()),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                        BlocBuilder<SectionsBloc, SectionsState>(
                                                                                          buildWhen: (previous, current) => current.maybeWhen(
                                                                                            orElse: () => false,
                                                                                            loadingMore: () => true,
                                                                                          ),
                                                                                          builder: (context, state) {
                                                                                            return SliverToBoxAdapter(
                                                                                              child: Center(
                                                                                                child: context.read<ServiceBloc>().lastPage
                                                                                                    ? const SizedBox(
                                                                                                        width: 20,
                                                                                                        height: 20,
                                                                                                        child: CircularProgressIndicator(
                                                                                                          strokeWidth: 3,
                                                                                                        ),
                                                                                                      )
                                                                                                    : const SizedBox(),
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
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                        ).then((value) => context
                                                                            .read<SectionsBloc>()
                                                                            .add(SectionsEvent.changeItem(items: selectedItemsSections)));
                                                                      }
                                                                    },
                                                                    child: BlocBuilder<
                                                                        SectionsBloc,
                                                                        SectionsState>(
                                                                      buildWhen: (previous,
                                                                              current) =>
                                                                          current
                                                                              .maybeWhen(
                                                                        orElse: () =>
                                                                            false,
                                                                        itemChanged:
                                                                            (data) =>
                                                                                true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              state) {
                                                                        return Container(
                                                                          // height: 6.h,
                                                                          width:
                                                                              double.infinity,
                                                                          padding: EdgeInsets.only(
                                                                              right: 3.w,
                                                                              left: 3.w,
                                                                              top: 2.w,
                                                                              bottom: 2.w),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(1.h),
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.black26,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              state.maybeMap(
                                                                            itemChanged: (value) => value.data.isEmpty
                                                                                ? Text(
                                                                                    "Subservices".tr(),
                                                                                  )
                                                                                : Wrap(
                                                                                    spacing: 1.w,
                                                                                    children: [
                                                                                      ...value.data.map(
                                                                                        (e) => Container(
                                                                                          margin: EdgeInsets.only(bottom: 1.w),
                                                                                          padding: const EdgeInsets.all(2),
                                                                                          decoration: BoxDecoration(
                                                                                            color: AppTheme.green,
                                                                                            borderRadius: BorderRadius.circular(1.h),
                                                                                          ),
                                                                                          child: Text(e.name!),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                            orElse: () =>
                                                                                Text(
                                                                              "Subservices".tr(),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            : const SizedBox())
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                });
                              }),
                              InputTextField(
                                  label: "Name_comercial_activity",
                                  hint: "Name_comercial_activity",
                                  textInputAction: TextInputAction.next,
                                  controller: nameCommercial,
                                  validator: (value) {
                                    if (value != null &&
                                        value.isNotEmpty &&
                                        value.length >= 4) {
                                      return null;
                                    } else if (value!.length < 4 &&
                                        value.isNotEmpty) {
                                      return "The_business_name_is_too_short";
                                    }
                                    return "please_enter_Name_comercial_activity"
                                        .tr();
                                  }),
                              InputTextField(
                                  label: "About_your_business",
                                  hint: "About_your_business",
                                  textInputAction: TextInputAction.next,
                                  controller: descriptionCommercial,
                                  validator: (value) {
                                    if (value != null &&
                                        value.isNotEmpty &&
                                        value.length >= 4) {
                                      return null;
                                    } else if (value!.length < 20 &&
                                        value.isNotEmpty) {
                                      return "The_overview_of_your_business_is_very_short";
                                    }
                                    return "Please_enter_information_about_your_business"
                                        .tr();
                                  }),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const Text("commercial_activities").tr(),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SearchDropDownWidget<StandarEntity>(
                                    controller: activityController,
                                    onChanged: (item) {
                                      if (item != null) {
                                        sectorController.selectedItem.value =
                                            SearchableDropdownMenuItem(
                                          child: Text(item?.sector?.name ?? ""),
                                          label: item?.sector?.name ?? "",
                                          value: item?.sector,
                                        );
                                        subsuctorsController
                                                .selectedItem.value =
                                            SearchableDropdownMenuItem(
                                                child: Text(
                                                    item?.subSuctor?.name ??
                                                        ""),
                                                label:
                                                    item?.subSuctor?.name ?? "",
                                                value: item?.subSuctor);
                                      }
                                      activityId = item?.id;
                                      subSuctorId = item?.subSuctor?.id;
                                      sectorId = item?.sector?.id;
                                      print(subSuctorId);
                                    },
                                    noRecordText: "there_is_no_section",
                                    hint: "commercial_activities".tr(),
                                    // title: "Commercial_sector".tr(),
                                  ),
                                  const Text("Commercial_activity_department")
                                      .tr(),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  SearchDropDownWidget<StandarEntity>(
                                    controller: subsuctorsController,
                                    onChanged: (item) {
                                      if (item != null) {
                                        sectorController.selectedItem.value =
                                            SearchableDropdownMenuItem(
                                          child: Text(item?.sector?.name ?? ""),
                                          label: item?.sector?.name ?? "",
                                          value: item?.sector,
                                        );
                                      }
                                      subSuctorId = item?.id;
                                    },
                                    noRecordText: "there_is_no_section",
                                    hint: "Commercial_activity_department".tr(),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  const Text("Commercial_sector").tr(),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  SearchDropDownWidget<StandarEntity>(
                                    controller: sectorController,
                                    onChanged: (item) {
                                      sectorId = item?.id;
                                      // activityId = item!.id;
                                    },
                                    noRecordText: "there_is_no_section",
                                    hint: "Commercial_sector".tr(),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: 1.h,
                              // ),

                              const Text("Business_WhatsApp_number").tr(),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: InternationalPhoneNumberInput(
                                  initialValue: PhoneNumber(
                                      isoCode: isoCode,
                                      phoneNumber: phoneCommercial.text),
                                  hintText: "Business_WhatsApp_number".tr(),
                                  onInputChanged: (PhoneNumber number) {
                                    phoneNumber = number;
                                  },
                                  errorMessage: "please_enter_valid_phone".tr(),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  textFieldController: phoneCommercial,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              BlocBuilder<RegisterCompanyBloc,
                                  RegisterCompanyState>(
                                buildWhen: (previous, current) =>
                                    current.maybeWhen(
                                  orElse: () => false,
                                  loadedImagecardIntity: (image) => true,
                                  itemChanged: (item) => true,
                                ),
                                builder: (context, state) => state.maybeWhen(
                                    itemChanged: (item) => const SizedBox(),
                                    orElse: () => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Attach_your_ID_card")
                                                .tr(),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            intityCard[0].isNotEmpty &&
                                                    isURL(intityCard[0])
                                                ? CachedNetworkImage(
                                                    imageUrl: intityCard[0],
                                                    imageBuilder:
                                                        (ctx, imageProvider) {
                                                      return Stack(
                                                        children: [
                                                          Container(
                                                            height: 20.h,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black26),
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      RegisterCompanyBloc>()
                                                                  .add(const RegisterCompanyEvent
                                                                          .uploadImagecardIntity(
                                                                      source: ImageSource
                                                                          .gallery));
                                                            },
                                                            child: Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(5
                                                                            .w),
                                                                child: const Icon(
                                                                    Iconsax
                                                                        .edit)),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    placeholder: (_, __) =>
                                                        Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey.shade200,
                                                      highlightColor:
                                                          Colors.grey.shade50,
                                                      child: Container(
                                                        height: 20.h,
                                                        width: double.infinity,
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                    loadedImagecardIntity: (image) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Attach_your_ID_card")
                                                .tr(),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            image.isNotEmpty
                                                ? Stack(
                                                    children: [
                                                      Image.file(
                                                        File(image[0].path),
                                                        height: 20.h,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  RegisterCompanyBloc>()
                                                              .add(const RegisterCompanyEvent
                                                                      .uploadImagecardIntity(
                                                                  source: ImageSource
                                                                      .gallery));
                                                        },
                                                        child: Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    5.w),
                                                            child: const Icon(
                                                                Iconsax.edit)),
                                                      )
                                                    ],
                                                  )
                                                : const SizedBox(),
                                          ],
                                        )),
                              ),
                              user?.upgraded == null
                                  ? BlocBuilder<RegisterCompanyBloc,
                                      RegisterCompanyState>(
                                      buildWhen: (previous, current) =>
                                          current.maybeWhen(
                                        orElse: () => false,
                                        loadedImageLisence: (image) => true,
                                        itemChanged: (item) => true,
                                      ),
                                      builder: (context, state) =>
                                          state.maybeWhen(
                                              itemChanged: (item) =>
                                                  const SizedBox(),
                                              orElse: () => Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            lisence.isNotEmpty
                                                                ? 1.h
                                                                : 0,
                                                      ),
                                                      lisence.isNotEmpty
                                                          ? const Text(
                                                                  "Attach_Commercial_license")
                                                              .tr()
                                                          : const SizedBox(),
                                                      lisence.isNotEmpty &&
                                                              isURL(lisence)
                                                          ? CachedNetworkImage(
                                                              imageUrl: lisence,
                                                              imageBuilder: (ctx,
                                                                  imageProvider) {
                                                                return Stack(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          20.h,
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.black26),
                                                                        image:
                                                                            DecorationImage(
                                                                          image:
                                                                              imageProvider,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        context
                                                                            .read<RegisterCompanyBloc>()
                                                                            .add(const RegisterCompanyEvent.uploadImageLisence(source: ImageSource.gallery));
                                                                      },
                                                                      child: Container(
                                                                          margin: EdgeInsets.all(5
                                                                              .w),
                                                                          child:
                                                                              const Icon(Iconsax.edit)),
                                                                    )
                                                                  ],
                                                                );
                                                              },
                                                              placeholder: (_,
                                                                      __) =>
                                                                  Shimmer
                                                                      .fromColors(
                                                                baseColor: Colors
                                                                    .grey
                                                                    .shade200,
                                                                highlightColor:
                                                                    Colors.grey
                                                                        .shade50,
                                                                child:
                                                                    Container(
                                                                  height: 20.h,
                                                                  width: double
                                                                      .infinity,
                                                                ),
                                                              ),
                                                            )
                                                          : const SizedBox(),
                                                    ],
                                                  ),
                                              loadedImageLisence: (image) =>
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                              "Attach_Commercial_license")
                                                          .tr(),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Image.file(
                                                        File(image.path),
                                                        height: 20.h,
                                                        width: double.infinity,
                                                      )
                                                    ],
                                                  )),
                                    )
                                  : const SizedBox(),
                              BlocBuilder<RegisterCompanyBloc,
                                  RegisterCompanyState>(
                                buildWhen: (previous, current) =>
                                    current.maybeWhen(
                                  orElse: () => false,
                                  loadedImageSignuature: (image) => true,
                                  itemChanged: (item) => true,
                                ),
                                builder: (context, state) => state.maybeWhen(
                                    itemChanged: (item) => const SizedBox(),
                                    orElse: () => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: signature.isNotEmpty
                                                  ? 1.h
                                                  : 0,
                                            ),
                                            lisence.isNotEmpty
                                                ? const Text(
                                                        "Attach_signature_authorization")
                                                    .tr()
                                                : const SizedBox(),
                                            signature.isNotEmpty &&
                                                    isURL(signature)
                                                ? CachedNetworkImage(
                                                    imageUrl: signature,
                                                    imageBuilder:
                                                        (ctx, imageProvider) {
                                                      return Stack(
                                                        children: [
                                                          Container(
                                                            height: 20.h,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black26),
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      RegisterCompanyBloc>()
                                                                  .add(const RegisterCompanyEvent
                                                                          .uploadImageSignature(
                                                                      source: ImageSource
                                                                          .gallery));
                                                            },
                                                            child: Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(5
                                                                            .w),
                                                                child: const Icon(
                                                                    Iconsax
                                                                        .edit)),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    placeholder: (_, __) =>
                                                        Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey.shade200,
                                                      highlightColor:
                                                          Colors.grey.shade50,
                                                      child: Container(
                                                        height: 15.h,
                                                        width: 15.h,
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                    loadedImageSignuature: (image) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                                    "Attach_signature_authorization")
                                                .tr(),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Image.file(
                                              File(image.path),
                                              height: 20.h,
                                              width: double.infinity,
                                            )
                                          ],
                                        )),
                              ),
                              BlocBuilder<RegisterCompanyBloc,
                                  RegisterCompanyState>(
                                buildWhen: (previous, current) =>
                                    current.maybeWhen(
                                  orElse: () => false,
                                  itemChanged: (item) => true,
                                ),
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    itemChanged: (item) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        user?.upgraded == null
                                            ? GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          RegisterCompanyBloc>()
                                                      .add(const RegisterCompanyEvent
                                                              .uploadImagecardIntity(
                                                          source: ImageSource
                                                              .gallery));
                                                },
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.file_download),
                                                    Expanded(
                                                      child: const Text(
                                                              "Attach_your_ID_card")
                                                          .tr(),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : const SizedBox(),
                                        SizedBox(
                                          height: item.type == Type.Company
                                              ? 1.h
                                              : 0,
                                        ),
                                        item.type == Type.Company
                                            ? GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          RegisterCompanyBloc>()
                                                      .add(const RegisterCompanyEvent
                                                              .uploadImageLisence(
                                                          source: ImageSource
                                                              .gallery));
                                                },
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.file_download),
                                                    Expanded(
                                                      child: const Text(
                                                              "Attach_Commercial_license")
                                                          .tr(),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : const SizedBox(),
                                        SizedBox(
                                          height: item.type == Type.Company
                                              ? 1.h
                                              : 0,
                                        ),
                                        item.type == Type.Company
                                            ? GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          RegisterCompanyBloc>()
                                                      .add(const RegisterCompanyEvent
                                                              .uploadImageSignature(
                                                          source: ImageSource
                                                              .gallery));
                                                },
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.file_download),
                                                    Expanded(
                                                      child: const Text(
                                                              "Attach_signature_authorization")
                                                          .tr(),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                    orElse: () => const SizedBox(),
                                  );
                                },
                              ),

                              SizedBox(
                                height: 2.h,
                              ),
                              InputTextField(
                                label: "reason",
                                hint: "reason",
                                controller: reason,
                                validator: (p0) {
                                  return reasonValidator(p0);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: custombuttom(
                          onTap: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            if (typeCompanty == null) {
                              AlertController.show(
                                  "",
                                  "choose_type_account".tr(),
                                  TypeAlert.warning);
                              return;
                            }
                            if (selectedItemsService.isEmpty) {
                              AlertController.show(
                                  "",
                                  "Please_choose_what_to_offer".tr(),
                                  TypeAlert.warning);
                              return;
                            }
                            if (selectedItemsSections.isEmpty &&
                                selectedItemsService
                                    .any((element) => element.hasSections!)) {
                              AlertController.show(
                                  "",
                                  "Please_choose_subservices".tr(),
                                  TypeAlert.warning);
                              return;
                            }
                            if (activityId == null) {
                              AlertController.show(
                                  "",
                                  "please_choose_activity".tr(),
                                  TypeAlert.warning);
                              return;
                            }

                            if (subSuctorId == null) {
                              AlertController.show(
                                  "",
                                  "please_choose_subSector".tr(),
                                  TypeAlert.warning);
                              return;
                            }

                            if (sectorId == null) {
                              AlertController.show(
                                  "",
                                  "please_choose_sector".tr(),
                                  TypeAlert.warning);
                              return;
                            }
                            if (intityCard.isEmpty) {
                              AlertController.show(
                                  "",
                                  "Please_upload_a_photo_of_the_front_and_back_of_your_civil_ID"
                                      .tr(),
                                  TypeAlert.warning);
                              return;
                            }
                            if (typeCompanty == "Company" && lisence.isEmpty) {
                              AlertController.show(
                                  "",
                                  "Please_upload_a_copy_of_the_commercial_license"
                                      .tr(),
                                  TypeAlert.warning);
                            }
                            if (typeCompanty == "Company" &&
                                signature.isEmpty) {
                              AlertController.show(
                                  "",
                                  "Please_upload_a_copy_of_the_signature_approval"
                                      .tr(),
                                  TypeAlert.warning);
                            }

                            if (_formKey.currentState!.validate()) {
                              context.read<ProfileBloc>().add(
                                    ProfileEvent.editProfile(
                                      request: EditProfileRequest(
                                          sectionId:
                                              selectedItemsSections.isNotEmpty
                                                  ? selectedItemsSections
                                                  : null,
                                          serviceId: selectedItemsService,
                                          password: informationPrimay.password,
                                          passwordConfirmation:
                                              informationPrimay.password,
                                          description:
                                              descriptionCommercial.text,
                                          nameCommercial: nameCommercial.text,
                                          phoneCommercial:
                                              "//${phoneNumber?.isoCode}-${phoneNumber?.dialCode}-${phoneCommercial.text.replaceAll(" ", "")}",
                                          phone: informationPrimay.phone,
                                          lastname: informationPrimay.lastname,
                                          firstname:
                                              informationPrimay.firstname,
                                          country: informationPrimay.country,
                                          email: informationPrimay.email,
                                          city: informationPrimay.city,
                                          region: informationPrimay.region,
                                          countryId:
                                              informationPrimay.countryId,
                                          regionId: informationPrimay.regionId,
                                          cityId: informationPrimay.cityId,
                                          activityId: activityId,
                                          sectorId: sectorId,
                                          subSectors: subSuctorId,
                                          civilCard: intityCard,
                                          lisence: lisence,
                                          singnature: signature,
                                          type: typeCompanty),
                                    ),
                                  );
                            } else if (gender == null) {
                              AlertController.show("", "Choose_the_gender".tr(),
                                  TypeAlert.warning);
                              return;
                            } else if (!isChecked!) {
                              AlertController.show(
                                  "",
                                  "agree to the terms and conditions".tr(),
                                  TypeAlert.warning);
                            }
                          },
                          child: BlocBuilder<ProfileBloc, ProfileState>(
                            buildWhen: (previous, current) => current.maybeWhen(
                              orElse: () => false,
                              error: (e) => true,
                              loading: () => true,
                              succes: () => true,
                            ),
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () => const Text("sing_up").tr(),
                                loading: () =>
                                    LoadingAnimationWidget.prograssiveDots(
                                        color: AppTheme.primaryColor,
                                        size: 20.sp),
                              );
                            },
                          ),
                        ),
                      )
                    ],
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

List<SearchableDropdownMenuItem<T>> _mapDataToDropDownItem<T extends dynamic>(
    List<T> data) {
  return data
      .map((e) => SearchableDropdownMenuItem<T>(
          value: e, label: e.name ?? '', child: Text(e.name ?? '')))
      .toList();
}
