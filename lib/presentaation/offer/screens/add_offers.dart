import 'dart:io';

import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/durations_entity/durations_response.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/search_dropdown_widget.dart';
import 'package:commmercial_directory_seller/presentaation/offer/add_edit_offer/add_edit_offer_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/network_error_widget.dart';
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
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';
import 'package:video_player/video_player.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/error_widget.dart'
    as error_widget;
import '../../../app/theme.dart';
import '../../../domain/request/offers/offer_request.dart';
import '../../auth/widgets/drop_down.dart';
import '../../register_company/activity/activity_bloc.dart';
import '../../register_company/seasons/seasons_bloc.dart';
import '../../register_company/sector/sector_bloc.dart';
import '../../register_company/specialization/specialization_bloc.dart';
import '../../widgets/costume_button.dart';
import '../../widgets/input_text_field.dart';

List<StandarEntity> selectedItemsSeasons = [];
List<StandarEntity> selectedItemsSpesialities = [];

class AddOffers extends HookWidget {
  AddOffers({super.key});
  int? seasonsId;
  int? sectorId;
  int? specializationId;
  int? durationId;
  List<String> imagesUpload = [];
  int? activityId;
  bool isCheck = false;
  int selectedValue = -1;
  List<DurationsEntity> data = [
    const DurationsEntity(id: 2, type: 'يوم', duration: 3, price: 100),
    const DurationsEntity(id: 2, type: 'شهر', duration: 2, price: 102),
    const DurationsEntity(id: 3, type: 'عام', duration: 1, price: 101)
  ];
  final _formKey = GlobalKey<FormState>();
  String? video;
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
    final seasons = useTextEditingController();

    DateTime? start;
    DateTime? end;
    String? dateStart;
    String? dateEnd;
    InformationEntity? information =
        sl<LocalDataSource>().getValue(LocalDataKeys.infoamationPackage);
    if (information != null && information.maxOffers == 0) {
      total.text = information.offerAdditionCost.toString();
    }
    seasonsController.addListener((p, searchKey) {
      context.read<SeasonsBloc>().add(SeasonsEvent.loadSeasons(
          filter: Filter(page: p, q: searchKey, type: 'paginate')));
    });
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => SectorBloc(getSectorsUseCase: sl())
        //     ..add(SectorEvent.load(filter: Filter(page: 1))),
        // ),
        // BlocProvider(
        //     create: (context) => ActivityBloc(getActivityUseCase: sl())),
        // BlocProvider(
        //     create: (context) =>
        //         SpecializationBloc(getSpesialityUseCase: sl())),
        // BlocProvider(
        //     create: (context) => SeasonsBloc(getSeasonsUseCase: sl())
        //       ..add(const SeasonsEvent.loadSeasons())),
        BlocProvider(
          create: (context) => AddEditOfferBloc(
              getDurationsUseCase: sl(), addOffersUseCase: sl())
            ..add(
              const AddEditOfferEvent.loadDurations(),
            ),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AddEditOfferBloc, AddEditOfferState>(
            listener: (context, state) {
              state.maybeWhen(
                succes: (msg) {
                  AlertController.show(
                      "", "offer_added".tr(), TypeAlert.success);
                  context.pop();
                },
                orElse: () {},
                error: (error) {
                  AlertController.show("", error!.tr(), TypeAlert.error);
                },
                removeAndUploadedImage: (images) {
                  imagesUpload.clear();
                  images.isEmpty
                      ? AlertController.show("",
                          "Please_enter_attachments".tr(), TypeAlert.warning)
                      : images.length < 3 || images.length > 3
                          ? AlertController.show(
                              "",
                              "Please_enter _ three_attachments".tr(),
                              TypeAlert.warning)
                          : imagesUpload.addAll(
                              [images[0].path, images[1].path, images[2].path]);
                },
                loadedVideo: (image) {
                  video = image;
                },
                imagePicked: (image) {
                  imagesUpload.clear();
                  image.isEmpty
                      ? AlertController.show("",
                          "Please_enter_attachments".tr(), TypeAlert.warning)
                      : image.length < 3 || image.length > 3
                          ? AlertController.show(
                              "",
                              "Please_enter _ three_attachments".tr(),
                              TypeAlert.warning)
                          : imagesUpload.addAll(
                              [image[0].path, image[1].path, image[2].path]);
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
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("new offer").tr(),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
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
                            BlocBuilder<AddEditOfferBloc, AddEditOfferState>(
                              buildWhen: (previous, current) {
                                return current.maybeWhen(
                                    orElse: () => false,
                                    imagePicked: (file) => true,
                                    removeAndUploadedImage: (file) => true);
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
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(20)),
                                            border: Border.all(
                                                color: Colors.black26)),
                                        child: const Center(
                                          child: Icon(Icons.image),
                                        ),
                                      ),
                                    ],
                                  ),
                                  removeAndUploadedImage: (images) => images
                                              .length ==
                                          1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("//${imagesUpload.length}/3"),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<AddEditOfferBloc>()
                                                    .add(AddEditOfferEvent
                                                        .removeAndUploadImage(
                                                      source:
                                                          ImageSource.gallery,
                                                      path: images[0].path,
                                                      images: images,
                                                    ));
                                              },
                                              child: Center(
                                                child: Image.file(
                                                  File(images[0].path),
                                                  fit: BoxFit.contain,
                                                  height: 30.h,
                                                  width: 20.h,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("${imagesUpload.length}/3"),
                                            SizedBox(
                                              height: 30.h,
                                              width: double.infinity,
                                              child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: images.length,
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                  width: 2.h,
                                                ),
                                                itemBuilder: (context, index) =>
                                                    GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                            AddEditOfferBloc>()
                                                        .add(AddEditOfferEvent
                                                            .removeAndUploadImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          path: images[index]
                                                              .path,
                                                          images: images,
                                                        ));
                                                  },
                                                  child: Image.file(
                                                    File(images[index].path),
                                                    fit: BoxFit.contain,
                                                    height: 30.h,
                                                    width: 20.h,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                  imagePicked: (image) => image.length == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("${image.length}/3"),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<AddEditOfferBloc>()
                                                    .add(const AddEditOfferEvent
                                                            .uploadImage(
                                                        source: ImageSource
                                                            .gallery));
                                              },
                                              child: Center(
                                                child: Image.file(
                                                  File(image[0].path),
                                                  fit: BoxFit.contain,
                                                  height: 30.h,
                                                  width: 20.h,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("${image.length}/3"),
                                            SizedBox(
                                              height: 30.h,
                                              width: double.infinity,
                                              child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: image.length,
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                  width: 2.h,
                                                ),
                                                itemBuilder: (context, index) =>
                                                    GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                            AddEditOfferBloc>()
                                                        .add(AddEditOfferEvent
                                                            .removeAndUploadImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          path:
                                                              image[index].path,
                                                          images: image,
                                                        ));
                                                  },
                                                  child: Image.file(
                                                    File(image[index].path),
                                                    fit: BoxFit.contain,
                                                    height: 30.h,
                                                    width: 20.h,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                );
                              },
                            ),
                            BlocBuilder<AddEditOfferBloc, AddEditOfferState>(
                              builder: (context, state) {
                                return Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: GestureDetector(
                                    onTap: () => context
                                        .read<AddEditOfferBloc>()
                                        .add(
                                          const AddEditOfferEvent.uploadImage(
                                              source: ImageSource.gallery),
                                        ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 33, 39, 229),
                                          borderRadius: BorderRadius.circular(
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
                            BlocBuilder<AddEditOfferBloc, AddEditOfferState>(
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
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(20)),
                                              border: Border.all(
                                                  color: Colors.black26)),
                                          child: const Center(
                                            child: Icon(Icons.video_collection),
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
                            BlocBuilder<AddEditOfferBloc, AddEditOfferState>(
                              builder: (context, state) {
                                return Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: GestureDetector(
                                    onTap: () => context
                                        .read<AddEditOfferBloc>()
                                        .add(
                                          const AddEditOfferEvent.uploadVideo(
                                              source: ImageSource.gallery),
                                        ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 33, 39, 229),
                                          borderRadius: BorderRadius.circular(
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
                            // maxLines: 5,
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
                            //  maxLines: 5,
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
                                firstDate: DateTime(DateTime.now().day),
                                background: Colors.transparent,
                                theme: ThemeData(
                                  primaryColor: AppTheme.green,
                                  dialogBackgroundColor: Colors.purple[50],
                                  textTheme: const TextTheme(
                                    bodyLarge: TextStyle(color: AppTheme.green),
                                    bodySmall: TextStyle(color: AppTheme.green),
                                  ),
                                  disabledColor: Colors.orange,
                                ),
                              );

                              if (start != null &&
                                  start.toString() != dateStart) {
                                setState(
                                  () {
                                    dateStart = DateFormat('yyyy-MM-dd', 'en')
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
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xffcbcbcb))),
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
                                firstDate: DateTime(DateTime.now().day),
                                background: Colors.transparent,
                                theme: ThemeData(
                                  primaryColor: AppTheme.green,
                                  dialogBackgroundColor: Colors.purple[50],
                                  textTheme: const TextTheme(
                                    bodyLarge: TextStyle(color: AppTheme.green),
                                    bodySmall: TextStyle(color: AppTheme.green),
                                  ),
                                  disabledColor: Colors.orange,
                                ),
                              );

                              if (end != null && end.toString() != dateEnd) {
                                setState(
                                  () {
                                    dateEnd = DateFormat('yyyy-MM-dd', 'en')
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
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xffcbcbcb))),
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
                            suffixIcon: const Icon(
                              Icons.monetization_on_outlined,
                              color: AppTheme.green,
                            ),
                            label: "المدة بالساعات".tr(),
                            hint: "المدة بالساعات".tr(),
                            controller: price,
                            validator: (value) {
                              // if (value != null &&
                              //     value.isNotEmpty &&
                              //     isFloat(value)) {
                              //   return null;
                              // }
                              // return "please_enter_price".tr();
                            }),
                        InputTextField(
                            textInputAction: TextInputAction.next,
                            inputType: TextInputType.number,
                            suffixIcon: const Icon(
                              Icons.monetization_on_outlined,
                              color: AppTheme.green,
                            ),
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

                        InputTextField(
                            textInputAction: TextInputAction.next,
                            inputType: TextInputType.number,
                            label: "discount_percentage".tr(),
                            hint: "discount_percentage".tr(),
                            suffixIcon: const Icon(
                              Icons.percent,
                              color: AppTheme.green,
                            ),
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
                              return "please_enter_discount_percentage".tr();
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
                          onChanged: (item) {
                            seasonsId = item?.id;
                          },
                          noRecordText: "there_is_no_seasons",
                          hint: "seasion".tr(),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),

                        const Text("Duration_of_fixing_the_offer").tr(),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        BlocBuilder<AddEditOfferBloc, AddEditOfferState>(
                            buildWhen: (previous, current) => current.maybeWhen(
                                  orElse: () => false,
                                  loadedDurations: (data) => true,
                                ),
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
                                        int index = data.indexOf(option);
                                        return ChoiceChip(
                                          selectedColor: AppTheme.green,
                                          label: Text(
                                              "${option.duration} ${option.type!}"),
                                          selected: selectedValue == index,
                                          onSelected: (selected) {
                                            setState(() {
                                              selectedValue = index;
                                              durationId = option.id!;
                                              total.text = pricingAddOffers(
                                                      price: option.price!,
                                                      durationId: durationId,
                                                      information:
                                                          information) ??
                                                  "0";
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
                                        int index = data.indexOf(option);
                                        return ChoiceChip(
                                          selectedColor: AppTheme.green,
                                          label: Text(
                                              "${option.duration} ${option.type!}"),
                                          selected: selectedValue == index,
                                          onSelected: (selected) {
                                            setState(() {
                                              double price;
                                              selectedValue = index;
                                              durationId = option.id!;
                                              total.text = pricingAddOffers(
                                                      price: option.price!,
                                                      durationId: durationId,
                                                      information:
                                                          information) ??
                                                  '0';
                                            });
                                          },
                                        );
                                      },
                                    ).toList(),
                                  ),
                                );
                              });
                            }),
                        // ),
                        const Text("total").tr(),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        TextField(
                          enabled: false,
                          controller: total,
                          decoration: InputDecoration(
                            hintText: "total".tr(),
                            suffixIcon: const Icon(
                              Iconsax.money_send,
                              color: AppTheme.green,
                            ),
                          ),
                        ),
                        // InputTextField(
                        //     textInputAction: TextInputAction.none,
                        //     label: "total".tr(),
                        //     hint: "total".tr(),
                        //     controller: total,
                        //     validator: (value) {}),
                        SizedBox(
                          height: 2.h,
                        ),
                        BlocBuilder<AddEditOfferBloc, AddEditOfferState>(
                          builder: (context, state) {
                            return SizedBox(
                              height: 6.h,
                              width: double.infinity,
                              child: custombuttom(
                                color: AppTheme.secondaryColor,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (imagesUpload.isEmpty) {
                                      AlertController.show(
                                          "",
                                          "Please_enter_attachments".tr(),
                                          TypeAlert.warning);
                                    } else if (seasonsId == null) {
                                      AlertController.show(
                                          "",
                                          "please_choose_seasons".tr(),
                                          TypeAlert.warning);
                                    } else {
                                      context.read<AddEditOfferBloc>().add(
                                            AddEditOfferEvent.addOffer(
                                              request: OfferRequest(
                                                dateFinish: dateEnd,
                                                dateStart: dateStart,
                                                title: nameoffer.text,
                                                durationId: durationId,
                                                seasonId: seasonsId!,
                                                video: video,
                                                description:
                                                    descriptionOffers.text,
                                                conditions: termsOffers.text,
                                                discount:
                                                    int.parse(percentage.text),
                                                price: double.parse(price.text),
                                                image: imagesUpload,
                                                total: total.text.isEmpty
                                                    ? 0
                                                    : double.parse(total.text),
                                              ),
                                            ),
                                          );
                                    }
                                  }
                                },
                                child: state.maybeWhen(
                                  orElse: () => Center(
                                    child: const Text(
                                      "Save",
                                      style: TextStyle(color: Colors.white),
                                    ).tr(),
                                  ),
                                  loading: () =>
                                      LoadingAnimationWidget.prograssiveDots(
                                          color: AppTheme.primaryColor,
                                          size: 20.sp),
                                ),
                              ),
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

String? pricingAddOffers(
    {required double price,
    required int? durationId,
    required InformationEntity? information}) {
  if (information?.maxOffers != 0 && durationId == null) {
    return '0';
  } else if (information?.maxOffers == 0 && durationId == null) {
    return information?.offerAdditionCost.toString();
  } else if (information?.maxOffers != 0 && durationId != null) {
    return price.toString();
  } else if (information?.maxOffers == 0 && durationId != null) {
    return (price + information!.offerAdditionCost!).toString();
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
