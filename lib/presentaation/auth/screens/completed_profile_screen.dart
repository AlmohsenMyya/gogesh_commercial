import 'dart:io';

import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_primary_seller.dart';
import 'package:commmercial_directory_seller/presentaation/auth/location/location_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/screens/login_screen.dart';
import 'package:commmercial_directory_seller/presentaation/auth/sections_bloc/sections_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/services_bloc/service_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/auth/widgets/location_bottom_sheet.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/widget/multi_select_drop_.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
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

Gender? gender;
int? countryId;
int? cityId;
int? regionId;
List<String> servicesId = [];
List<String> sections = [];

PhoneNumber? phoneNumber;
String? imageSelected;
final _formKey = GlobalKey<FormState>();
bool hassections = false;

class CompleteProfileScreen extends HookWidget {
  CompleteProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '', firstname = '', lastname = '';

    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);
    if (user != null) {
      email = user.email ?? "";
      lastname = user.lastName ?? "";
      firstname = user.firstName ?? "";
    }
    bool isChecked = false;
    MultiSelectController? controller;
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    final phone = useTextEditingController();
    final lastName = useTextEditingController(text: lastname);
    final firstName = useTextEditingController(text: firstname);
    final country = useTextEditingController();
    final region = useTextEditingController();
    final city = useTextEditingController();

   // context.read<LocationBloc>().add(const LocationEvent.pickLocation());
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => ServiceBloc(getServicesUseCase: sl())
        //     ..add(const ServiceEvent.load(page: 1)),
        // ),
        BlocProvider(create: (context) => SectionsBloc(sl())),
        BlocProvider(
          create: (context) => CityBloc(getCityUseCase: sl()),
        ),
        BlocProvider(
            create: (context) => CountryBloc(getCountryUseCase: sl())
              ..add( CountryEvent.load(filter: Filter()))),
        BlocProvider(create: (context) => RegionBloc(getRegionUseCase: sl()))
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (error, errorState) {
                  print('ojoi,v,,,,,,,,,,v,');
                },
                profileCompleted: () {
                  context.goNamed(Routes.home.name);
                },
              );
            },
          ),
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
                                  showModalBottomSheet(
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      useSafeArea: true,
                                      shape: const OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (context) =>
                                          const LocationBottomSheet());
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
        child: WillPopScope(
          onWillPop: () async {
            await sl<LocalDataSource>().clear();
            await sl<LocalDataSource>()
                .setValue(
                  LocalDataKeys.userType,
                  UserType.onboarding,
                )
                .then((value) => context.goNamed(Routes.logIn.name));
            GoogleSignIn().signOut();

            return true;
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
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            BlocBuilder<AuthBloc, AuthState>(
                              buildWhen: (previous, current) {
                                return current.maybeWhen(
                                    orElse: () => false,
                                    imagePicked: (file) => true);
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
                                  imagePicked: (image) => Container(
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
                                  context.read<AuthBloc>().add(
                                      const AuthEvent.uploadImage(
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
                          height: 5.h,
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration:
                                InputDecoration(hintText: "first_name".tr()),
                            controller: firstName,
                            validator: firstNameValidator),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration:
                              InputDecoration(hintText: "last_name".tr()),
                          controller: lastName,
                          validator: lastNameValidator,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: InternationalPhoneNumberInput(
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
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputBorder: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Column(
                          children: [
                            // Builder(builder: (context) {
                            //   return StatefulBuilder(
                            //       builder: (context, setstate) {
                            //     return BlocBuilder<ServiceBloc, ServiceState>(
                            //       builder: (context, state) {
                            //         return state.maybeWhen(
                            //           dataLoaded: (data) => Column(
                            //             children: [
                            //               MultiDropDown(
                            //                 selectionType: SelectionType.single,
                            //                 selectedOptions: [],
                            //                 controller: controller,
                            //                 onOptionSelected: (value) {
                            //                   var list =
                            //                       value.first.value!.split(" ");
                            //                   String id = list.first;

                            //                   hassections = list.last == "true"
                            //                       ? true
                            //                       : false;
                            //                   if (hassections == true) {
                            //                     context
                            //                         .read<SectionsBloc>()
                            //                         .add(SectionsEvent.load(
                            //                             id: int.parse(id)));
                            //                   }
                            //                   servicesId.clear();
                            //                   // value.forEach((element) {
                            //                   servicesId.add(id);

                            //                   setstate(
                            //                     () {},
                            //                   );
                            //                   // });
                            //                 },
                            //                 data: data
                            //                     .map((e) => ValueItem(
                            //                         label: e.name ?? '',
                            //                         value:
                            //                             "${e.id} ${e.hasSections}"))
                            //                     .toList(),
                            //                 hint: "I'am provide".tr(),
                            //               ),
                            //               if (hassections == true)
                            //                 Column(
                            //                   children: [
                            //                     SizedBox(
                            //                       height: 1.5.h,
                            //                     ),
                            //                     BlocBuilder<SectionsBloc,
                            //                         SectionsState>(
                            //                       builder: (context, state) {
                            //                         return state.maybeWhen(
                            //                             loading: () =>
                            //                                 GestureDetector(
                            //                                   // onTap: () => context
                            //                                   //     .read<
                            //                                   //         ServiceBloc>()
                            //                                   //     .add(const ServiceEvent
                            //                                   //         .load()),
                            //                                   child: Container(
                            //                                     height: 6.h,
                            //                                     width: double
                            //                                         .infinity,
                            //                                     decoration:
                            //                                         BoxDecoration(
                            //                                       border: Border.all(
                            //                                           color: Colors
                            //                                               .black26),
                            //                                       borderRadius:
                            //                                           BorderRadius
                            //                                               .circular(
                            //                                                   1.h),
                            //                                     ),
                            //                                     child: Center(
                            //                                       child: SizedBox(
                            //                                           height:
                            //                                               2.h,
                            //                                           width:
                            //                                               2.h,
                            //                                           child:
                            //                                               const CircularProgressIndicator()),
                            //                                     ),
                            //                                   ),
                            //                                 ),
                            //                             dataLoaded: (data) =>
                            //                                 MultiDropDown(
                            //                                   selectionType:
                            //                                       SelectionType
                            //                                           .multi,
                            //                                   selectedOptions: [],
                            //                                   controller:
                            //                                       controller,
                            //                                   onOptionSelected:
                            //                                       (value) {
                            //                                     sections
                            //                                         .clear();
                            //                                     value.forEach(
                            //                                         (element) {
                            //                                       sections.add(
                            //                                           element
                            //                                               .value!);
                            //                                     });
                            //                                   },
                            //                                   data: data
                            //                                       .map((e) => ValueItem(
                            //                                           label:
                            //                                               e.name ??
                            //                                                   '',
                            //                                           value:
                            //                                               "${e.id}"))
                            //                                       .toList(),
                            //                                   hint:
                            //                                       "Subservices"
                            //                                           .tr(),
                            //                                 ),
                            //                             orElse: () =>
                            //                                 const SizedBox());
                            //                       },
                            //                     ),
                            //                   ],
                            //                 )
                            //               else
                            //                 const SizedBox(),
                            //             ],
                            //           ),
                            //           loading: () => GestureDetector(
                            //             // onTap: () => context
                            //             //     .read<ServiceBloc>()
                            //             //     .add(const ServiceEvent.load()),
                            //             child: Container(
                            //               height: 6.h,
                            //               width: double.infinity,
                            //               decoration: BoxDecoration(
                            //                 border: Border.all(
                            //                     color: Colors.black26),
                            //                 borderRadius:
                            //                     BorderRadius.circular(1.h),
                            //               ),
                            //               child: Center(
                            //                 child: SizedBox(
                            //                     height: 2.h,
                            //                     width: 2.h,
                            //                     child:
                            //                         const CircularProgressIndicator()),
                            //               ),
                            //             ),
                            //           ),
                            //           orElse: () => GestureDetector(
                            //               onTap: () => context
                            //                   .read<ServiceBloc>()
                            //                   .add(const ServiceEvent.load(page: 1)),
                            //               child: Container(
                            //                 height: 5.h,
                            //                 width: double.infinity,
                            //                 decoration: BoxDecoration(
                            //                     border: Border.all(
                            //                         color: Colors.black26),
                            //                     borderRadius:
                            //                         BorderRadius.circular(1.h)),
                            //               )),
                            //         );
                            //       },
                            //     );
                            //   });
                            // }),
                          
                          
                            SizedBox(
                              height: 2.h,
                            ),
                            BlocBuilder<LocationBloc, LocationState>(
                              builder: (context, state) {
                                return state.maybeWhen(
                                    loadingLocation: () => const Center(
                                          child: SizedBox(
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 1)),
                                        ),
                                    locationFounded: (county, cit, regio,dialCode) {
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
                                    manually: () => Column(
                                          children: [
                                            // BlocBuilder<CountryBloc,
                                            //     CountryState>(
                                            //   builder: (context, state) {
                                            //     return state.when(
                                            //       initial: () {
                                            //         return GestureDetector(
                                            //           onTap: () => context
                                            //               .read<CountryBloc>()
                                            //               .add(
                                            //                   const CountryEvent
                                            //                       .load()),
                                            //           child: DropDownWidget(
                                            //             hint:
                                            //                 'Choose_your_country',
                                            //             data: [],
                                            //             onChange: (v) {
                                            //               context
                                            //                   .read<
                                            //                       CountryBloc>()
                                            //                   .add(CountryEvent
                                            //                       .changeItem(
                                            //                           item:
                                            //                               v!));
                                            //             },
                                            //           ),
                                            //         );
                                            //       },
                                            //       loading: () => DropDownWidget(
                                            //         loading: true,
                                            //         hint: 'Choose_your_country',
                                            //         data: [],
                                            //         onChange: (v) {
                                            //           context
                                            //               .read<CountryBloc>()
                                            //               .add(CountryEvent
                                            //                   .changeItem(
                                            //                       item: v!));
                                            //         },
                                            //       ),
                                            //       dataLoaded: (e) {
                                            //         return DropDownWidget(
                                            //           hint:
                                            //               'Choose_your_country',
                                            //           data: e,
                                            //           onChange: (v) {
                                            //             context
                                            //                 .read<CountryBloc>()
                                            //                 .add(CountryEvent
                                            //                     .changeItem(
                                            //                         item: v!));
                                            //             context
                                            //                 .read<CityBloc>()
                                            //                 .add(CityEvent.load(
                                            //                     id: v.id!));

                                            //             countryId = v.id;
                                            //           },
                                            //         );
                                            //       },
                                            //       itemChanged: (i, data) {
                                            //         return DropDownWidget(
                                            //           hint:
                                            //               'Choose_your_country',
                                            //           data: data,
                                            //           value: i,
                                            //           onChange: (v) {
                                            //             context
                                            //                 .read<CountryBloc>()
                                            //                 .add(CountryEvent
                                            //                     .changeItem(
                                            //                         item: v!));
                                            //             context
                                            //                 .read<CityBloc>()
                                            //                 .add(CityEvent.load(
                                            //                     id: i.id!));

                                            //             countryId = v.id;
                                            //           },
                                            //         );
                                            //       },
                                            //       error: (msg) =>
                                            //           GestureDetector(
                                            //         onTap: () => context
                                            //             .read<CountryBloc>()
                                            //             .add(const CountryEvent
                                            //                 .load()),
                                            //         child: DropDownWidget(
                                            //           hint:
                                            //               'Choose_your_country',
                                            //           data: [],
                                            //           onChange: (v) {
                                            //             context
                                            //                 .read<CountryBloc>()
                                            //                 .add(CountryEvent
                                            //                     .changeItem(
                                            //                         item: v!));
                                            //           },
                                            //         ),
                                            //       ),
                                            //     );
                                            //   },
                                            // ),
                                            // SizedBox(
                                            //   height: 2.h,
                                            // ),
                                            // BlocBuilder<CityBloc, CityState>(
                                            //   builder: (context, state) {
                                            //     return state.maybeWhen(
                                            //         dataLoaded: (e) {
                                            //           return DropDownWidget(
                                            //             hint:
                                            //                 'Choose_your_city',
                                            //             data: e,
                                            //             onChange: (v) {
                                            //               context
                                            //                   .read<CityBloc>()
                                            //                   .add(CityEvent
                                            //                       .changeItem(
                                            //                           item:
                                            //                               v!));
                                            //               context
                                            //                   .read<
                                            //                       RegionBloc>()
                                            //                   .add(RegionEvent
                                            //                       .load(
                                            //                           id: v
                                            //                               .id!));

                                            //               cityId = v.id;
                                            //               print(cityId);
                                            //             },
                                            //           );
                                            //         },
                                            //         initial: () {
                                            //           return DropDownWidget(
                                            //             hint:
                                            //                 'Choose_your_city',
                                            //             data: [],
                                            //             onChange: (v) {
                                            //               context
                                            //                   .read<CityBloc>()
                                            //                   .add(CityEvent
                                            //                       .changeItem(
                                            //                           item:
                                            //                               v!));
                                            //             },
                                            //           );
                                            //         },
                                            //         itemChanged: (i, data) {
                                            //           return DropDownWidget(
                                            //             hint:
                                            //                 'Choose_your_city',
                                            //             data: data,
                                            //             value: i,
                                            //             onChange: (v) {
                                            //               context
                                            //                   .read<CityBloc>()
                                            //                   .add(CityEvent
                                            //                       .changeItem(
                                            //                           item:
                                            //                               v!));
                                            //               context
                                            //                   .read<
                                            //                       RegionBloc>()
                                            //                   .add(RegionEvent
                                            //                       .load(
                                            //                           id: v
                                            //                               .id!));

                                            //               cityId = i.id;
                                            //             },
                                            //           );
                                            //         },
                                            //         loading: () =>
                                            //             DropDownWidget(
                                            //               loading: true,
                                            //               hint:
                                            //                   'Choose_your_city',
                                            //               data: [],
                                            //               onChange: (v) {
                                            //                 context
                                            //                     .read<
                                            //                         CityBloc>()
                                            //                     .add(CityEvent
                                            //                         .changeItem(
                                            //                             item:
                                            //                                 v!));
                                            //               },
                                            //             ),
                                            //         orElse: () =>
                                            //             DropDownWidget(
                                            //               hint:
                                            //                   'Choose_your_city',
                                            //               data: [],
                                            //               onChange: (v) {
                                            //                 context
                                            //                     .read<
                                            //                         CityBloc>()
                                            //                     .add(CityEvent
                                            //                         .changeItem(
                                            //                             item:
                                            //                                 v!));
                                            //               },
                                            //             ));
                                            //   },
                                            // ),
                                            // SizedBox(
                                            //   height: 2.h,
                                            // ),
                                            // BlocBuilder<RegionBloc,
                                            //     RegionState>(
                                            //   builder: (context, state) {
                                            //     return state.maybeWhen(
                                            //         dataLoaded: (e) {
                                            //           return DropDownWidget(
                                            //             hint:
                                            //                 "choose_your_region",
                                            //             data: e,
                                            //             onChange: (v) {
                                            //               context
                                            //                   .read<
                                            //                       RegionBloc>()
                                            //                   .add(RegionEvent
                                            //                       .changeItem(
                                            //                           item:
                                            //                               v!));

                                            //               regionId = v.id;
                                            //             },
                                            //           );
                                            //         },
                                            //         initial: () {
                                            //           return DropDownWidget(
                                            //             hint:
                                            //                 "choose_your_region",
                                            //             data: [],
                                            //             onChange: (v) {
                                            //               context
                                            //                   .read<
                                            //                       RegionBloc>()
                                            //                   .add(RegionEvent
                                            //                       .changeItem(
                                            //                           item:
                                            //                               v!));
                                            //             },
                                            //           );
                                            //         },
                                            //         itemChanged: (i, data) {
                                            //           return DropDownWidget(
                                            //             hint:
                                            //                 "choose_your_region",
                                            //             data: data,
                                            //             value: i,
                                            //             onChange: (v) {
                                            //               context
                                            //                   .read<
                                            //                       RegionBloc>()
                                            //                   .add(RegionEvent
                                            //                       .changeItem(
                                            //                           item:
                                            //                               v!));

                                            //               regionId = v.id;
                                            //             },
                                            //           );
                                            //         },
                                            //         loading: () => Stack(
                                            //               children: [
                                            //                 DropDownWidget(
                                            //                   loading: true,
                                            //                   hint:
                                            //                       "choose_your_region",
                                            //                   data: [],
                                            //                   onChange: (v) {
                                            //                     context
                                            //                         .read<
                                            //                             RegionBloc>()
                                            //                         .add(RegionEvent
                                            //                             .changeItem(
                                            //                                 item:
                                            //                                     v!));
                                            //                   },
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //         orElse: () =>
                                            //             DropDownWidget(
                                            //               hint:
                                            //                   "choose_your_region",
                                            //               data: [],
                                            //               onChange: (v) {
                                            //                 context
                                            //                     .read<
                                            //                         RegionBloc>()
                                            //                     .add(RegionEvent
                                            //                         .changeItem(
                                            //                             item:
                                            //                                 v!));
                                            //               },
                                            //             ));
                                            //   },
                                            // ),
                                         
                                          ],
                                        ),
                                    orElse: () => const SizedBox());
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            StatefulBuilder(builder: (context, setState) {
                              return Row(
                                children: [
                                  const Text("gender").tr(),
                                  const Expanded(child: SizedBox()),
                                  Checkbox(
                                    activeColor: AppTheme.green,
                                    value: gender == Gender.Male,
                                    onChanged: (v) {
                                      gender = v! ? Gender.Male : null;
                                      setState(() {});
                                    },
                                  ),
                                  const Text("male").tr(),
                                  const Expanded(child: SizedBox()),
                                  Checkbox(
                                    activeColor: AppTheme.green,
                                    value: gender == Gender.Female,
                                    onChanged: (v) {
                                      gender = v! ? Gender.Female : null;
                                      setState(() {});
                                    },
                                  ),
                                  const Text("female").tr(),
                                  const Expanded(child: SizedBox()),
                                ],
                              );
                            }),
                            StatefulBuilder(builder: (context, setState) {
                              return Row(
                                children: [
                                  Checkbox(
                                    activeColor: AppTheme.green,
                                    value: isChecked,
                                    onChanged: (v) {
                                      isChecked = v!;
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
                                  if (servicesId.isEmpty) {
                                    AlertController.show(
                                        "",
                                        "Please_choose_what_to_offer".tr(),
                                        TypeAlert.warning);
                                    return;
                                  }
                                  if (sections.isEmpty && hassections == true) {
                                    AlertController.show(
                                        "",
                                        "Please_choose_subservices".tr(),
                                        TypeAlert.warning);
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
                                      gender != null &&
                                      isChecked) {
                                   
                                    // context.read<AuthBloc>().add(
                                    //       AuthEvent.completeRegister(
                                    //         request: RegisterPrimarySeller(
                                    //             fcmToken:
                                    //                 await firebaseMessaging
                                    //                     .getToken(),
                                    //             serviceId: servicesId,
                                    //             sectionId: sections.isNotEmpty
                                    //                 ? sections
                                    //                 : null,
                                    //             phone:
                                    //                 "${phoneNumber?.isoCode}-${phoneNumber?.dialCode}-${phone.text.replaceAll(" ", "")}",
                                    //             lastname: lastName.text,
                                    //             firstname: firstName.text,
                                    //             country: country.text,
                                    //             email: email,
                                    //             city: city.text,
                                    //             region: region.text,
                                    //             countryId: countryId,
                                    //             regionId: regionId,
                                    //             cityId: cityId,
                                    //             image: imageSelected,
                                    //             gender: gender!.name),
                                    //       ),
                                    //     );
                                   
                                    sl<LocalDataSource>().setValue(
                                        LocalDataKeys.role,
                                        TypeSeller.admin.name);
                                  } else if (gender == null) {
                                    AlertController.show(
                                        "",
                                        "Choose_the_gender".tr(),
                                        TypeAlert.warning);
                                    return;
                                  } else if (!isChecked) {
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
                                    profileCompleted: () => true,
                                    error: (error, e) => true,
                                    loading: () => true,
                                  ),
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () => const Text("submit").tr(),
                                      loading: () => LoadingAnimationWidget
                                          .prograssiveDots(
                                              color: AppTheme.primaryColor,
                                              size: 20.sp),
                                    );
                                  },
                                ),
                              ),
                            ),
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

enum Gender { Male, Female }
