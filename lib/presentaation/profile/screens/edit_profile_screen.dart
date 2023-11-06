import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_profile_request.dart';
import 'package:commmercial_directory_seller/presentaation/auth/Region_bloc/region_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/city_bloc/city_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/country_bloc/country_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/location/location_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/location_bottom_sheet.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/search_dropdown_widget.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:searchable_paginated_dropdown/searchable_dropdown_controller.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../app/theme.dart';
import '../../widgets/input_text_field.dart';
import '../bloc/profile_bloc.dart';

final _formKey = GlobalKey<FormState>();
int? countryId;
int? cityId;
int? regionId;
PhoneNumber? phoneNumber;

class EditProfileScreen extends HookWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final SearchableDropdownController<StandarEntity> countryControllerpage =
      SearchableDropdownController();
  final SearchableDropdownController<StandarEntity> cityControllerpage =
      SearchableDropdownController();
  final SearchableDropdownController<StandarEntity> regionControllerpage =
      SearchableDropdownController();
  @override
  Widget build(BuildContext context) {
    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);

    final regionController = useTextEditingController(text: user?.region);
    final cityController = useTextEditingController(text: user?.city);
    final countryController = useTextEditingController(text: user?.country);
    final emailController = useTextEditingController();
    final phoneController =
        useTextEditingController(text: user?.phone?.split("-")[2]);
    final lastName = useTextEditingController(text: user?.lastName);
    final firstName = useTextEditingController(text: user?.firstName);
    final isoCode = useTextEditingController(text: user?.phone?.split("-")[0]);

    countryControllerpage.addListener((p, searchKey) {
      context.read<CountryBloc>().add(CountryEvent.load(
          filter: Filter(page: p, q: searchKey, type: 'paginate')));
    });
    cityControllerpage.addListener((p, searchKey) {
      context.read<CityBloc>().add(CityEvent.load(
          filter:
              Filter(page: p, q: searchKey, id: countryId, type: 'paginate')));
    });

    regionControllerpage.addListener((p, searchKey) {
      context.read<RegionBloc>().add(
            RegionEvent.load(
              filter:
                  Filter(page: p, q: searchKey, id: cityId, type: 'paginate'),
            ),
          );
    });
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              succes: () {
                AlertController.show("", "msg", TypeAlert.success);

                context.pop();
              },
              loadedDetailsProfile: (value) {
                // cityController.text = value.data.city ?? '';
                // countryController.text = value.data.country ?? '';
                // regionController.text = value.data.region ?? '';
                // lastName.text = value.data.lastName ?? '';
                // firstName.text = value.data.firstName ?? "";
                // phoneController.text = value.data.phone ?? '';
                // isoCode = phoneController.text.split("-")[0];
                // phoneController.text = phoneController.text.split("-")[2];
              },
            );
          },
        ),
        BlocListener<CityBloc, CityState>(
          listener: (context, state) {
            state.whenOrNull(dataLoaded: (data, m) {
              cityControllerpage
                  .appendNewPage(_mapDataToDropDownItem<StandarEntity>(data));
            });
          },
        ),
        BlocListener<CountryBloc, CountryState>(
          listener: (context, state) {
            state.whenOrNull(dataLoaded: (data, m) {
              countryControllerpage
                  .appendNewPage(_mapDataToDropDownItem<StandarEntity>(data));
            });
          },
        ),
        BlocListener<RegionBloc, RegionState>(
          listener: (context, state) {
            state.whenOrNull(dataLoaded: (data, m) {
              regionControllerpage
                  .appendNewPage(_mapDataToDropDownItem<StandarEntity>(data));
            });
          },
        ),
        BlocListener<LocationBloc, LocationState>(
          listener: (context, state) {
            state.whenOrNull(error: (error) {
              AlertController.show("", error.tr(), TypeAlert.error);
            }, locationPicked: () {
              SmartDialog.show(
                backDismiss: true,
                clickMaskDismiss: true,
                builder: (context) => const LocationBottomSheet(),
                alignment: Alignment.bottomCenter,
              );
            }, locationFounded: (country, city, region, dialCode) {
              countryController.text = country;
              cityController.text = city;
              regionController.text = region;
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
                                      const LocationBottomSheet(isLatLon: true),
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
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("edit_profile").tr(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
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
                          builder: (context, state) {
                            return state.maybeWhen(
                              locationFounded:
                                  (country, city, region, dialCode) =>
                                      Directionality(
                                textDirection: TextDirection.ltr,
                                child: InternationalPhoneNumberInput(
                                  initialValue: PhoneNumber(
                                      isoCode: user?.phone?.split("-")[0],
                                      phoneNumber:
                                          user?.phone?.split("-")[2] ?? ""),
                                  hintText: "phone".tr(),
                                  onInputChanged: (PhoneNumber number) {
                                    phoneNumber = number;
                                  },
                                  errorMessage: "please_enter_valid_phone".tr(),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  textFieldController: phoneController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                ),
                              ),
                              orElse: () => Directionality(
                                textDirection: TextDirection.ltr,
                                child: InternationalPhoneNumberInput(
                                  initialValue: PhoneNumber(
                                      isoCode: isoCode.text,
                                      phoneNumber: phoneController.text),
                                  hintText: "phone".tr(),
                                  onInputChanged: (PhoneNumber number) {
                                    phoneNumber = number;
                                  },
                                  errorMessage: "please_enter_valid_phone".tr(),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  textFieldController: phoneController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                ),
                              ),
                            );
                          },
                        ),
                        BlocBuilder<LocationBloc, LocationState>(
                          //bloc: context.read<LocationBloc>(),
                          builder: (context, state) {
                            return state.maybeWhen(
                                locationFounded:
                                    (county, cit, regio, dialCode) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: countryController,
                                        readOnly: true,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: regionController,
                                        readOnly: true,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: cityController,
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
                                          SearchDropDownWidget<StandarEntity>(
                                            controller: countryControllerpage,
                                            onChanged: (item) {
                                              countryId = item?.id;
                                              setState(
                                                () {},
                                              );
                                            },
                                            noRecordText: "there_is_no_section",
                                            hint: 'Choose_your_country'.tr(),
                                            // title: "Commercial_sector".tr(),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          SearchDropDownWidget<StandarEntity>(
                                            controller: cityControllerpage,
                                            onChanged: (item) {
                                              cityId = item?.id;
                                              setState(
                                                () {},
                                              );
                                            },
                                            isEnabled: countryId != null,
                                            noRecordText: "there_is_no_section",
                                            hint: 'Choose_your_city'.tr(),
                                            // title: "Commercial_sector".tr(),
                                          ),

                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          SearchDropDownWidget<StandarEntity>(
                                            controller: regionControllerpage,
                                            onChanged: (item) {
                                              regionId = item?.id;
                                            },
                                            isEnabled: cityId != null,
                                            noRecordText: "there_is_no_section",
                                            hint: "choose_your_region".tr(),
                                            // title: "Commercial_sector".tr(),
                                          ),
                                        ],
                                      );
                                    }),
                                orElse: () => Column(
                                      children: [
                                        InputTextField(
                                            label: "country".tr(),
                                            hint: "country".tr(),
                                            readOnly: true,
                                            controller: countryController,
                                            validator: (value) {}),
                                        InputTextField(
                                            label: "city".tr(),
                                            hint: "city".tr(),
                                            readOnly: true,
                                            controller: cityController,
                                            validator: (value) {}),
                                        InputTextField(
                                            label: "region".tr(),
                                            hint: "region".tr(),
                                            readOnly: true,
                                            controller: regionController,
                                            validator: (value) {}),
                                      ],
                                    ));
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        SmartDialog.show(
                          backDismiss: true,
                          clickMaskDismiss: true,
                          builder: (context) => const LocationBottomSheet(),
                          alignment: Alignment.bottomCenter,
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppTheme.green,
                      ),
                      child: const Text("update_location").tr(),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (previous, current) {
                      return current.maybeWhen(
                        orElse: () => true,
                        loading: () => false,
                      );
                    },
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: custombuttom(
                          onTap: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            if (countryController.text.isEmpty &&
                                countryId == null) {
                              AlertController.show(
                                  "",
                                  "please_choose_ِcountry".tr(),
                                  TypeAlert.warning);
                              return;
                            }

                            if (cityController.text.isEmpty && cityId == null) {
                              AlertController.show("",
                                  "please_choose_city".tr(), TypeAlert.warning);
                              return;
                            }

                            if (regionController.text.isEmpty &&
                                regionId == null) {
                              AlertController.show(
                                  "",
                                  "please_enter_region".tr(),
                                  TypeAlert.warning);
                              return;
                            }
                            if (_formKey.currentState!.validate()) {
                              context.pushNamed(Routes.completeeditProfile.name,
                                  extra: EditProfileRequest(
                                    city: cityController.text,
                                    cityId: cityId,
                                    country: countryController.text,
                                    region: regionController.text,
                                    phone:
                                        "${phoneNumber?.isoCode}-${phoneNumber?.dialCode}-${phoneController.text.replaceAll(" ", "")}",
                                    countryId: countryId,
                                    regionId: regionId,
                                  ));
                            }
                          },
                          child: const Text("next").tr(),
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
