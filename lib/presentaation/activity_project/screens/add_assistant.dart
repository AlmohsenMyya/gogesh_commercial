import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/assets.dart';
import 'package:commmercial_directory_seller/domain/request/company/add_assistant.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/assistant_bloc/assistant_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/profile_avatar.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

class AddAssistantScreen extends HookWidget {
  AddAssistantScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  String? imagePath;
  bool states = false;
  PhoneNumber? phoneNumber;

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    final passwordConfirmation = useTextEditingController();
    final phone = useTextEditingController();
    final lastName = useTextEditingController();
    final firstName = useTextEditingController();

    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    return BlocProvider(
      create: (context) => AssistantBloc(
          addAssistantUseCase: sl(),
          getAssistantUseCase: sl(),
          deleteAssistantUseCase: sl())
        ..add(const AssistantEvent.load()),
      child: BlocListener<AssistantBloc, AssistantState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            imagePicked: (image) {
              imagePath = image.path;
            },
            error: (error) {
              AlertController.show("", error ?? ''.tr(), TypeAlert.success);
            },
            succes: () {
              states = true;
              AlertController.show("", "".tr(), TypeAlert.success);

              email.clear();
              password.clear();
              passwordConfirmation.clear();
              phone.clear();
              lastName.clear();
              firstName.clear();
            },
          );
        },
        child: DefaultTabController(
          length: 2,
          child: WillPopScope(
            onWillPop: () async {
              context.pop(states);
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("add_assistant").tr(),
                leading: IconButton(
                    onPressed: () {
                      context.pop(states);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 5.h,
                    child: TabBar(
                      // controller: controller,
                      padding: EdgeInsets.only(left: 1.w, right: 1.w),
                      tabs: [
                        Tab(text: 'add_assistant'.tr()),
                        Tab(text: "helpers".tr()),
                      ],
                      indicatorColor: AppTheme.green,
                      // labelColor: Colors.black,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: AppTheme.green,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      onTap: (value) {},
                    ),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    BlocBuilder<AssistantBloc, AssistantState>(
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
                                                  image: AssetImage(Assets
                                                      .assets_icons_person_png),
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
                                                  image: FileImage(
                                                      File(image.path)),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        );
                                      },
                                    ),
                                    BlocBuilder<AssistantBloc, AssistantState>(
                                      builder: (context, state) {
                                        return IconButton(
                                            onPressed: () {
                                              context.read<AssistantBloc>().add(
                                                  const AssistantEvent
                                                          .uploadImage(
                                                      source:
                                                          ImageSource.gallery));
                                            },
                                            style: const ButtonStyle(
                                                padding:
                                                    MaterialStatePropertyAll(
                                                        EdgeInsets.zero)),
                                            icon: SvgPicture.asset(
                                              Assets.assets_icons_edit_svg,
                                              width: 40,
                                              height: 40,
                                            ));
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      hintText: "first_name".tr()),
                                  controller: firstName,
                                  validator: (value) {
                                    if (value != null &&
                                        value.isNotEmpty &&
                                        value.length >= 4) {
                                      return null;
                                    }
                                    return "please_enter_first_name".tr();
                                  },
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      hintText: "last_name".tr()),
                                  controller: lastName,
                                  validator: (value) {
                                    if (value != null &&
                                        value.isNotEmpty &&
                                        value.length >= 4) {
                                      return null;
                                    }
                                    return "please_enter_last_name".tr();
                                  },
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: InternationalPhoneNumberInput(
                                    hintText: "phone_commercial".tr(),
                                    onInputChanged: (PhoneNumber number) {
                                      phoneNumber = number;
                                    },
                                    errorMessage:
                                        "please_enter_valid_phone".tr(),
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
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "email".tr(),
                                  ),
                                  controller: email,
                                  validator: (value) {
                                    if (isEmail(email.text)) {
                                      return null;
                                    } else {
                                      if (value == null || value.isEmpty) {
                                        return "please_enter_email".tr();
                                      }
                                      return "please_enter_valid_email".tr();
                                    }
                                  },
                                ),
                                SizedBox(height: 1.h),
                                Builder(builder: (context) {
                                  bool visible = false;
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return TextFormField(
                                      obscureText: !visible,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          hintText: "password".tr(),
                                          suffix: GestureDetector(
                                            onTap: () => setState(() {
                                              visible = !visible;
                                            }),
                                            child: visible
                                                ? const Icon(Ionicons.eye)
                                                : const Icon(Ionicons.eye_off),
                                          ),
                                          prefixIcon: const Icon(Icons.key)),
                                      controller: password,
                                      validator: passwordValidator,
                                    );
                                  });
                                }),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Builder(builder: (context) {
                                  bool visible = false;
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return TextFormField(
                                      textInputAction: TextInputAction.next,
                                      obscureText: !visible,
                                      decoration: InputDecoration(
                                          hintText:
                                              "password_confirmation".tr(),
                                          suffix: GestureDetector(
                                            onTap: () => setState(() {
                                              visible = !visible;
                                            }),
                                            child: visible
                                                ? const Icon(Ionicons.eye)
                                                : const Icon(Ionicons.eye_off),
                                          ),
                                          prefixIcon: const Icon(Icons.key)),
                                      controller: passwordConfirmation,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "please_enter_password_confirmation"
                                              .tr();
                                        }
                                        if (value != password.text) {
                                          return "password_confirmation_doesn't_match"
                                              .tr();
                                        }
                                        return null;
                                      },
                                    );
                                  });
                                }),
                                SizedBox(
                                  height: 3.h,
                                ),
                                BlocBuilder<AssistantBloc, AssistantState>(
                                  buildWhen: (previous, current) {
                                    return current.maybeWhen(
                                      orElse: () => false,
                                      loadingAdd: () => true,
                                      succes: () => true,
                                      error: (error) => true,
                                      initial: () => true,
                                    );
                                  },
                                  builder: (context, state) {
                                    return SizedBox(
                                      width: double.infinity,
                                      child: custombuttom(
                                        onTap: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (password.text ==
                                                passwordConfirmation.text) {
                                              context.read<AssistantBloc>().add(
                                                  AssistantEvent.addAssistant(
                                                      request: AddAssistantRequest(
                                                          fcmToken:
                                                              await firebaseMessaging
                                                                  .getToken(),
                                                          firstname:
                                                              firstName.text,
                                                          image: imagePath,
                                                          lastname:
                                                              lastName.text,
                                                          email: email.text,
                                                          phone:
                                                              "${phoneNumber?.isoCode}-${phoneNumber?.dialCode}-${phone.text.replaceAll(" ", "")}",
                                                          password:
                                                              password.text,
                                                          passwordConfirmation:
                                                              passwordConfirmation
                                                                  .text)));
                                            } else if (password.text !=
                                                passwordConfirmation.text) {
                                              AlertController.show(
                                                  "",
                                                  "Confirm_password_is_inconsistent"
                                                      .tr(),
                                                  TypeAlert.warning);
                                            }
                                          }
                                        },
                                        child: state.maybeWhen(
                                          orElse: () => const Text("add").tr(),
                                          loadingAdd: () =>
                                              LoadingAnimationWidget
                                                  .prograssiveDots(
                                                      color:
                                                          AppTheme.primaryColor,
                                                      size: 20.sp),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<AssistantBloc, AssistantState>(
                            buildWhen: (previous, current) {
                          return current.maybeWhen(
                            orElse: () => false,
                            loading: () => true,
                            dataLoaded: (d) => true,
                          );
                        }, builder: (context, state) {
                          return state.maybeWhen(
                              orElse: () => const SizedBox(),
                              loading: () => const SizedBox(),
                              dataLoaded: (value) => ListView.separated(
                                    itemCount: value.length,
                                    separatorBuilder: (context, index) =>
                                        Column(
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                    itemBuilder: (context, index) => Card(
                                      elevation: 5,
                                      child: Container(
                                        padding: EdgeInsets.all(1.h),
                                        //  height: .h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.h),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "first_name",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color:
                                                                Colors.black26),
                                                      ).tr(),
                                                      Text(
                                                        value[index]
                                                                .firstName ??
                                                            '',
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                      Text(
                                                        "last_name",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color:
                                                                Colors.black26),
                                                      ).tr(),
                                                      Text(
                                                        value[index].lastName ??
                                                            '',
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                      Text(
                                                        "phone_commercial",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color:
                                                                Colors.black26),
                                                      ).tr(),
                                                      SizedBox(
                                                          width: 20.h,
                                                          child: FittedBox(
                                                              child: Text(
                                                            value[index]
                                                                    .phone ??
                                                                '',
                                                            style: TextStyle(
                                                              fontSize: 14.sp,
                                                            ),
                                                          ))),
                                                      Text(
                                                        "email",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color:
                                                                Colors.black26),
                                                      ).tr(),
                                                      SizedBox(
                                                        width: 20.h,
                                                        child: FittedBox(
                                                          child: Text(
                                                            value[index]
                                                                    .email ??
                                                                '',
                                                            style: TextStyle(
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  CachedNetworkImage(
                                                    imageUrl:
                                                        value[index].image ??
                                                            "",
                                                    imageBuilder:
                                                        (ctx, imageProvider) {
                                                      return Container(
                                                        height: 15.h,
                                                        width: 15.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
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
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            ProfileAvatar(
                                                      height: 15.h,
                                                      width: 15.h,
                                                      lastName: value[index]
                                                              .lastName ??
                                                          '',
                                                      firstName: value[index]
                                                              .firstName ??
                                                          '',
                                                      style: TextStyle(
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    placeholder: (_, __) =>
                                                        Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey.shade200,
                                                      highlightColor:
                                                          Colors.grey.shade50,
                                                      child: Container(
                                                        height: 15.h,
                                                        width: 15.h,
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
                                                ]),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            BlocBuilder<AssistantBloc,
                                                AssistantState>(
                                              builder: (context, state) {
                                                return custombuttom(
                                                  onTap: () {
                                                    context
                                                        .read<AssistantBloc>()
                                                        .add(AssistantEvent
                                                            .deleteAssistant(
                                                                id: value[index]
                                                                    .id!,
                                                                index: index));
                                                  },
                                                  color: Colors.redAccent,
                                                  child: state.maybeWhen(
                                                    orElse: () => Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons.delete_forever,
                                                          size: 30,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        const Text(
                                                          "delete",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ).tr(),
                                                      ],
                                                    ),
                                                    loadingDelete: (indx) =>indx==index?
                                                        LoadingAnimationWidget
                                                            .prograssiveDots(
                                                                color: AppTheme
                                                                    .primaryColor,
                                                                size: 20.sp):Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons.delete_forever,
                                                          size: 30,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        const Text(
                                                          "delete",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ).tr(),
                                                      ],
                                                    ),
                                                  
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                        }),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
