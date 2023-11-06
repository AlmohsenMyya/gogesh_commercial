import 'dart:io';

import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/presentaation/main/main_screen.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/bloc/register_company_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils.dart';
import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../domain/entities/standard_entity/standar_response.dart';
import '../../../domain/request/auth/register/register_part_two_seller.dart';
import '../../../domain/usecase/register_company/register_company_usecase.dart';
import '../Days/days_bloc.dart';
import '../widget/checkbox.dart';

List<bool> listIsChecked = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

List<StandarEntity> days = [];

class SelectDaysScreen extends StatelessWidget {
  SelectDaysScreen({
    required this.information,
    super.key,
  });
  List<TextEditingController> textFieldto = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> textFieldfrom = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final RegisterPartTwoSeller information;
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCompanyBloc, RegisterCompanyState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          eroor: (msg) {
            AlertController.show("", msg?.tr() ?? "", TypeAlert.error);
          },
          succes: (msg) {
            AlertController.show("", 'Your request has been submitted to the administration. Please now pay the 35 dollar activation fee and benefit from our free package'.tr(), TypeAlert.success);
            smartDialogPayment(context);

            textFieldto.forEach((element) {
              element.dispose();
            });
            textFieldfrom.forEach((element) {
              element.dispose();
            });
          },
        );
      },
      child: BlocProvider(
        create: (context) =>
            DaysBloc(getdaysUseCase: sl())..add(const DaysEvent.loadDays()),
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Set_working_hours").tr(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<DaysBloc, DaysState>(
                    builder: (context, state) {
                      return state.map(
                        error: (msg) => SizedBox(
                          height: 98.h,
                          child: const Center(
                            child: Text("error"),
                          ),
                        ),
                        loading: (value) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade50,
                          child: SizedBox(
                            height: 70.h,
                            child: ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    StatefulBuilder(
                                        builder: (context, setstate) {
                                      return CheckBoxDays(
                                        hint: "days",
                                        enabled: listIsChecked[index],
                                        onChanged: (p0) {
                                          setstate(() {});
                                        },
                                        value: listIsChecked[index],
                                        controllerfrom: textFieldfrom[index],
                                        validatorfrom: (valuefrom) {},
                                        controllerto: textFieldto[index],
                                        validatorto: (valueto) {},
                                      );
                                    }),
                                    Divider(
                                      thickness: 0.2.h,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        daysLoaded: (data) {
                          days = data.data;
                          return SizedBox(
                            height: 70.h,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    StatefulBuilder(
                                        builder: (context, setstate) {
                                      return CheckBoxDays(
                                        onTapTo: () async {
                                          TimeOfDay? start =
                                              await showRoundedTimePicker(
                                            context: context,
                                            // height: 40.h,
                                            locale: Locale(
                                              context.locale.languageCode,
                                            ),
                                            initialTime: TimeOfDay.now(),
                                            // lastDate: DateTime(2025),
                                            // firstDate:
                                            //     DateTime(DateTime.now().day),
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
                                              "${start.hour}"
                                                      ":"
                                                      "${start.minute}" !=
                                                  textFieldto[index].text) {
                                            setstate(
                                              () {
                                                textFieldto[index].text =
                                                    "${start.hour}"
                                                    ":"
                                                    "${start.minute}";
                                              },
                                            );
                                          }
                                        },
                                        onTapFrom: () async {
                                          TimeOfDay? start =
                                              await showRoundedTimePicker(
                                            context: context,
                                            // height: 40.h,
                                            locale: Locale(
                                              context.locale.languageCode,
                                            ),
                                            initialTime: TimeOfDay.now(),
                                            // lastDate: DateTime(2025),
                                            // firstDate:
                                            //     DateTime(DateTime.now().day),
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
                                              "${start.hour}"
                                                      ":"
                                                      "${start.minute}" !=
                                                  textFieldfrom[index].text) {
                                            setstate(
                                              () {
                                                textFieldfrom[index].text =
                                                    "${start.hour}"
                                                    ":"
                                                    "${start.minute}";
                                              },
                                            );
                                          }
                                        },
                                        hint: data.data[index].name!,
                                        enabled: listIsChecked[index],
                                        onChanged: (p0) {
                                          setstate(() {
                                            if (listIsChecked[index]) {
                                              listIsChecked[index] = false;
                                            } else {
                                              listIsChecked[index] = true;
                                            }
                                          });
                                        },
                                        value: listIsChecked[index],
                                        controllerfrom: textFieldfrom[index],
                                        validatorfrom: (valuefrom) {
                                          if (listIsChecked[index] == true &&
                                              valuefrom != null &&
                                              valuefrom.isNotEmpty) {
                                            if (isHourValid(valuefrom)) {
                                              return null;
                                            } else {
                                              return "Wrong_format".tr();
                                            }
                                          } else {
                                            return "The_field_is_empty".tr();
                                          }
                                        },
                                        controllerto: textFieldto[index],
                                        validatorto: (valueto) {
                                          if (listIsChecked[index] == true &&
                                              valueto != null &&
                                              valueto.isNotEmpty) {
                                            if (isHourValid(valueto)) {
                                              return null;
                                            } else {
                                              return "Wrong_format".tr();
                                            }
                                          } else {
                                            return "The_field_is_empty".tr();
                                          }
                                        },
                                      );
                                    }),
                                    Divider(
                                      thickness: 0.2.h,
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                  BlocBuilder<RegisterCompanyBloc, RegisterCompanyState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 5.h,
                        width: double.infinity,
                        child: custombuttom(
                          onTap: () {
                            List<WorkDays> workDays = [];
                            int check = 0;
                            workDays.clear();

                            listIsChecked.asMap().forEach(
                              (key, value) {
                                if (value) {
                                  check++;
                                  if (isHourValid(textFieldfrom[key].text) &&
                                      isHourValid(textFieldto[key].text)) {
                                    workDays.add(WorkDays(
                                        day: days[key].id.toString(),
                                        from: textFieldfrom[key].text,
                                        to: textFieldto[key].text));
                                  } else {
                                    isHourValid(textFieldfrom[key].text)
                                        ? AlertController.show(
                                            "",
                                            "${"Please_enter_a_valid_format_for_the_To_date_field".tr()} ${days[key].name}",
                                            TypeAlert.warning)
                                        : AlertController.show(
                                            "",
                                            "${"Please_enter_a_valid_field_format_of_the_day".tr()} ${days[key].name}",
                                            TypeAlert.warning);
                                  }
                                }
                              },
                            );
                            if (workDays.length == check && check != 0) {
                              context
                                  .read<RegisterCompanyBloc>()
                                  .add(RegisterCompanyEvent.registerCompany(
                                    request: RegisterPartTwoSeller(
                                      price: information.price,
                                      logo: information.logo,
                                      specialities: information.specialities,
                                      seasons: information.seasons,
                                      socialAccounts:
                                          information.socialAccounts,
                                      workDays: workDays,
                                    ),
                                  ));
                            } else if (check == 0) {
                              AlertController.show(
                                  "",
                                  "please_enter_works_days".tr(),
                                  TypeAlert.warning);
                            }
                          },
                          child: state.maybeWhen(
                            orElse: () => const Text("register_now").tr(),
                            loading: () =>
                                LoadingAnimationWidget.prograssiveDots(
                                    color: AppTheme.primaryColor, size: 20.sp),
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
    );
  }
}
