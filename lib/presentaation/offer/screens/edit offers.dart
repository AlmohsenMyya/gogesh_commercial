import 'dart:ffi';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/durations_entity/durations_response.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/search_dropdown_widget.dart';
import 'package:commmercial_directory_seller/presentaation/offer/add_edit_offer/add_edit_offer_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/offer/bloc/image_pick_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:searchable_paginated_dropdown/searchable_dropdown_controller.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

import '../../../app/theme.dart';
import '../../../domain/request/offers/offer_request.dart';
import '../../auth/widgets/drop_down.dart';
import '../../register_company/activity/activity_bloc.dart';
import '../../register_company/screens/update_company_screen.dart';
import '../../register_company/seasons/seasons_bloc.dart';
import '../../register_company/sector/sector_bloc.dart';
import '../../register_company/specialization/specialization_bloc.dart';
import '../../widgets/input_text_field.dart';

// ignore: must_be_immutable
class Editoffers extends HookWidget {
  Editoffers({required this.offer, super.key});
  final OfferEntity offer;

  final _formKey = GlobalKey<FormState>();

  int? seasonsId;

  int? durationId;

  StandarEntity? seasons;

  List<String> images = [];
  bool isCheck = false;
  int? selectedValue;
  List<String> imagesPaths = [];
  String? video;
  List<String> imageFile = [];
  List<DurationsEntity> data = [
    const DurationsEntity(id: 1, type: 'يوم', duration: 3, price: 100),
    const DurationsEntity(id: 2, type: 'شهر', duration: 2, price: 102),
    const DurationsEntity(id: 3, type: 'عام', duration: 1, price: 101)
  ];
  final SearchableDropdownController<StandarEntity> seasonsController =
      SearchableDropdownController();
  @override
  Widget build(BuildContext context) {
    final nameoffer = useTextEditingController();
    final descriptionOffers = useTextEditingController();
    final termsOffers = useTextEditingController();
    final percentage = useTextEditingController();
    final price = useTextEditingController();
    final total = useTextEditingController();
    final reason = useTextEditingController();
    DateTime? start;
    DateTime? end;
    String? dateStart;
    String? dateEnd;
    InformationEntity? information =
        sl<LocalDataSource>().getValue(LocalDataKeys.infoamationPackage);
    seasonsController.addListener((p, searchKey) {
      context.read<SeasonsBloc>().add(SeasonsEvent.loadSeasons(
          filter: Filter(page: p, q: searchKey, type: 'paginate')));
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddEditOfferBloc(
              getDurationsUseCase: sl(),
              editOffersUseCase: sl(),
              getOfferDetailsUseCase: sl(),
              getOfferUpdatedDetailsUseCase: sl())
            ..add(
              offer.updatedId == null
                  ? AddEditOfferEvent.loadOfferDetails(
                      id: offer.id!,
                      path: '/offers/edit/',
                    )
                  : AddEditOfferEvent.loadOfferUpdateDetails(
                      updatedId: offer.updatedId!,
                    ),
            ),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AddEditOfferBloc, AddEditOfferState>(
            listener: (context, state) {
              state.maybeWhen(
                succes: (msg) {
                  AlertController.show("", "the_offer_has_been_modified".tr(),
                      TypeAlert.success);
                  context.goNamed(Routes.home.name);
                },
                orElse: () {},
                error: (error) {
                  AlertController.show("", error!.tr(), TypeAlert.error);
                },
                loadedVideo: (image) {
                  video = image;
                },
                dataLoaded: (value) {
                  nameoffer.text = value.data.title!;
                  descriptionOffers.text = value.data.description!;

                  seasons = value.data.season;
                  durationId = value.data.duration?.id;
                  selectedValue = value.data.duration?.id;
                  total.text = value.data.total == null
                      ? '0'
                      : value.data.total.toString();
                  seasonsId = value.data.season!.id;
                  images.addAll(value.data.images!);
                  imagesPaths.addAll(value.data.images!);
                  price.text = value.data.price!.toString();
                  percentage.text = value.data.discount.toString();
                  termsOffers.text = value.data.condition ?? '';
                },
              );
            },
          ),
          BlocListener<ImagePickBloc, ImagePickState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                loadedImage: (image, url) {
                  images.removeWhere((element) => element == url);
                  images.add(image.path);
                  imagesPaths.removeWhere((element) => element == url);
                  imageFile.add(image.path);
                },
              );
            },
          ),
          BlocListener<SeasonsBloc, SeasonsState>(
            listener: (context, state) {
              state.whenOrNull(
                  Loaded: (data, pageKey, lastPage) => {
                        seasonsController.appendNewPage(
                            _mapDataToDropDownItem<StandarEntity>(data))
                      });
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
              images.clear();
              imageFile.clear();
              imagesPaths.clear();
              return true;
            },
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text("edit offer").tr(),
                  leading: IconButton(
                      onPressed: () {
                        context.pop();
                        imageFile.clear();
                        images.clear();
                        imagesPaths.clear();
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: BlocBuilder<AddEditOfferBloc, AddEditOfferState>(
                        buildWhen: (previous, current) {
                          return current.maybeWhen(
                            orElse: () => false,
                            dataLoaded: (data) => true,
                            loading: () => true,
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => const SizedBox(),
                            loading: () => Shimmer.fromColors(
                              baseColor: Colors.grey.shade200,
                              highlightColor: Colors.grey.shade50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Display_pictures",
                                    style: TextStyle(fontSize: 14.sp),
                                  ).tr(),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Stack(
                                    children: [
                                      BlocBuilder<AddEditOfferBloc,
                                          AddEditOfferState>(
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                            orElse: () => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("0/3"),
                                                Container(
                                                  height: 20.h,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomRight: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                      border: Border.all(
                                                          color:
                                                              Colors.black26)),
                                                  child: const Center(
                                                    child: Icon(Icons.image),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            dataLoaded: (value) =>
                                                //Text('data'),
                                                Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("//${images.length}/3"),
                                                SizedBox(
                                                  height: 30.h,
                                                  width: double.infinity,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: images.length,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            CachedNetworkImage(
                                                      imageUrl: images[index],
                                                      imageBuilder:
                                                          (ctx, imageProvider) {
                                                        return Container(
                                                          height: 110,
                                                          width: 110,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey,
                                                                      width: 8),
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )),
                                                        );
                                                      },
                                                      placeholder: (_, __) =>
                                                          Shimmer.fromColors(
                                                        baseColor: Colors
                                                            .grey.shade200,
                                                        highlightColor:
                                                            Colors.grey.shade50,
                                                        child: Container(
                                                          height: 110,
                                                          width: 110,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      BlocBuilder<AddEditOfferBloc,
                                          AddEditOfferState>(
                                        builder: (context, state) {
                                          return Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: GestureDetector(
                                              onTap: () => context
                                                  .read<AddEditOfferBloc>()
                                                  .add(
                                                    const AddEditOfferEvent
                                                            .uploadImage(
                                                        source: ImageSource
                                                            .gallery),
                                                  ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 33, 39, 229),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5.h,
                                                    )),
                                                height: 5.h,
                                                width: 5.h,
                                                child: Icon(
                                                  Icons.add,
                                                  size: 20.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "Presentation_video_(optional)",
                                    style: TextStyle(fontSize: 14.sp),
                                  ).tr(),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Stack(
                                    children: [
                                      BlocBuilder<AddEditOfferBloc,
                                          AddEditOfferState>(
                                        buildWhen: (previous, current) {
                                          return current.maybeWhen(
                                              orElse: () => false,
                                              loadedVideo: (image) => true);
                                        },
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                              orElse: () => Container(
                                                    height: 20.h,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius
                                                                .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20)),
                                                        border: Border.all(
                                                            color: Colors
                                                                .black26)),
                                                    child: const Center(
                                                      child: Icon(Icons
                                                          .video_collection),
                                                    ),
                                                  ),
                                              loadedVideo: (image) {
                                                return Center(
                                                  child: Image.file(
                                                    File(image),
                                                    fit: BoxFit.cover,
                                                    height: 30.h,
                                                    width: 20.h,
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                      BlocBuilder<AddEditOfferBloc,
                                          AddEditOfferState>(
                                        builder: (context, state) {
                                          return Positioned(
                                            left: 0,
                                            bottom: 0,
                                            child: GestureDetector(
                                              onTap: () => context
                                                  .read<AddEditOfferBloc>()
                                                  .add(
                                                    const AddEditOfferEvent
                                                            .uploadVideo(
                                                        source: ImageSource
                                                            .gallery),
                                                  ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 33, 39, 229),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5.h,
                                                    )),
                                                height: 5.h,
                                                width: 5.h,
                                                child: Icon(
                                                  Icons.add,
                                                  size: 20.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  InputTextField(
                                    textInputAction: TextInputAction.next,
                                    label: "name offer".tr(),
                                    hint: "name offer".tr(),
                                    controller: nameoffer,
                                    validator: (value) {
                                      if (value != null &&
                                          value.isNotEmpty &&
                                          value.length >= 4) {
                                        return null;
                                      }
                                      return "please_enter_Name_offers".tr();
                                    },
                                  ),
                                  InputTextField(
                                      textInputAction: TextInputAction.next,
                                      maxLines: 5,
                                      label: "Offer details".tr(),
                                      hint: "Write the offer details".tr(),
                                      controller: descriptionOffers,
                                      validator: (value) {
                                        if (value != null &&
                                            value.isNotEmpty &&
                                            value.length >= 20) {
                                          return null;
                                        } else if (value!.length < 20) {
                                          return "description_in insufficient";
                                        }
                                        return "please_enter_description".tr();
                                      }),
                                ],
                              ),
                            ),
                            dataLoaded: (value) => Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Display_pictures",
                                    style: TextStyle(fontSize: 14.sp),
                                  ).tr(),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Stack(
                                    children: [
                                      BlocBuilder<AddEditOfferBloc,
                                          AddEditOfferState>(
                                        buildWhen: (previous, current) {
                                          return current.maybeWhen(
                                            orElse: () => false,
                                            dataLoaded: (data) => true,
                                          );
                                        },
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                            orElse: () => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("0/3"),
                                                Container(
                                                  height: 20.h,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomRight: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                      border: Border.all(
                                                          color:
                                                              Colors.black26)),
                                                  child: const Center(
                                                    child: Icon(Icons.image),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            dataLoaded: (value) => BlocBuilder<
                                                ImagePickBloc, ImagePickState>(
                                              builder: (context, state) {
                                                return state.when(
                                                  initial: () => Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "${images.length}/3"),
                                                      SizedBox(
                                                        height: 30.h,
                                                        width: double.infinity,
                                                        child:
                                                            ListView.separated(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              images.length,
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              GestureDetector(
                                                            onTap: () => context
                                                                .read<
                                                                    ImagePickBloc>()
                                                                .add(ImagePickEvent
                                                                    .uploadImage(
                                                                        url: images[
                                                                            index])),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  images[index],
                                                              imageBuilder: (ctx,
                                                                  imageProvider) {
                                                                return Container(
                                                                  height: 110,
                                                                  width: 110,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          image:
                                                                              DecorationImage(
                                                                            image:
                                                                                imageProvider,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          )),
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
                                                                  height: 110,
                                                                  width: 110,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .grey,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  SizedBox(
                                                                      width:
                                                                          1.h),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  loadedImage: (image, url) =>
                                                      Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "${images.length}/3"),
                                                      SizedBox(
                                                        height: 30.h,
                                                        width: double.infinity,
                                                        child:
                                                            ListView.separated(
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  SizedBox(
                                                                      width:
                                                                          1.h),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              images.length,
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              isURL(images[
                                                                      index])
                                                                  ? GestureDetector(
                                                                      onTap: () => context
                                                                          .read<
                                                                              ImagePickBloc>()
                                                                          .add(ImagePickEvent
                                                                              .uploadImage(
                                                                            url:
                                                                                images[index],
                                                                          )),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            images[index],
                                                                        imageBuilder:
                                                                            (ctx,
                                                                                imageProvider) {
                                                                          return Container(
                                                                            height:
                                                                                110,
                                                                            width:
                                                                                110,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                image: DecorationImage(
                                                                                  image: imageProvider,
                                                                                  fit: BoxFit.cover,
                                                                                )),
                                                                          );
                                                                        },
                                                                        placeholder:
                                                                            (_, __) =>
                                                                                Shimmer.fromColors(
                                                                          baseColor: Colors
                                                                              .grey
                                                                              .shade200,
                                                                          highlightColor: Colors
                                                                              .grey
                                                                              .shade50,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                110,
                                                                            width:
                                                                                110,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.grey,
                                                                              borderRadius: BorderRadius.circular(100),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : GestureDetector(
                                                                      onTap: () => context
                                                                          .read<
                                                                              ImagePickBloc>()
                                                                          .add(ImagePickEvent
                                                                              .uploadImage(
                                                                            url:
                                                                                images[index],
                                                                          )),
                                                                      child: Image
                                                                          .file(
                                                                        File(images[
                                                                            index]),
                                                                        height:
                                                                            110,
                                                                        width:
                                                                            110,
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "Presentation_video_(optional)",
                                    style: TextStyle(fontSize: 14.sp),
                                  ).tr(),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Stack(
                                    children: [
                                      BlocBuilder<AddEditOfferBloc,
                                          AddEditOfferState>(
                                        buildWhen: (previous, current) {
                                          return current.maybeWhen(
                                              orElse: () => false,
                                              loadedVideo: (image) => true);
                                        },
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                              orElse: () => Container(
                                                    height: 20.h,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius
                                                                .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20)),
                                                        border: Border.all(
                                                            color: Colors
                                                                .black26)),
                                                    child: const Center(
                                                      child: Icon(Icons
                                                          .video_collection),
                                                    ),
                                                  ),
                                              loadedVideo: (image) {
                                                return Center(
                                                  child: Image.file(
                                                    File(image),
                                                    fit: BoxFit.cover,
                                                    height: 30.h,
                                                    width: 20.h,
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                      BlocBuilder<AddEditOfferBloc,
                                          AddEditOfferState>(
                                        builder: (context, state) {
                                          return Positioned(
                                            left: 0,
                                            bottom: 0,
                                            child: GestureDetector(
                                              onTap: () => context
                                                  .read<AddEditOfferBloc>()
                                                  .add(
                                                    const AddEditOfferEvent
                                                            .uploadVideo(
                                                        source: ImageSource
                                                            .gallery),
                                                  ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 33, 39, 229),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5.h,
                                                    )),
                                                height: 5.h,
                                                width: 5.h,
                                                child: Icon(
                                                  Icons.add,
                                                  size: 20.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  InputTextField(
                                    textInputAction: TextInputAction.next,
                                    label: "name offer".tr(),
                                    hint: "name offer".tr(),
                                    controller: nameoffer,
                                    validator: (value) {
                                      if (value != null &&
                                          value.isNotEmpty &&
                                          value.length >= 4) {
                                        if (value.length >= 20) {
                                          return "Display_name_must_be_less_than_20_characters"
                                              .tr();
                                        }
                                        return null;
                                      }

                                      return "please_enter_Name_offers".tr();
                                    },
                                  ),
                                  InputTextField(
                                      textInputAction: TextInputAction.next,
                                      label: "Offer details".tr(),
                                      hint: "Write the offer details".tr(),
                                      controller: descriptionOffers,
                                      validator: (value) {
                                        if (value != null &&
                                            value.isNotEmpty &&
                                            value.length >= 20) {
                                          return null;
                                        } else if (value!.length < 20) {
                                          return "description_in insufficient";
                                        }
                                        return "please_enter_description".tr();
                                      }),
                                  InputTextField(
                                      textInputAction: TextInputAction.next,
                                      label: "Offer terms".tr(),
                                      hint: "Write the offer terms".tr(),
                                      controller: termsOffers,
                                      validator: (value) {
                                        if (value != null &&
                                            value.isNotEmpty &&
                                            value.length >= 20) {
                                          return null;
                                        } else if (value!.length < 20) {
                                          return "The_text_is_insufficient";
                                        }
                                        return "Please_enter_offer_terms".tr();
                                      }),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),

                                  const Text("Offer_start_date").tr(),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  StatefulBuilder(builder: (context, setState) {
                                    return GestureDetector(
                                      onTap: () async {
                                        start = await showRoundedDatePicker(
                                          context: context,
                                          height: 40.h,
                                          locale: Locale(
                                            context.locale.languageCode,
                                          ),
                                          initialDate: DateTime.now(),
                                          lastDate: DateTime(2025),
                                          firstDate:
                                              DateTime(DateTime.now().day),
                                          background: Colors.transparent,
                                          theme: ThemeData(
                                            primaryColor: AppTheme.green,
                                            dialogBackgroundColor:
                                                Colors.purple[50],
                                            textTheme: const TextTheme(
                                              bodyLarge: TextStyle(
                                                  color: AppTheme.green),
                                              bodySmall: TextStyle(
                                                  color: AppTheme.green),
                                            ),
                                            disabledColor: Colors.orange,
                                          ),
                                        );

                                        if (start != null &&
                                            start.toString() != dateStart) {
                                          setState(
                                            () {
                                              dateStart =
                                                  DateFormat('yyyy-MM-dd', 'en')
                                                      .format(start!);
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 10),
                                        height: 6.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    const Color(0xffcbcbcb))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              dateStart == null
                                                  ? "Offer_start_date"
                                                  : dateStart!,
                                              style: TextStyle(
                                                color: dateStart == null
                                                    ? const Color(0xffcecece)
                                                    : Colors.black,
                                                fontSize: 14,
                                              ),
                                            ).tr(),
                                            const Icon(
                                              Iconsax.timer_start,
                                              color: AppTheme.green,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),

                                  const Text("Offer_end_date").tr(),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  StatefulBuilder(builder: (context, setState) {
                                    return GestureDetector(
                                      onTap: () async {
                                        end = await showRoundedDatePicker(
                                          context: context,
                                          height: 40.h,
                                          locale: Locale(
                                            context.locale.languageCode,
                                          ),
                                          initialDate: DateTime.now(),
                                          lastDate: DateTime(2025),
                                          firstDate:
                                              DateTime(DateTime.now().day),
                                          background: Colors.transparent,
                                          theme: ThemeData(
                                            primaryColor: AppTheme.green,
                                            dialogBackgroundColor:
                                                Colors.purple[50],
                                            textTheme: const TextTheme(
                                              bodyLarge: TextStyle(
                                                  color: AppTheme.green),
                                              bodySmall: TextStyle(
                                                  color: AppTheme.green),
                                            ),
                                            disabledColor: Colors.orange,
                                          ),
                                        );

                                        if (end != null &&
                                            end.toString() != dateEnd) {
                                          setState(
                                            () {
                                              dateEnd =
                                                  DateFormat('yyyy-MM-dd', 'en')
                                                      .format(end!);
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 10),
                                        height: 6.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    const Color(0xffcbcbcb))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              dateEnd == null
                                                  ? "Offer_end_date"
                                                  : dateEnd!,
                                              style: TextStyle(
                                                color: dateEnd == null
                                                    ? const Color(0xffcecece)
                                                    : Colors.black,
                                                fontSize: 14,
                                              ),
                                            ).tr(),
                                            const Icon(
                                              Iconsax.timer_pause,
                                              color: AppTheme.green,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),

                                  InputTextField(
                                      textInputAction: TextInputAction.next,
                                      inputType: TextInputType.number,
                                      label: "discount_percentage".tr(),
                                      hint: "discount_percentage".tr(),
                                      controller: percentage,
                                      validator: (value) {
                                        if (value != null &&
                                            value.isNotEmpty &&
                                            isFloat(value)) {
                                          int v = int.parse(value);
                                          if (v >= 0 && v <= 100) {
                                            return null;
                                          } else {
                                            return "please_enter_percentage_en_range_0_to_100"
                                                .tr();
                                          }
                                        }
                                        return "please_enter_discount_percentage"
                                            .tr();
                                      }),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),

                                  const Text("seasion").tr(),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  SearchDropDownWidget<StandarEntity>(
                                    controller: seasonsController,
                                    onChanged: (item) {},
                                    noRecordText: "there_is_no_seasons",
                                    hint: "seasion".tr(),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const Text("seasions").tr(),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  // BlocBuilder<SeasonsBloc, SeasonsState>(
                                  //   builder: (context, state) {
                                  //     return state.maybeWhen(
                                  //       initial: () => GestureDetector(
                                  //         onTap: () {
                                  //           // context.read<SeasonsBloc>().add(
                                  //           //     const SeasonsEvent
                                  //           //         .loadSeasons());
                                  //           // seasonsId == null;
                                  //         },
                                  //         child: Container(
                                  //           padding: const EdgeInsets.only(
                                  //               left: 14, right: 14),
                                  //           height: 6.h,
                                  //           width: double.infinity,
                                  //           decoration: BoxDecoration(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(7),
                                  //             border: Border.all(
                                  //                 color: Colors.black26),
                                  //           ),
                                  //           child: Row(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment
                                  //                     .spaceBetween,
                                  //             children: [
                                  //               Text(
                                  //                 seasons!.name!,
                                  //                 style: TextStyle(
                                  //                   fontSize: 14.sp,
                                  //                   // fontWeight: FontWeight.bold,
                                  //                   color: Colors.black87,
                                  //                 ),
                                  //                 overflow:
                                  //                     TextOverflow.ellipsis,
                                  //               ),
                                  //               const Icon(
                                  //                 Icons.arrow_drop_down_sharp,
                                  //                 color: Colors.grey,
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       seasonsLoaded: (data) => DropDownWidget(
                                  //         hint: "seasions",
                                  //         data: data,
                                  //         onChange: (v) {
                                  //           context.read<SeasonsBloc>().add(
                                  //               SeasonsEvent.changeItem(
                                  //                   item: v!));
                                  //           seasonsId = v.id;
                                  //         },
                                  //       ),
                                  //       itemChanged: (i, data) {
                                  //         return DropDownWidget(
                                  //           hint: "seasions",
                                  //           data: data,
                                  //           value: i,
                                  //           onChange: (v) {
                                  //             context.read<SeasonsBloc>().add(
                                  //                 SeasonsEvent.changeItem(
                                  //                     item: v!));
                                  //
                                  //             seasonsId = v.id;
                                  //           },
                                  //         );
                                  //       },
                                  //       loading: () => DropDownWidget(
                                  //         loading: false,
                                  //         hint: "",
                                  //         data: [],
                                  //         onChange: (v) {},
                                  //       ),
                                  //       orElse: () => GestureDetector(
                                  //           onTap: () => context
                                  //               .read<SeasonsBloc>()
                                  //               .add(const SeasonsEvent
                                  //                   .loadSeasons()),
                                  //           child: DropDownWidget(
                                  //             hint: "",
                                  //             data: [],
                                  //             onChange: (v) {},
                                  //           )),
                                  //     );
                                  //   },
                                  // ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const Text("Duration_of_fixing_the_offer")
                                      .tr(),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 80,
                                    child: BlocBuilder<AddEditOfferBloc,
                                            AddEditOfferState>(
                                        builder: (context, state) {
                                      return state.maybeWhen(orElse: () {
                                        return StatefulBuilder(
                                          builder: (context, setState) => Wrap(
                                            spacing:
                                                8.0, // Horizontal spacing between items
                                            runSpacing:
                                                8.0, // Vertical spacing between lines
                                            children: data.map(
                                              (option) {
                                                int index =
                                                    data.indexOf(option);
                                                return ChoiceChip(
                                                  selectedColor: AppTheme.green,
                                                  label: Text(
                                                      "${option.duration} ${option.type!}"),
                                                  selected:
                                                      selectedValue == index,
                                                  onSelected: (selected) {
                                                    setState(() {
                                                      print(index);
                                                      selectedValue = index;
                                                      durationId = option.id!;
                                                      total.text = option.price
                                                          .toString();
                                                    });
                                                  },
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        );
                                      }, loadedDurations: (data) {
                                        return StatefulBuilder(
                                          builder: (context, setState) => Wrap(
                                            spacing:
                                                8.0, // Horizontal spacing between items
                                            runSpacing:
                                                8.0, // Vertical spacing between lines
                                            children: data.map(
                                              (option) {
                                                int index =
                                                    data.indexOf(option);
                                                return ChoiceChip(
                                                  selectedColor: AppTheme.green,
                                                  label: Text(
                                                      "${option.duration} ${option.type!}"),
                                                  labelStyle: TextStyle(
                                                      color:
                                                          selectedValue == index
                                                              ? Colors.white
                                                              : Colors.black),
                                                  selected:
                                                      selectedValue == index,
                                                  onSelected: (selected) {
                                                    setState(() {
                                                      selectedValue = index;
                                                      durationId = option.id!;

                                                      total.text =
                                                          pricingEditOffers(
                                                              price:
                                                                  option.price!,
                                                              durationId:
                                                                  durationId,
                                                              information:
                                                                  information);
                                                    });
                                                  },
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        );
                                      });
                                    }),
                                  ),
                                  InputTextField(
                                      textInputAction: TextInputAction.next,
                                      inputType: TextInputType.number,
                                      label: "Bid price today".tr(),
                                      hint: "Bid price today".tr(),
                                      controller: price,
                                      validator: (value) {
                                        if (value != null &&
                                            value.isNotEmpty &&
                                            isFloat(value)) {
                                          return null;
                                        }
                                        return "please_enter_price".tr();
                                      }),
                                  const Text("total").tr(),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  TextField(
                                    enabled: false,
                                    controller: total,
                                    decoration:
                                        InputDecoration(hintText: "total".tr()),
                                  ),
                                  InputTextField(
                                      textInputAction: TextInputAction.go,
                                      //  inputType: TextInputType.number,
                                      label: "The_reason_for_the_modification"
                                          .tr(),
                                      hint: "The_reason_for_the_modification"
                                          .tr(),
                                      controller: reason,
                                      validator: (value) {
                                        if (value != null &&
                                            value.isNotEmpty &&
                                            value.length > 25) {
                                          return null;
                                        }
                                        return "The_text_is_insufficient".tr();
                                      }),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  BlocBuilder<AddEditOfferBloc,
                                      AddEditOfferState>(
                                    builder: (context, state) {
                                      return SizedBox(
                                        height: 6.h,
                                        width: double.infinity,
                                        child: TextButton(
                                          //  color: AppTheme.secondaryColor,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              if (seasonsId == null) {
                                                AlertController.show(
                                                    "",
                                                    "please_choose_seasons"
                                                        .tr(),
                                                    TypeAlert.warning);
                                                return;
                                              } else {

                                                context
                                                    .read<AddEditOfferBloc>()
                                                    .add(
                                                      AddEditOfferEvent
                                                          .editOffers(
                                                        request: OfferRequest(
                                                          specializationId: [specializationId!],


                                                          dateFinish: dateEnd,
                                                          dateStart: dateStart,
                                                          id: offer.id!,
                                                          video: video,
                                                          imagePaths:
                                                              imagesPaths,
                                                          title: nameoffer.text,
                                                          durationId:
                                                              durationId,
                                                          seasonId: seasonsId!,
                                                          description:
                                                              descriptionOffers
                                                                  .text,
                                                          reason: reason.text,
                                                          conditions:
                                                              termsOffers.text,
                                                          discount: int.parse(
                                                              percentage.text),
                                                          price: double.parse(
                                                              price.text),
                                                          image: imageFile,
                                                          total: double.parse(
                                                              total.text),
                                                        ),
                                                      ),
                                                    );
                                                return;
                                              }
                                            }
                                          },
                                          child: state.maybeWhen(
                                            orElse: () => Center(
                                              child: const Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ).tr(),
                                            ),
                                            editLoading: () =>
                                                LoadingAnimationWidget
                                                    .prograssiveDots(
                                                        color: AppTheme
                                                            .primaryColor,
                                                        size: 20.sp),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                floatingActionButton: offer.updatedId != null
                    ? BlocBuilder<AddEditOfferBloc, AddEditOfferState>(
                        builder: (context, state) {
                          return FloatingActionButton(
                            tooltip: 'Retrieve_accepted_offer_information'.tr(),
                            onPressed: () {
                              context
                                  .read<AddEditOfferBloc>()
                                  .add(AddEditOfferEvent.loadOfferDetails(
                                    id: offer.id!,
                                    path: '/offers/edit/',
                                  ));
                              images.clear();
                              imageFile.clear();
                              imagesPaths.clear();
                            },
                            child: Icon(
                              Icons.download,
                              size: 20.sp,
                            ),
                          );
                        },
                      )
                    : const SizedBox()),
          ),
        ),
      ),
    );
  }
}

String pricingEditOffers(
    {required double price,
    required int? durationId,
    required InformationEntity? information}) {
  int maxOfferChange = information?.maxOfferChange! as int ;
  int offerChangeCost = information?.offerChangeCost! as int ;
  int offerAdditionCost = information?.offerAdditionCost! as int ;
  if (maxOfferChange != 0 && durationId == null) {
    return '0';
  } else if (maxOfferChange == 0 && durationId == null) {
    return offerChangeCost.toString();
  } else if (maxOfferChange != 0 && durationId != null) {
    return price.toString();
  } else if (maxOfferChange == 0 && durationId != null) {
    return (price + offerAdditionCost!).toString();
  }

  return '';
}

List<SearchableDropdownMenuItem<T>> _mapDataToDropDownItem<T extends dynamic>(
    List<T> data) {
  return data
      .map((e) => SearchableDropdownMenuItem<T>(
          value: e, label: e.name ?? '', child: Text(e.name ?? '')))
      .toList();
}
