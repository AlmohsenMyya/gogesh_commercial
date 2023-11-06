import 'dart:io';

import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_primary_seller.dart';
import 'package:commmercial_directory_seller/presentaation/auth/location/location_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:commmercial_directory_seller/presentaation/auth/sections_bloc/sections_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/services_bloc/service_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/location_bottom_sheet.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/search_dropdown_widget.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/activity/activity_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/bloc/register_company_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/sector/sector_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/specialization/specialization_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/widget/multi_select_drop_.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/input_text_field.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:searchable_paginated_dropdown/searchable_dropdown_controller.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:sizer/sizer.dart';
import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../assets.dart';
import '../Region_bloc/region_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../city_bloc/city_bloc.dart';
import '../country_bloc/country_bloc.dart';
import '../widgets/drop_down.dart';

class FillProfileScreen extends HookWidget {
  FillProfileScreen(
      {Key? key,
      required this.email,
      required this.password,
      required this.passwordConfirmation})
      : super(key: key);
  final String email, password, passwordConfirmation;
  Gender? gender;
  int? countryId;
  int? cityId;
  int? regionId;
  String signature = "", lisence = "";
  List<String> intityCard = [];
  PhoneNumber? phoneNumber;
  List<String> sections = [];
  String? typeCompanty;

  bool hassections = false;
  List<String> servicesId = [];
  String? imageSelected;
  final _formKey = GlobalKey<FormState>();
  int? sectorId;
  int? activityId;
  final SearchableDropdownController<StandarEntity> countryController =
      SearchableDropdownController();
  final SearchableDropdownController<StandarEntity> cityController =
      SearchableDropdownController();
  final SearchableDropdownController<StandarEntity> regionController =
      SearchableDropdownController();

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    final phone = useTextEditingController();
    final lastName = useTextEditingController();
    final firstName = useTextEditingController();
    final country = useTextEditingController();
    final region = useTextEditingController();
    final city = useTextEditingController();
    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);
    if (user != null) {
      lastName.text = user.lastName ?? "";
      firstName.text = user.firstName ?? "";
    }
    countryController.addListener((p, searchKey) {
      context.read<CountryBloc>().add(CountryEvent.load(
          filter: Filter(page: p, q: searchKey, type: 'paginate')));
    });
    cityController.addListener((p, searchKey) {
      context.read<CityBloc>().add(CityEvent.load(
          filter:
              Filter(page: p, q: searchKey, id: countryId, type: 'paginate')));
    });

    regionController.addListener((p, searchKey) {
      context.read<RegionBloc>().add(
            RegionEvent.load(
              filter:
                  Filter(page: p, q: searchKey, id: cityId, type: 'paginate'),
            ),
          );
    });
    return BlocProvider(
      create: (context) =>
          LocationBloc(sl())..add(const LocationEvent.pickLocation()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  imagePicked: (image) => imageSelected = image.path,
                  // emailError: (e) => context.pop(),
                  // passworderror: (e) => context.pop(),
                  // error: (error,e) => context.pop(),
                  registered: (msg) {
                    AlertController.show("", msg!, TypeAlert.success);

                    context.goNamed(Routes.home.name);
                  });
            },
          ),
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              state.whenOrNull(
                 
                  error: (error) {
                    AlertController.show("", error.tr(), TypeAlert.error);
                  },
                  locationPicked: () {
                    SmartDialog.show(
                      backDismiss: false,
                      clickMaskDismiss: false,
                      builder: (context) => const LocationBottomSheet(),
                      alignment: Alignment.bottomCenter,
                    );
                  },
                  serviceUnEnabled: () {
                    SmartDialog.show(
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
                                        foregroundColor:
                                            AppTheme.secondaryColor),
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
                                          const LocationEvent
                                              .addEventManually());
                                      SmartDialog.dismiss();
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor:
                                            AppTheme.secondaryColor),
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
          BlocListener<CityBloc, CityState>(
            listener: (context, state) {
              state.whenOrNull(dataLoaded: (data, m) {
                cityController
                    .appendNewPage(_mapDataToDropDownItem<StandarEntity>(data));
              });
            },
          ),
          BlocListener<CountryBloc, CountryState>(
            listener: (context, state) {
              state.whenOrNull(dataLoaded: (data, m) {
                countryController
                    .appendNewPage(_mapDataToDropDownItem<StandarEntity>(data));
              });
            },
          ),
          BlocListener<RegionBloc, RegionState>(
            listener: (context, state) {
              state.whenOrNull(dataLoaded: (data, m) {
                regionController
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
                    image.forEach((element) {
                      intityCard.add(element.path);
                    });
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
            // FocusScopeNode currentFocus = FocusScope.of(context);

            // if (!currentFocus.hasPrimaryFocus) {
            //   currentFocus.unfocus();
            // }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text("fill_profile").tr(),
              leading: IconButton(
                  onPressed: () async {
                    await sl<LocalDataSource>().clear();
                    await sl<LocalDataSource>()
                        .setValue(
                          LocalDataKeys.userType,
                          UserType.onboarding,
                        )
                        .then((value) => context.goNamed(Routes.logIn.name));
                    GoogleSignIn().signOut();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputTextField(
                            label: "first_name",
                            hint: "first_name",
                            textInputAction: TextInputAction.next,
                            controller: firstName,
                            validator: firstNameValidator),
                        InputTextField(
                            label: "last_name",
                            hint: "last_name",
                            textInputAction: TextInputAction.next,
                            controller: lastName,
                            validator: lastNameValidator),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Text("phone").tr(),
                        BlocBuilder<LocationBloc, LocationState>(
                          bloc: context.read<LocationBloc>(),
                          builder: (context, state) {
                            return state.maybeWhen(
                              locationFounded:
                                  (country, city, region, dialCode) =>
                                      Directionality(
                                textDirection: TextDirection.ltr,
                                child: InternationalPhoneNumberInput(
                                  initialValue: PhoneNumber(
                                      isoCode: dialCode,
                                      phoneNumber: phone.text),
                                  hintText: "phone".tr(),
                                  onInputChanged: (PhoneNumber number) {
                                    phoneNumber = number;
                                  },
                                  errorMessage: "please_enter_valid_phone".tr(),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  textFieldController: phone,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                ),
                              ),
                              orElse: () => Directionality(
                                textDirection: TextDirection.ltr,
                                child: InternationalPhoneNumberInput(
                                  //initialValue: PhoneNumber(isoCode: "DZ"),
                                  hintText: "phone".tr(),
                                  onInputChanged: (PhoneNumber number) {
                                    phoneNumber = number;
                                  },
                                  errorMessage: "please_enter_valid_phone".tr(),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  textFieldController: phone,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.5.h,
                            ),
                            const Text("location").tr(),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            BlocBuilder<LocationBloc, LocationState>(
                              bloc: context.read<LocationBloc>(),
                              builder: (context, state) {
                                return state.maybeWhen(
                                    serviceUnEnabled: () {
                                      SmartDialog.show(
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
                                                const Expanded(
                                                    child: SizedBox()),
                                                Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () async {
                                                        Geolocator
                                                            .openLocationSettings();
                                                        SmartDialog.dismiss();
                                                        SmartDialog.show(
                                                          backDismiss: false,
                                                          clickMaskDismiss:
                                                              false,
                                                          builder: (context) =>
                                                              const LocationBottomSheet(),
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                        );
                                                      },
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          foregroundColor: AppTheme
                                                              .secondaryColor),
                                                      child: const Text(
                                                        "ok",
                                                        style: TextStyle(
                                                            color:
                                                                AppTheme.green),
                                                      ).tr(),
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                LocationBloc>()
                                                            .add(const LocationEvent
                                                                .addEventManually());
                                                        SmartDialog.dismiss();
                                                      },
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          foregroundColor: AppTheme
                                                              .secondaryColor),
                                                      child: const Text(
                                                        "no_thanks",
                                                        style: TextStyle(
                                                            color:
                                                                AppTheme.green),
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
                                    locationFounded:
                                        (county, cit, regio, dialCode) {
                                      country.text = county;
                                      city.text = cit;
                                      region.text = regio;
                                      return Column(
                                        children: [
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: country,
                                            readOnly: true,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: region,
                                            readOnly: true,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: city,
                                            readOnly: true,
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
                                    manually: () => StatefulBuilder(
                                            builder: (context, setState) {
                                          return Column(
                                            children: [
                                              //'Choose_your_country'
                                              SearchDropDownWidget<
                                                  StandarEntity>(
                                                controller: countryController,
                                                onChanged: (item) {
                                                  countryId = item?.id;
                                                  setState(
                                                    () {},
                                                  );
                                                },
                                                noRecordText:
                                                    "there_is_no_section",
                                                hint:
                                                    'Choose_your_country'.tr(),
                                                // title: "Commercial_sector".tr(),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              SearchDropDownWidget<
                                                  StandarEntity>(
                                                controller: cityController,
                                                onChanged: (item) {
                                                  cityId = item?.id;
                                                  setState(
                                                    () {},
                                                  );
                                                },
                                                isEnabled: countryId != null,
                                                noRecordText:
                                                    "there_is_no_section",
                                                hint: 'Choose_your_city'.tr(),
                                                // title: "Commercial_sector".tr(),
                                              ),

                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              SearchDropDownWidget<
                                                  StandarEntity>(
                                                controller: regionController,
                                                onChanged: (item) {
                                                  regionId = item?.id;
                                                },
                                                isEnabled: cityId != null,
                                                noRecordText:
                                                    "there_is_no_section",
                                                hint: "choose_your_region".tr(),
                                                // title: "Commercial_sector".tr(),
                                              ),
                                            ],
                                          );
                                        }),
                                    orElse: () => const SizedBox());
                              },
                            ),
                            SizedBox(
                              height: 2.h,
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
                                        borderRadius:
                                            BorderRadius.circular(0.5.h)),
                                  ),
                                  Expanded(
                                    child: const Text(
                                            "i_agree_to_the_terms_and_conditions_and_privacy_policy")
                                        .tr(),
                                  )
                                ],
                              );
                            }),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: custombuttom(
                                onTap: () async {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }

                                  if (country.text.isEmpty &&
                                      countryId == null) {
                                    AlertController.show(
                                        "",
                                        "please_choose_ِcountry".tr(),
                                        TypeAlert.warning);
                                    return;
                                  }

                                  if (city.text.isEmpty && cityId == null) {
                                    AlertController.show(
                                        "",
                                        "please_choose_city".tr(),
                                        TypeAlert.warning);
                                    return;
                                  }

                                  if (region.text.isEmpty && regionId == null) {
                                    AlertController.show(
                                        "",
                                        "please_enter_region".tr(),
                                        TypeAlert.warning);
                                    return;
                                  }

                                  if (_formKey.currentState!.validate() &&
                                      // gender != null &&
                                      isChecked!) {
                                    if (user == null) {
                                      context.pushNamed(
                                        Routes.registerSellerScreen.name,
                                        extra: RegisterPrimarySeller(
                                          fcmToken: await firebaseMessaging
                                              .getToken(),
                                          password: password,
                                          passwordConfirmation: password,
                                          phone:
                                              "${phoneNumber?.isoCode}-${phoneNumber?.dialCode}-${phone.text.replaceAll(" ", "")}",
                                          lastname: lastName.text,
                                          firstname: firstName.text,
                                          country: country.text,
                                          email: email,
                                          city: city.text,
                                          region: region.text,
                                          countryId: countryId,
                                          regionId: regionId,
                                          cityId: cityId,
                                        ),
                                      );
                                    } else {
                                      context.pushNamed(
                                        Routes.registerSellerScreen.name,
                                        extra: RegisterPrimarySeller(
                                          fcmToken: await firebaseMessaging
                                              .getToken(),
                                          phone:
                                              "${phoneNumber?.isoCode}-${phoneNumber?.dialCode}-${phone.text.replaceAll(" ", "")}",
                                          lastname: lastName.text,
                                          firstname: firstName.text,
                                          country: country.text,
                                          city: city.text,
                                          region: region.text,
                                          countryId: countryId,
                                          regionId: regionId,
                                          cityId: cityId,
                                        ),
                                      );
                                    }
                                    sl<LocalDataSource>().setValue(
                                        LocalDataKeys.role,
                                        TypeSeller.admin.name);
                                  } else if (gender == null) {
                                    AlertController.show(
                                        "",
                                        "Choose_the_gender".tr(),
                                        TypeAlert.warning);
                                    return;
                                  } else if (!isChecked!) {
                                    AlertController.show(
                                        "",
                                        "agree to the terms and conditions"
                                            .tr(),
                                        TypeAlert.warning);
                                  }
                                },
                                child: BlocBuilder<AuthBloc, AuthState>(
                                  buildWhen: (previous, current) =>
                                      current.maybeWhen(
                                    orElse: () => false,
                                    registered: (s) => true,
                                    error: (error, e) => true,
                                    loading: () => true,
                                  ),
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () => const Text("sing_up").tr(),
                                      loading: () => LoadingAnimationWidget
                                          .prograssiveDots(
                                              color: AppTheme.primaryColor,
                                              size: 20.sp),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
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
