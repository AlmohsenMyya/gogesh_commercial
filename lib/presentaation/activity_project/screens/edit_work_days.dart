import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_work_days_request.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/workdays_bloc/work_days_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/widget/checkbox.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class EditWorkDays extends HookWidget {
  EditWorkDays({super.key});
  final _formKey = GlobalKey<FormState>();
  List<WorkDays> workDays = [];

  List listIsChecked = [
    {'id': "1", "isCheck": false},
    {'id': "2", "isCheck": false},
    {'id': "3", "isCheck": false},
    {'id': "4", "isCheck": false},
    {'id': "5", "isCheck": false},
    {'id': "6", "isCheck": false},
    {'id': "7", "isCheck": false}
  ];

  List<StandarEntity> daysArabic = [
    StandarEntity(id: 1, name: "السبت"),
    StandarEntity(id: 2, name: "الأحد"),
    StandarEntity(id: 3, name: "الإثنين"),
    StandarEntity(id: 4, name: "الثلاثاء"),
    StandarEntity(id: 5, name: "الأربعاء"),
    StandarEntity(id: 6, name: "الخميس"),
    StandarEntity(id: 7, name: "الجمعة"),
  ];
  List<StandarEntity> daysEnglish = [
    StandarEntity(id: 1, name: "Saturday"),
    StandarEntity(id: 2, name: "Sunday"),
    StandarEntity(id: 3, name: "Monday"),
    StandarEntity(id: 4, name: "Tuesday"),
    StandarEntity(id: 5, name: "Wednesday"),
    StandarEntity(id: 6, name: "Thursday"),
    StandarEntity(id: 7, name: "Friday"),
  ];
  bool states = false;

  @override
  Widget build(BuildContext context) {
    final from1 = useTextEditingController();
    final from2 = useTextEditingController();
    final from3 = useTextEditingController();
    final from4 = useTextEditingController();
    final from5 = useTextEditingController();
    final from6 = useTextEditingController();
    final from7 = useTextEditingController();
    final to1 = useTextEditingController();
    final to2 = useTextEditingController();
    final to3 = useTextEditingController();
    final to4 = useTextEditingController();
    final to5 = useTextEditingController();
    final to6 = useTextEditingController();
    final to7 = useTextEditingController();
    List<dynamic> textFieldfrom = [
      {
        'id': "1",
        "Field": from1,
      },
      {
        'id': "2",
        "Field": from2,
      },
      {
        'id': "3",
        "Field": from3,
      },
      {
        'id': "4",
        "Field": from4,
      },
      {
        'id': "5",
        "Field": from5,
      },
      {
        'id': "6",
        "Field": from6,
      },
      {
        'id': "7",
        "Field": from7,
      },
    ];
    List<dynamic> textFieldto = [
      {
        'id': "1",
        "Field": to1,
      },
      {
        'id': "2",
        "Field": to2,
      },
      {
        'id': "3",
        "Field": to3,
      },
      {
        'id': "4",
        "Field": to4,
      },
      {
        'id': "5",
        "Field": to5,
      },
      {
        'id': "6",
        "Field": to6,
      },
      {
        'id': "7",
        "Field": to7,
      },
    ];
    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);
    Upgraded? upgraded = user?.upgraded;
    if (user != null) {
      if (user.upgraded != null) {
        upgraded?.workDays?.forEach((element) {
          listIsChecked.forEach((e) {
            e['id'] == element.day.toString() ? e['isCheck'] = true : null;
          });
          textFieldto.forEach((e) {
            e['id'] == element.day.toString()
                ? e['Field'].text = element.to
                : null;
          });
          textFieldfrom.forEach((e) {
            e['id'] == element.day.toString()
                ? e['Field'].text = element.from
                : null;
          });
        });
      }
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkDaysBloc(
            getWorkDaysUseCase: sl(),
            editWorkDaysUseCase: sl(),
          )..add(const WorkDaysEvent.load()),
        ),
      ],
      child: BlocListener<WorkDaysBloc, WorkDaysState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (error) {},
            succes: () {
              AlertController.show("", "", TypeAlert.success);
              states = true;
              context.pop(states);
            },
            dataLoaded: (value) {
              value.data.workDays!.forEach((element) {
                listIsChecked.forEach((e) {
                  e['id'] == element.day.toString()
                      ? e['isCheck'] = true
                      : null;
                });
                textFieldto.forEach((e) {
                  e['id'] == element.day.toString()
                      ? e['Field'].text = element.to
                      : null;
                });
                textFieldfrom.forEach((e) {
                  e['id'] == element.day.toString()
                      ? e['Field'].text = element.from
                      : null;
                });
              });
            },
          );
        },
        child: WillPopScope(
          onWillPop: () async {
            context.pop(states);
            return true;
          },
          child: Scaffold(
            //resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text("edit_schedule").tr(),
            ),
            body: Padding(
              padding:
                  EdgeInsets.only(top: 7.h, right: 1.h, left: 1.h, bottom: 1.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<WorkDaysBloc, WorkDaysState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => SizedBox(
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
                                        hint:
                                            context.locale.languageCode == 'ar'
                                                ? daysArabic[index].name!
                                                : daysArabic[index].name!,
                                        enabled: listIsChecked[index]
                                            ["isCheck"],
                                        onChanged: (p0) {
                                          setstate(() {
                                            if (listIsChecked[index]
                                                ["isCheck"]) {
                                              listIsChecked[index]["isCheck"] =
                                                  false;
                                            } else {
                                              listIsChecked[index]["isCheck"] =
                                                  true;
                                            }
                                          });
                                        },
                                        value: listIsChecked[index]["isCheck"],
                                        controllerfrom: textFieldfrom[index]
                                            ["Field"],
                                        validatorfrom: (valuefrom) {
                                          if (listIsChecked[index]["isCheck"] ==
                                                  true &&
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
                                        controllerto: textFieldto[index]
                                            ["Field"],
                                        validatorto: (valueto) {
                                          if (listIsChecked[index]["isCheck"] ==
                                                  true &&
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
                          ),
                          loading: () => Shimmer.fromColors(
                            baseColor: Colors.grey.shade200,
                            highlightColor: Colors.grey.shade50,
                            child: SizedBox(
                              height: 70.h,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            activeColor: AppTheme.green,
                                            value: false,
                                            onChanged: (v) {},
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        0.5.h)),
                                          ),
                                          Container(
                                            height: 2.5.h,
                                            width: 5.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 2.h,
                                          ),
                                          Text("${"from".tr()} : "),
                                          SizedBox(
                                            height: 5.h,
                                            width: 10.h,
                                            child: TextFormField(
                                              cursorHeight: 2.5.h,
                                              textInputAction:
                                                  TextInputAction.done,
                                              style:
                                                  const TextStyle(height: 1.5),
                                              //keyboardType: TextInputType.date,
                                              decoration: const InputDecoration(
                                                hintText: "08:00",
                                                // Adjust the vertical padding as needed
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1.h,
                                          ),
                                          Text("${"to".tr()} : "),
                                          SizedBox(
                                            height: 5.h,
                                            width: 10.h,
                                            child: TextFormField(
                                              cursorHeight: 2.5.h,
                                              textInputAction:
                                                  TextInputAction.done,
                                              style:
                                                  const TextStyle(height: 1.5),
                                              // keyboardType: TextInputType.datetime,
                                              decoration: const InputDecoration(
                                                hintText: "19:00",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(
                                        thickness: 0.2.h,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          dataLoaded: (data) => SizedBox(
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
                                                  textFieldto[index]["Field"]
                                                      .text) {
                                            setstate(
                                              () {
                                                textFieldto[index]["Field"]
                                                        .text = "${start.hour}"
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
                                                  textFieldfrom[index]["Field"]
                                                      .text) {
                                            setstate(
                                              () {
                                                textFieldfrom[index]["Field"]
                                                        .text = "${start.hour}"
                                                    ":"
                                                    "${start.minute}";
                                              },
                                            );
                                          }
                                        },
                                        hint:
                                            context.locale.languageCode == 'ar'
                                                ? daysArabic[index].name!
                                                : daysArabic[index].name!,
                                        enabled: listIsChecked[index]
                                            ["isCheck"],
                                        onChanged: (p0) {
                                          setstate(() {
                                            if (listIsChecked[index]
                                                ["isCheck"]) {
                                              listIsChecked[index]["isCheck"] =
                                                  false;
                                            } else {
                                              listIsChecked[index]["isCheck"] =
                                                  true;
                                            }
                                          });
                                        },
                                        value: listIsChecked[index]["isCheck"],
                                        controllerfrom: textFieldfrom[index]
                                            ["Field"],
                                        validatorfrom: (valuefrom) {
                                          if (listIsChecked[index]["isCheck"] ==
                                                  true &&
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
                                        controllerto: textFieldto[index]
                                            ["Field"],
                                        validatorto: (valueto) {
                                          if (listIsChecked[index]["isCheck"] ==
                                                  true &&
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
                          ),
                        );
                      },
                    ),
                    BlocBuilder<WorkDaysBloc, WorkDaysState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 6.h,
                          width: double.infinity,
                          child: custombuttom(
                            onTap: () {
                              int check = 0;
                              workDays.clear();

                              listIsChecked.asMap().forEach(
                                (key, value) {
                                  if (value["isCheck"]) {
                                    check++;
                                    if (isHourValid(
                                            textFieldfrom[key]["Field"].text) &&
                                        isHourValid(
                                            textFieldto[key]["Field"].text)) {
                                      workDays.add(WorkDays(
                                          day: daysArabic[key].id.toString(),
                                          from:
                                              textFieldfrom[key]["Field"].text,
                                          to: textFieldto[key]["Field"].text));
                                    } else {
                                      isHourValid(
                                              textFieldfrom[key]["Field"].text)
                                          ? AlertController.show(
                                              "",
                                              "${"Please_enter_a_valid_format_for_the_To_date_field".tr()} ${context.locale.languageCode == 'ar' ? daysArabic[key].name : daysEnglish[key].name}",
                                              TypeAlert.warning)
                                          : AlertController.show(
                                              "",
                                              "${"Please_enter_a_valid_field_format_of_the_day".tr()} ${context.locale.languageCode == 'ar' ? daysArabic[key].name : daysEnglish[key].name}",
                                              TypeAlert.warning);
                                    }
                                  }
                                },
                              );
                              if (workDays.length == check && check != 0) {
                                context
                                    .read<WorkDaysBloc>()
                                    .add(WorkDaysEvent.editWorkDays(
                                        request: EditWorkDaysRequest(
                                      workDays: workDays,
                                    )));
                              } else if (check == 0) {
                                AlertController.show(
                                    "",
                                    "please_enter_works_days".tr(),
                                    TypeAlert.warning);
                              }
                            },
                            child: state.maybeWhen(
                              orElse: () => const Text("edit").tr(),
                              loadingEdit: () =>
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
    );
  }
}
