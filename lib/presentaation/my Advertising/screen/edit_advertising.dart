import 'dart:io';

import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/places_entity/places_response.dart';
import 'package:commmercial_directory_seller/domain/request/ads/ads_request.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/drop_down.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/add_edit_ads/advertising_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/places/places_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/screen/add_advertising.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/widget/drop_down_ads.dart';
import 'package:commmercial_directory_seller/presentaation/offer/add_edit_offer/add_edit_offer_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/offer/widgets/skelton_widget_shimmer.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/sector/sector_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:pinput/pinput.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../app/theme.dart';
import '../../widgets/costume_button.dart';
import '../../widgets/input_text_field.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';

class EditAdvertising extends HookWidget {
  EditAdvertising({required this.id, super.key});
  final int? id;
  String images = '';
  Places? placeName;
  int? sectorId;
  double? priceDay;
  String? status;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final nameAds = useTextEditingController();
    final descriptionAds = useTextEditingController();
    final duration = useTextEditingController();
    DateTime? newDateTime;
    String? dateStart;
    final price = useTextEditingController();
    final total = useTextEditingController();
    InformationEntity? information =
        sl<LocalDataSource>().getValue(LocalDataKeys.infoamationPackage);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlacesBloc(getPlacesUseCase: sl()),
        ),
        BlocProvider(
          create: (context) => AddEditAdsBloc(
            getAdsDetailsUseCase: sl(),
            editAdsUseCase: sl(),
          )..add(
              AddEditAdsEvent.loadAdsDetails(id: id!, path: '/seller/ads/'),
            ),
        ),
        BlocProvider(
          create: (context) => SectorBloc(getSectorsUseCase: sl())
            ..add( SectorEvent.load(filter: Filter(page: 1))),
        ),
      ],
      child: BlocListener<AddEditAdsBloc, AddEditAdsState>(
        listener: (context, state) {
          state.maybeWhen(
            succes: (msg) {
              AlertController.show(
                  "", "Your_ad_has_been_modified".tr(), TypeAlert.success);
              context.pop();
            },
            dataLoaded: (ads) {
              price.text = ads.price.toString();
              nameAds.text = ads.title!;
              duration.text = ads.duration.toString();
              descriptionAds.text = ads.description!;
              placeName = ads.place;
              total.text = ads.total.toString();
              dateStart = ads.dateStart!;
              images = ads.images!;
            },
            orElse: () {},
            error: (error) {
              AlertController.show("", error!.tr(), TypeAlert.error);
            },
            imagePicked: (image) {
              image.path.isEmpty
                  ? AlertController.show(
                      "", "Please_enter_attachments".tr(), TypeAlert.warning)
                  : images = image.path;
            },
          );
        },
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
              title: const Text("edit an advertisement").tr(),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(2.h),
                  child: BlocBuilder<AddEditAdsBloc, AddEditAdsState>(
                    buildWhen: (previous, current) {
                      return current.maybeWhen(
                        orElse: () => false,
                        dataLoaded: (data) => true,
                        loading: () => true,
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Advertisement image",
                                style: TextStyle(fontSize: 14.sp),
                              ).tr(),
                              SizedBox(
                                height: 1.h,
                              ),
                              Stack(
                                children: [
                                  BlocBuilder<AddEditAdsBloc, AddEditAdsState>(
                                    buildWhen: (previous, current) {
                                      return current.maybeWhen(
                                          orElse: () => false,
                                          imagePicked: (file) => true);
                                    },
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("0/1"),
                                            Container(
                                              height: 20.h,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
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
                                                      color: Colors.black26)),
                                              child: const Center(
                                                child: Icon(Icons.image),
                                              ),
                                            ),
                                          ],
                                        ),
                                        imagePicked: (image) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("1/1"),
                                            Center(
                                              child: Image.file(
                                                File(image.path),
                                                fit: BoxFit.contain,
                                                height: 30.h,
                                                width: 20.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  BlocBuilder<AddEditAdsBloc, AddEditAdsState>(
                                    builder: (context, state) {
                                      return Positioned(
                                        bottom: 0,
                                        left: 0.h,
                                        child: GestureDetector(
                                          onTap: () => context
                                              .read<AddEditAdsBloc>()
                                              .add(
                                                const AddEditAdsEvent
                                                        .uploadImage(
                                                    source:
                                                        ImageSource.gallery),
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
                                label: "Ad name".tr(),
                                hint: "Ad name".tr(),
                                controller: nameAds,
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
                                  label: "Ad details".tr(),
                                  hint: "Write the offer details".tr(),
                                  controller: descriptionAds,
                                  validator: (value) {
                                    if (value != null &&
                                        value.isNotEmpty &&
                                        value.length >= 20) {
                                      return null;
                                    } else if (value!.length < 20) {
                                      return "description_in insufficient".tr();
                                    }
                                    return "please_enter_description".tr();
                                  }),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text("Choose the location of the advertisement"
                                  .tr()),
                              SizedBox(
                                height: 1.h,
                              ),
                              BlocBuilder<PlacesBloc, PlacesState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                      dataLoaded: (e) {
                                        return DropDownAdsWidget(
                                          hint: 'Choose_your_place_ads',
                                          data: e,
                                          onChange: (v) {
                                            context
                                                .read<PlacesBloc>()
                                                .add(PlacesEvent.changeItem(
                                                  item: v!,
                                                ));
                                            priceDay = v.price;
                                            placeName = v.place;
                                          },
                                        );
                                      },
                                      initial: () {
                                        return DropDownAdsWidget(
                                          hint: 'Choose_your_place_ads',
                                          data: [],
                                          onChange: (v) {},
                                        );
                                      },
                                      itemChanged: (i, data) {
                                        return i.place == Places.Sector_Flash ||
                                                i.place == Places.Sector_Baner
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  DropDownAdsWidget(
                                                    hint:
                                                        'Choose_your_place_ads',
                                                    data: data,
                                                    value: i,
                                                    onChange: (v) {
                                                      context
                                                          .read<PlacesBloc>()
                                                          .add(PlacesEvent
                                                              .changeItem(
                                                            item: v!,
                                                          ));
                                                      priceDay = v.price;
                                                      placeName = v.place;

                                                      double priceTotal;
                                                      priceTotal = int.parse(
                                                              duration.text) *
                                                          priceDay!;
                                                      total.text =
                                                          priceTotal.toString();
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  const Text(
                                                          "Commercial_sector")
                                                      .tr(),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  BlocBuilder<SectorBloc,
                                                      SectorState>(
                                                    builder: (context, state) {
                                                      return state.maybeWhen(
                                                          dataLoaded: (e, m) {
                                                            return DropDownWidget(
                                                              hint:
                                                                  "Commercial_sector",
                                                              data: e,
                                                              onChange: (v) {
                                                                context
                                                                    .read<
                                                                        SectorBloc>()
                                                                    .add(SectorEvent
                                                                        .changeItem(
                                                                            item:
                                                                                v!));

                                                                sectorId = v.id;
                                                              },
                                                            );
                                                          },
                                                          initial: () {
                                                            return DropDownWidget(
                                                              hint:
                                                                  "Commercial_sector",
                                                              data: [],
                                                              onChange: (v) {
                                                                context
                                                                    .read<
                                                                        SectorBloc>()
                                                                    .add(SectorEvent
                                                                        .changeItem(
                                                                            item:
                                                                                v!));
                                                              },
                                                            );
                                                          },
                                                          itemChanged:
                                                              (i, data) {
                                                            return DropDownWidget(
                                                              hint:
                                                                  "Commercial_sector",
                                                              data: data,
                                                              value: i,
                                                              onChange: (v) {
                                                                context
                                                                    .read<
                                                                        SectorBloc>()
                                                                    .add(SectorEvent
                                                                        .changeItem(
                                                                            item:
                                                                                v!));

                                                                sectorId = i.id;
                                                              },
                                                            );
                                                          },
                                                          loading: () =>
                                                              DropDownWidget(
                                                                loading: true,
                                                                hint:
                                                                    "Commercial_sector",
                                                                data: [],
                                                                onChange: (v) {
                                                                  // context.read<SectorBloc>().add(
                                                                  //     SectorEvent.changeItem(item: v!));
                                                                },
                                                              ),
                                                          orElse: () =>
                                                              DropDownWidget(
                                                                hint:
                                                                    "Commercial_sector",
                                                                data: [],
                                                                onChange: (v) {
                                                                  context
                                                                      .read<
                                                                          SectorBloc>()
                                                                      .add(SectorEvent.changeItem(
                                                                          item:
                                                                              v!));
                                                                },
                                                              ));
                                                    },
                                                  ),
                                                ],
                                              )
                                            : DropDownAdsWidget(
                                                hint: 'Choose_your_place_ads',
                                                data: data,
                                                value: i,
                                                onChange: (v) {
                                                  context
                                                      .read<PlacesBloc>()
                                                      .add(PlacesEvent
                                                          .changeItem(
                                                        item: v!,
                                                      ));
                                                  placeName = v.place;

                                                  priceDay = v.price;
                                                  double priceTotal;
                                                  priceTotal =
                                                      int.parse(duration.text) *
                                                          priceDay!;
                                                  total.text =
                                                      priceTotal.toString();
                                                },
                                              );
                                      },
                                      loading: () => DropDownAdsWidget(
                                            loading: true,
                                            hint: 'Choose_your_place_ads',
                                            data: [],
                                            onChange: (v) {
                                              // context.read<PlacesBloc>().add(
                                              //     CityEvent.changeItem(item: v!));
                                            },
                                          ),
                                      orElse: () => DropDownAdsWidget(
                                            hint: 'Choose_your_place_ads',
                                            data: [],
                                            onChange: (v) {
                                              // context.read<PlacesBloc>().add(
                                              //     CityEvent.changeItem(item: v!));
                                            },
                                          ));
                                },
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Text("Announcement start date",
                                      style: TextStyle(fontSize: 16))
                                  .tr(),
                              SizedBox(
                                height: 1.h,
                              ),
                              Builder(builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return GestureDetector(
                                    onTap: () async {
                                      newDateTime = await showRoundedDatePicker(
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

                                      if (newDateTime != null &&
                                          newDateTime.toString() != dateStart) {
                                        setState(
                                          () {
                                            dateStart =
                                                DateFormat('yyyy-MM-dd', 'en')
                                                    .format(newDateTime!);
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
                                              color: const Color(0xffcbcbcb))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dateStart == null
                                                ? "Announcement start date"
                                                : dateStart!,
                                            style: const TextStyle(
                                              color: Colors.black,
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
                                });
                              }),
                              InputTextField(
                                  textInputAction: TextInputAction.next,
                                  inputType: TextInputType.number,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      'day',
                                      style: TextStyle(
                                        color: AppTheme.green,
                                      ),
                                    ).tr(),
                                  ),
                                  label:
                                      "The number of days of the announcement"
                                          .tr(),
                                  hint: "The number of days of the announcement"
                                      .tr(),
                                  controller: duration,
                                  onChanged: (value) {
                                    if (isFloat(value)) {
                                      double priceTotal;
                                      priceTotal = int.parse(value) * priceDay!;
                                      total.text = priceTotal.toString();
                                    }
                                  },
                                  validator: (value) {}),
                              InputTextField(
                                  textInputAction: TextInputAction.next,
                                  inputType: TextInputType.number,
                                  label: "your_ad_price".tr(),
                                  hint: "your_ad_price".tr(),
                                  controller: price,
                                  suffixIcon: const Icon(
                                    Iconsax.money,
                                    color: AppTheme.green,
                                  ),
                                  validator: (value) {
                                    if (value != null &&
                                        value.isNotEmpty &&
                                        isFloat(value)) {
                                      return null;
                                    }
                                    return "please_enter_price".tr();
                                  }),
                              InputTextField(
                                  readOnly: true,
                                  textInputAction: TextInputAction.none,
                                  label: "total".tr(),
                                  hint: "total".tr(),
                                  suffixIcon: const Icon(
                                    Iconsax.money_send,
                                    color: AppTheme.green,
                                  ),
                                  controller: total,
                                  validator: (value) {}),
                              SizedBox(
                                height: 2.h,
                              ),
                              BlocBuilder<AddEditAdsBloc, AddEditAdsState>(
                                builder: (context, state) {
                                  return SizedBox(
                                    height: 6.h,
                                    width: double.infinity,
                                    child: custombuttom(
                                      color: AppTheme.secondaryColor,
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          if (images.isEmpty) {
                                            AlertController.show(
                                                "",
                                                "Please_enter_attachments".tr(),
                                                TypeAlert.warning);
                                            return;
                                          } else if (placeName == null) {
                                            AlertController.show(
                                                "",
                                                "Please_choose_location_your_ad"
                                                    .tr(),
                                                TypeAlert.warning);
                                            return;
                                          } else if (dateStart == null) {
                                            AlertController.show(
                                                "",
                                                "Please_select_a_launch_date_for_your_ad"
                                                    .tr(),
                                                TypeAlert.warning);
                                            return;
                                          } else {
                                            context.read<AddEditAdsBloc>().add(
                                                  AddEditAdsEvent.addAds(
                                                    request: AdsRequest(
                                                      title: nameAds.text,
                                                      dateStart: dateStart!,
                                                      place: placeName!.name,
                                                      duration: int.parse(
                                                          duration.text),
                                                      description:
                                                          descriptionAds.text,
                                                      price: double.parse(
                                                          price.text),
                                                      images: images,
                                                      total: total.text.isEmpty
                                                          ? 0
                                                          : double.parse(
                                                              total.text),
                                                    ),
                                                  ),
                                                );

                                            return;
                                          }
                                        }
                                      },
                                      child: state.maybeWhen(
                                        orElse: () => const Text(
                                          "Save",
                                          style: TextStyle(color: Colors.white),
                                        ).tr(),
                                        loading: () => LoadingAnimationWidget
                                            .prograssiveDots(
                                          color: AppTheme.primaryColor,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        loading: () => Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade50,
                          child: const NewWidget(),
                        ),
                        dataLoaded: (ads) => Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Advertisement image",
                                style: TextStyle(fontSize: 14.sp),
                              ).tr(),
                              SizedBox(
                                height: 1.h,
                              ),
                              Stack(
                                children: [
                                  BlocBuilder<AddEditAdsBloc, AddEditAdsState>(
                                    buildWhen: (previous, current) {
                                      return current.maybeWhen(
                                        orElse: () => false,
                                        imagePicked: (file) => true,
                                        dataLoaded: (ads) => true,
                                      );
                                    },
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("0/1"),
                                            Container(
                                              height: 20.h,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
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
                                                      color: Colors.black26)),
                                              child: const Center(
                                                child: Icon(Icons.image),
                                              ),
                                            ),
                                          ],
                                        ),
                                        dataLoaded: (ads) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("1/1"),
                                            Center(
                                              child: Image.network(
                                                ads.images!,
                                                fit: BoxFit.contain,
                                                height: 20.h,
                                                width: 20.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                        imagePicked: (image) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("1/1"),
                                            Center(
                                              child: Image.file(
                                                File(image.path),
                                                fit: BoxFit.contain,
                                                height: 30.h,
                                                width: 20.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  BlocBuilder<AddEditAdsBloc, AddEditAdsState>(
                                    builder: (context, state) {
                                      return Positioned(
                                        bottom: 0,
                                        left: 0.h,
                                        child: GestureDetector(
                                          onTap: () => context
                                              .read<AddEditAdsBloc>()
                                              .add(
                                                const AddEditAdsEvent
                                                        .uploadImage(
                                                    source:
                                                        ImageSource.gallery),
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
                                label: "Ad name".tr(),
                                hint: "Ad name".tr(),
                                controller: nameAds,
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

                                  return "please_enter_Name_ads".tr();
                                },
                              ),
                              InputTextField(
                                  textInputAction: TextInputAction.next,
                                  label: "Ad details".tr(),
                                  hint: "Write the offer details".tr(),
                                  controller: descriptionAds,
                                  validator: (value) {
                                    if (value != null &&
                                        value.isNotEmpty &&
                                        value.length >= 20) {
                                      return null;
                                    } else if (value!.length < 20) {
                                      return "description_in insufficient".tr();
                                    }
                                    return "please_enter_description".tr();
                                  }),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text("Choose the location of the advertisement"
                                  .tr()),
                              SizedBox(
                                height: 1.h,
                              ),
                              BlocBuilder<PlacesBloc, PlacesState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                      dataLoaded: (e) {
                                        return DropDownAdsWidget(
                                          hint: 'Choose_your_place_ads',
                                          data: e,
                                          onChange: (v) {
                                            context
                                                .read<PlacesBloc>()
                                                .add(PlacesEvent.changeItem(
                                                  item: v!,
                                                ));
                                            priceDay = v.price;
                                            placeName = v.place!;
                                          },
                                        );
                                      },
                                      initial: () {
                                        return Column(
                                          children: [
                                            InitialWidget(
                                              hint: placeName!.name,
                                              onTap: () {
                                                context.read<PlacesBloc>().add(
                                                    const PlacesEvent.load());
                                              },
                                            ),
                                            placeName == Places.Sector_Baner ||
                                                    placeName ==
                                                        Places.Sector_Flash
                                                ? Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      const Text(
                                                              "Commercial_sector")
                                                          .tr(),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      InitialWidget(
                                                        hint: 'hint',
                                                        onTap: () {},
                                                      )
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            InputTextField(
                                                textInputAction:
                                                    TextInputAction.next,
                                                inputType: TextInputType.number,
                                                suffixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: const Text(
                                                    'day',
                                                    style: TextStyle(
                                                      color: AppTheme.green,
                                                    ),
                                                  ).tr(),
                                                ),
                                                label:
                                                    "The number of days of the announcement"
                                                        .tr(),
                                                hint:
                                                    "The number of days of the announcement"
                                                        .tr(),
                                                controller: duration,
                                                onChanged: (value) {
                                                  if (isFloat(value)) {
                                                    double priceTotal;
                                                    priceTotal =
                                                        int.parse(value) *
                                                            priceDay!;
                                                    total.text =
                                                        priceTotal.toString();
                                                  }
                                                },
                                                validator: (value) {}),
                                          ],
                                        );
                                      },
                                      itemChanged: (i, data) {
                                        return i.place == Places.Sector_Flash ||
                                                i.place == Places.Sector_Baner
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  DropDownAdsWidget(
                                                    hint:
                                                        'Choose_your_place_ads',
                                                    data: data,
                                                    value: i,
                                                    onChange: (v) {
                                                      context
                                                          .read<PlacesBloc>()
                                                          .add(PlacesEvent
                                                              .changeItem(
                                                            item: v!,
                                                          ));
                                                      priceDay = v.price;
                                                      placeName = v.place;
                                                      total.text = pricingPlaces(
                                                          information:
                                                              information,
                                                          place: placeName!,
                                                          priceDay: priceDay!,
                                                          duration: duration
                                                                  .text.isEmpty
                                                              ? 0
                                                              : int.parse(
                                                                  duration
                                                                      .text));
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  const Text(
                                                          "Commercial_sector")
                                                      .tr(),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  BlocBuilder<SectorBloc,
                                                      SectorState>(
                                                    builder: (context, state) {
                                                      return state.maybeWhen(
                                                          dataLoaded: (e, m) {
                                                            return DropDownWidget(
                                                              hint:
                                                                  "Commercial_sector",
                                                              data: e,
                                                              onChange: (v) {
                                                                context
                                                                    .read<
                                                                        SectorBloc>()
                                                                    .add(SectorEvent
                                                                        .changeItem(
                                                                            item:
                                                                                v!));

                                                                sectorId = v.id;
                                                              },
                                                            );
                                                          },
                                                          initial: () {
                                                            return DropDownWidget(
                                                              hint:
                                                                  "Commercial_sector",
                                                              data: [],
                                                              onChange: (v) {
                                                                context
                                                                    .read<
                                                                        SectorBloc>()
                                                                    .add(SectorEvent
                                                                        .changeItem(
                                                                            item:
                                                                                v!));
                                                              },
                                                            );
                                                          },
                                                          itemChanged:
                                                              (i, data) {
                                                            return DropDownWidget(
                                                              hint:
                                                                  "Commercial_sector",
                                                              data: data,
                                                              value: i,
                                                              onChange: (v) {
                                                                context
                                                                    .read<
                                                                        SectorBloc>()
                                                                    .add(SectorEvent
                                                                        .changeItem(
                                                                            item:
                                                                                v!));

                                                                sectorId = i.id;
                                                              },
                                                            );
                                                          },
                                                          loading: () =>
                                                              DropDownWidget(
                                                                loading: true,
                                                                hint:
                                                                    "Commercial_sector",
                                                                data: [],
                                                                onChange: (v) {
                                                                  // context.read<SectorBloc>().add(
                                                                  //     SectorEvent.changeItem(item: v!));
                                                                },
                                                              ),
                                                          orElse: () =>
                                                              DropDownWidget(
                                                                hint:
                                                                    "Commercial_sector",
                                                                data: [],
                                                                onChange: (v) {
                                                                  context
                                                                      .read<
                                                                          SectorBloc>()
                                                                      .add(SectorEvent.changeItem(
                                                                          item:
                                                                              v!));
                                                                },
                                                              ));
                                                    },
                                                  ),
                                                  InputTextField(
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      inputType:
                                                          TextInputType.number,
                                                      suffixIcon: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: const Text(
                                                          'day',
                                                          style: TextStyle(
                                                            color:
                                                                AppTheme.green,
                                                          ),
                                                        ).tr(),
                                                      ),
                                                      label:
                                                          "The number of days of the announcement"
                                                              .tr(),
                                                      hint:
                                                          "The number of days of the announcement"
                                                              .tr(),
                                                      controller: duration,
                                                      onChanged: (value) {
                                                        if (isFloat(value) &&
                                                            value != '0') {
                                                          total.text = pricingPlaces(
                                                              information:
                                                                  information,
                                                              place: placeName!,
                                                              priceDay:
                                                                  priceDay!,
                                                              duration: duration
                                                                      .text
                                                                      .isEmpty
                                                                  ? 0
                                                                  : int.parse(
                                                                      duration
                                                                          .text));
                                                        }
                                                      },
                                                      validator: (value) {}),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  DropDownAdsWidget(
                                                    hint:
                                                        'Choose_your_place_ads',
                                                    data: data,
                                                    value: i,
                                                    onChange: (v) {
                                                      context
                                                          .read<PlacesBloc>()
                                                          .add(PlacesEvent
                                                              .changeItem(
                                                            item: v!,
                                                          ));
                                                      placeName = v.place;

                                                      priceDay = v.price;

                                                      total.text = pricingPlaces(
                                                          information:
                                                              information,
                                                          place: placeName!,
                                                          priceDay: priceDay!,
                                                          duration: duration
                                                                  .text.isEmpty
                                                              ? 0
                                                              : int.parse(
                                                                  duration
                                                                      .text));
                                                    },
                                                  ),
                                                  InputTextField(
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      inputType:
                                                          TextInputType.number,
                                                      suffixIcon: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: const Text(
                                                          'day',
                                                          style: TextStyle(
                                                            color:
                                                                AppTheme.green,
                                                          ),
                                                        ).tr(),
                                                      ),
                                                      label:
                                                          "The number of days of the announcement"
                                                              .tr(),
                                                      hint:
                                                          "The number of days of the announcement"
                                                              .tr(),
                                                      controller: duration,
                                                      onChanged: (value) {
                                                        if (isFloat(value) &&
                                                            value != '0') {
                                                          double priceTotal;
                                                          priceTotal =
                                                              int.parse(value) *
                                                                  priceDay!;
                                                          total.text =
                                                              pricingPlaces(
                                                            information:
                                                                information,
                                                            place: placeName!,
                                                            priceDay: priceDay!,
                                                            duration: duration
                                                                    .text
                                                                    .isEmpty
                                                                ? 0
                                                                : int.parse(
                                                                    duration
                                                                        .text),
                                                          );
                                                        }
                                                      },
                                                      validator: (value) {}),
                                                ],
                                              );
                                      },
                                      loading: () => DropDownAdsWidget(
                                            loading: true,
                                            hint: 'Choose_your_place_ads',
                                            data: [],
                                            onChange: (v) {
                                              // context.read<PlacesBloc>().add(
                                              //     CityEvent.changeItem(item: v!));
                                            },
                                          ),
                                      orElse: () => DropDownAdsWidget(
                                            hint: 'Choose_your_place_ads',
                                            data: [],
                                            onChange: (v) {
                                              // context.read<PlacesBloc>().add(
                                              //     CityEvent.changeItem(item: v!));
                                            },
                                          ));
                                },
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Text("Announcement start date",
                                      style: TextStyle(fontSize: 16))
                                  .tr(),
                              SizedBox(
                                height: 1.h,
                              ),
                              Builder(builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return GestureDetector(
                                    onTap: () async {
                                      newDateTime = await showRoundedDatePicker(
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

                                      if (newDateTime != null &&
                                          newDateTime.toString() != dateStart) {
                                        setState(
                                          () {
                                            dateStart =
                                                DateFormat('yyyy-MM-dd', 'en')
                                                    .format(newDateTime!);
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
                                              color: const Color(0xffcbcbcb))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dateStart == null
                                                ? "Announcement start date"
                                                : dateStart!,
                                            style: const TextStyle(
                                              color: Colors.black,
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
                                });
                              }),
                              // InputTextField(
                              //     textInputAction: TextInputAction.next,
                              //     inputType: TextInputType.number,
                              //     suffixIcon: Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: const Text(
                              //         'day',
                              //         style: TextStyle(
                              //           color: AppTheme.green,
                              //         ),
                              //       ).tr(),
                              //     ),
                              //     label:
                              //         "The number of days of the announcement"
                              //             .tr(),
                              //     hint: "The number of days of the announcement"
                              //         .tr(),
                              //     controller: duration,
                              //     onChanged: (value) {
                              //       if (isFloat(value)) {
                              //         double priceTotal;
                              //         priceTotal = int.parse(value) * priceDay!;
                              //         total.text = priceTotal.toString();
                              //       }
                              //     },
                              //     validator: (value) {}),
                              InputTextField(
                                  textInputAction: TextInputAction.next,
                                  inputType: TextInputType.number,
                                  label: "your_ad_price".tr(),
                                  hint: "your_ad_price".tr(),
                                  controller: price,
                                  suffixIcon: const Icon(
                                    Iconsax.money,
                                    color: AppTheme.green,
                                  ),
                                  validator: (value) {
                                    if (value != null &&
                                        value.isNotEmpty &&
                                        isFloat(value)) {
                                      return null;
                                    }
                                    return "please_enter_price".tr();
                                  }),
                              InputTextField(
                                  readOnly: true,
                                  textInputAction: TextInputAction.none,
                                  label: "total".tr(),
                                  hint: "total".tr(),
                                  suffixIcon: const Icon(
                                    Iconsax.money_send,
                                    color: AppTheme.green,
                                  ),
                                  controller: total,
                                  validator: (value) {}),
                              SizedBox(
                                height: 2.h,
                              ),
                              BlocBuilder<AddEditAdsBloc, AddEditAdsState>(
                                builder: (context, state) {
                                  return SizedBox(
                                    height: 6.h,
                                    width: double.infinity,
                                    child: custombuttom(
                                      color: AppTheme.secondaryColor,
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          if (images.isEmpty) {
                                            AlertController.show(
                                                "",
                                                "Please_enter_attachments".tr(),
                                                TypeAlert.warning);
                                            return;
                                          } else if (placeName == null) {
                                            AlertController.show(
                                                "",
                                                "Please_choose_location_your_ad"
                                                    .tr(),
                                                TypeAlert.warning);
                                            return;
                                          } else if (dateStart == null) {
                                            AlertController.show(
                                                "",
                                                "Please_select_a_launch_date_for_your_ad"
                                                    .tr(),
                                                TypeAlert.warning);
                                            return;
                                          } else {
                                            context.read<AddEditAdsBloc>().add(
                                                  AddEditAdsEvent.editAds(
                                                    request: AdsRequest(
                                                      title: nameAds.text,
                                                      dateStart: dateStart!,
                                                      place: placeName!.name,
                                                      duration: int.parse(
                                                          duration.text),
                                                      description:
                                                          descriptionAds.text,
                                                      price: double.parse(
                                                          price.text),
                                                      images: images,
                                                      total: total.text.isEmpty
                                                          ? 0
                                                          : double.parse(
                                                              total.text),
                                                    ),
                                                  ),
                                                );

                                            return;
                                          }
                                        }
                                      },
                                      child: state.maybeWhen(
                                        orElse: () => const Text(
                                          "Save",
                                          style: TextStyle(color: Colors.white),
                                        ).tr(),
                                        loadingEdit: () =>
                                            LoadingAnimationWidget
                                                .prograssiveDots(
                                          color: AppTheme.primaryColor,
                                          size: 20.sp,
                                        ),
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
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerWidget(
          height: 3.h,
          width: 15.h,
          raduis: 1.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 20.h,
          width: double.infinity,
          raduis: 4.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 3.h,
          width: 15.h,
          raduis: 1.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 6.h,
          width: double.infinity,
          raduis: 1.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 3.h,
          width: 15.h,
          raduis: 1.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 6.h,
          width: double.infinity,
          raduis: 1.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 3.h,
          width: 15.h,
          raduis: 1.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 6.h,
          width: double.infinity,
          raduis: 1.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 3.h,
          width: 15.h,
          raduis: 1.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 6.h,
          width: double.infinity,
          raduis: 1.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        ShimmerWidget(
          height: 6.h,
          width: double.infinity,
          raduis: 2.h,
        ),
      ],
    );
  }
}

class InitialWidget extends StatelessWidget {
  const InitialWidget({
    super.key,
    required this.hint,
    required this.onTap,
  });
  final void Function()? onTap;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 14, right: 14),
        height: 6.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.black26),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hint,
              style: TextStyle(
                fontSize: 14.sp,
                // fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
