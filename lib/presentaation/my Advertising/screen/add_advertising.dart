import 'dart:io';

import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/places_entity/places_response.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:commmercial_directory_seller/domain/request/ads/ads_request.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/drop_down.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/add_edit_ads/advertising_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/places/places_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/my%20Advertising/widget/drop_down_ads.dart';
import 'package:commmercial_directory_seller/presentaation/offer/add_edit_offer/add_edit_offer_bloc.dart';
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
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../app/theme.dart';
import '../../auth/city_bloc/city_bloc.dart';
import '../../widgets/costume_button.dart';
import '../../widgets/input_text_field.dart';

class AddAdvertising extends HookWidget {
  AddAdvertising({super.key});
  String images = '';
  Places? placeName;
  int? sectorId;
  double? priceDay;
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
          create: (context) =>
              PlacesBloc(getPlacesUseCase: sl())..add(const PlacesEvent.load()),
        ),
        BlocProvider(
          create: (context) => SectorBloc(getSectorsUseCase: sl())
            ..add( SectorEvent.load(filter: Filter(page: 1))),
        ),
        BlocProvider(
          create: (context) => AddEditAdsBloc(addAdsUseCase: sl()),
        )
      ],
      child: BlocListener<AddEditAdsBloc, AddEditAdsState>(
        listener: (context, state) {
          state.maybeWhen(
            succes: (msg) {
              AlertController.show(
                  "", "Your_ad_has_been_added".tr(), TypeAlert.success);
              context.pop();
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
              title: const Text("Add an advertisement").tr(),
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
                                    onTap: () =>
                                        context.read<AddEditAdsBloc>().add(
                                              const AddEditAdsEvent.uploadImage(
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
                        Text("Choose the location of the advertisement".tr()),
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
                                              hint: 'Choose_your_place_ads',
                                              data: data,
                                              value: i,
                                              onChange: (v) {
                                                context
                                                    .read<PlacesBloc>()
                                                    .add(PlacesEvent.changeItem(
                                                      item: v!,
                                                    ));
                                                priceDay = v.price;
                                                placeName = v.place;
                                                total.text = pricingPlaces(
                                                    information: information,
                                                    place: placeName!,
                                                    priceDay: priceDay!,
                                                    duration:
                                                        duration.text.isEmpty
                                                            ? 0
                                                            : int.parse(
                                                                duration.text));
                                              },
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            const Text("Commercial_sector")
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
                                                    itemChanged: (i, data) {
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
                                                                .add(SectorEvent
                                                                    .changeItem(
                                                                        item:
                                                                            v!));
                                                          },
                                                        ));
                                              },
                                            ),
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
                                                  if (isFloat(value) &&
                                                      value != '0') {
                                                    // double priceTotal;
                                                    // priceTotal =
                                                    //     int.parse(value) *
                                                    //         priceDay!;
                                                    total.text = pricingPlaces(
                                                        information:
                                                            information,
                                                        place: placeName!,
                                                        priceDay: priceDay!,
                                                        duration: duration
                                                                .text.isEmpty
                                                            ? 0
                                                            : int.parse(
                                                                duration.text));
                                                  }
                                                },
                                                validator: (value) {}),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            DropDownAdsWidget(
                                              hint: 'Choose_your_place_ads',
                                              data: data,
                                              value: i,
                                              onChange: (v) {
                                                context
                                                    .read<PlacesBloc>()
                                                    .add(PlacesEvent.changeItem(
                                                      item: v!,
                                                    ));
                                                placeName = v.place;
                                                priceDay = v.price;
                                                total.text = pricingPlaces(
                                                    information: information,
                                                    place: placeName!,
                                                    priceDay: priceDay!,
                                                    duration:
                                                        duration.text.isEmpty
                                                            ? 0
                                                            : int.parse(
                                                                duration.text));
                                              },
                                            ),
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
                                                  if (isFloat(value) &&
                                                      value != '0') {
                                                    double priceTotal;
                                                    priceTotal =
                                                        int.parse(value) *
                                                            priceDay!;
                                                    total.text = pricingPlaces(
                                                      information: information,
                                                      place: placeName!,
                                                      priceDay: priceDay!,
                                                      duration: duration
                                                              .text.isEmpty
                                                          ? 0
                                                          : int.parse(
                                                              duration.text),
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
                                        context.read<PlacesBloc>().add(
                                            PlacesEvent.changeItem(item: v!));
                                      },
                                    ),
                                orElse: () => DropDownAdsWidget(
                                      hint: 'Choose_your_place_ads',
                                      data: [],
                                      onChange: (v) {
                                        context.read<PlacesBloc>().add(
                                            PlacesEvent.changeItem(item: v!));
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
                          return StatefulBuilder(builder: (context, setState) {
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
                                    dialogBackgroundColor: Colors.purple[50],
                                    textTheme: const TextTheme(
                                      bodyLarge:
                                          TextStyle(color: AppTheme.green),
                                      bodySmall:
                                          TextStyle(color: AppTheme.green),
                                    ),
                                    disabledColor: Colors.orange,
                                  ),
                                );

                                if (newDateTime != null
                                // && newDateTime.toString() != dateStart
                                ) {
                                  setState(
                                    () {
                                      dateStart = DateFormat('yyyy-MM-dd', 'en')
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
                                          ? "Announcement start date"
                                          : dateStart!,
                                      style: const TextStyle(
                                        color: Color(0xffcecece),
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
                        SizedBox(
                          height: 2.h,
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
                                          "Please_choose_location_your_ad".tr(),
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
                                                duration:
                                                    int.parse(duration.text),
                                                description:
                                                    descriptionAds.text,
                                                price: double.parse(price.text),
                                                images: images,
                                                total: total.text.isEmpty
                                                    ? 0
                                                    : double.parse(total.text),
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
                                  loading: () =>
                                      LoadingAnimationWidget.prograssiveDots(
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String pricingPlaces(
    {required Places place,
    required double priceDay,
    required int duration,
    required InformationEntity? information}) {
  if (place != Places.Sectors_Baner && place != Places.Notification) {
    return calculateOthersPricing(
        priceDay: priceDay,
        place: place,
        duration: duration,
        information: information);
  }
  if (place == Places.Sectors_Baner) {
    return calculateSectorsPricing(
        priceDay: priceDay, duration: duration, information: information);
  }
  if (place == Places.Notification) {
    return calculateNotificationPricing(
        priceDay: priceDay, duration: duration, information: information);
  }

  return '0';
}

calculateNotificationPricing(
    {required double priceDay,
    required int duration,
    required InformationEntity? information}) {
  int notificationCost = information?.notificationCost! as int ;
  int maxAdsPerNotification = information?.maxAdsPerNotification! as int ;
  if (maxAdsPerNotification != 0) {
    return '0';
  }
  return (duration * priceDay + notificationCost).toString();
}

calculateSectorsPricing(
    {required double priceDay,
    required int duration,
    required InformationEntity? information}) {
  int maxAdsViaSectorBanner = information?.maxAdsViaSectorBanner! as int ;
  if (maxAdsViaSectorBanner != 0) {
    return '0';
  }
  int notificationCost = information?.notificationCost! as int ;
  //ToDo replace notification cost par sectorbanner cost
  return (duration * priceDay + notificationCost).toString();
}

calculateOthersPricing(
    {required double priceDay,
    required Places place,
    required int duration,
    required InformationEntity? information}) {
  int maxFreeAds = information?.maxFreeAds! as int ;
  int adsDiscount = information?.adsDiscount! as int ;
  int offerAdditionCost = information?.offerAdditionCost! as int ;
  if (maxFreeAds != 0 && place == Places.Ads_Screen) {
    return '0';
  }
  if (maxFreeAds == 0 &&
      place == Places.Ads_Screen &&
     adsDiscount != 0) {
    return (duration * priceDay * adsDiscount / 100).toString();
  }
  if (place != Places.Ads_Screen) {
    return (duration * priceDay + offerAdditionCost).toString();
  }
}
  
 // if (information!.maxFreeAds != 0 &&
  //     place != 'Sectors_Baner' &&
  //     place != 'Notification') {
  //   return '0';
  // } else if (information.maxFreeAds == 0 &&
  //     place != 'Sectors_Baner' &&
  //     place != 'Notification') {
  //   if (information.adsDiscount != 0 && place == 'ads_screen') {
  //     return (duration * priceDay / information.adsDiscount!).toString();
  //   }
  //   //ToDo replace offerAdditionCost cost par AdsAdditionCost

  //   return information.offerAdditionCost.toString();
  // } else if (information.maxAdsViaSectorBanner != 0 &&
  //     place == 'Sectors_Baner') {
  //   return '0';
  // } else if (information.maxAdsViaSectorBanner == 0 &&
  //     place == 'Sectors_Baner') {
  //   //ToDo replace notification cost par sectorbanner cost
  //   return (duration * information.notificationCost!).toString();
  // } else if (information.maxAdsPerNotification != 0 &&
  //     place == 'Notification') {
  //   return '0';
  // } else if (information.maxAdsViaSectorBanner == 0 &&
  //     place == 'Notification') {
  //   return (duration * information.notificationCost!).toString();
  // }