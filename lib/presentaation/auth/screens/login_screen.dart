import 'package:commmercial_directory_seller/domain/request/auth/login/login_request.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

import '../../../Utils.dart';
import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../bloc/auth_bloc.dart';

class LogInScreen extends HookWidget {
  LogInScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TypeSeller? type = TypeSeller.admin;
  @override
  Widget build(BuildContext context) {
    sl<LocalDataSource>().setValue(LocalDataKeys.role, TypeSeller.admin.name);
    saveLocale(context.locale.languageCode);

    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    final email = useTextEditingController();
    final password = useTextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            socialRegistered: (msg) {
              context.goNamed(Routes.home.name);
            },
            error: (error, e) =>
                AlertController.show("", error!, TypeAlert.error),
            logedIn: (value) {
              context.goNamed(Routes.home.name);
            },
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 13.h,
                          height: 13.h,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        // const Expanded(child: SizedBox()),
                        const Text(
                          "login_to_your_account",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600),
                        ).tr(),
                        SizedBox(
                          height: 2.h,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    emailError: (error) => TextFormField(
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          hintText: "email".tr(),
                                          suffixIcon: const Icon(
                                            Icons.mail_outline,
                                            color: AppTheme.secondaryColor,
                                            size: 30,
                                          ),
                                          errorText: error),
                                      controller: email,
                                      validator: (value) {
                                        if (isEmail(email.text)) {
                                          return null;
                                        } else {
                                          if (value == null || value.isEmpty) {
                                            return "please_enter_email".tr();
                                          } else {
                                            return "please_enter_valid_email"
                                                .tr();
                                          }
                                        }
                                      },
                                    ),
                                    orElse: () => TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        hintText: "email".tr(),
                                        suffixIcon: const Icon(
                                          Icons.mail_outline,
                                          color: AppTheme.secondaryColor,
                                          size: 30,
                                        ),
                                      ),
                                      controller: email,
                                      validator: (value) {
                                        if (isEmail(email.text)) {
                                          return null;
                                        } else {
                                          if (value == null || value.isEmpty) {
                                            return "please_enter_email".tr();
                                          } else {
                                            return "please_enter_valid_email"
                                                .tr();
                                          }
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    passworderror: (error) =>
                                        Builder(builder: (context) {
                                      bool visible = false;

                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                        return TextFormField(
                                          textInputAction: TextInputAction.next,
                                          autofocus: !visible,
                                          decoration: InputDecoration(
                                              hintText: "password".tr(),
                                              errorText: error,
                                              suffix: GestureDetector(
                                                onTap: () => setState(() {
                                                  visible = !visible;
                                                }),
                                                child: visible
                                                    ? const Icon(Ionicons.eye)
                                                    : const Icon(
                                                        Ionicons.eye_off),
                                              ),
                                              prefixIcon:
                                                  const Icon(Icons.key)),
                                          controller: password,
                                          validator: passwordValidator,
                                        );
                                      });
                                    }),
                                    orElse: () => Builder(builder: (context) {
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
                                                    : const Icon(
                                                        Ionicons.eye_off),
                                              ),
                                              prefixIcon:
                                                  const Icon(Icons.key)),
                                          controller: password,
                                          validator: passwordValidator,
                                        );
                                      });
                                    }),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.goNamed(Routes.resetPassword.name);
                                },
                                child: const Text(
                                  "forget_password",
                                ).tr(),
                              ),
                              const SizedBox.shrink(),
                              StatefulBuilder(
                                builder: (context, setState) {
                                  return Row(
                                    children: [
                                      const Expanded(child: SizedBox()),
                                      Checkbox(
                                        activeColor: AppTheme.secondaryColor,
                                        value: type == TypeSeller.admin,
                                        onChanged: (v) {
                                          setState(() {
                                            type = v! ? TypeSeller.admin : null;
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.5.h)),
                                      ),
                                      const Text("admin").tr(),
                                      const Expanded(child: SizedBox()),
                                      Checkbox(
                                        activeColor: AppTheme.secondaryColor,
                                        value: type == TypeSeller.assistant,
                                        onChanged: (v) {
                                          setState(() {
                                            type = v!
                                                ? TypeSeller.assistant
                                                : null;
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.5.h)),
                                      ),
                                      const Text("assistant").tr(),
                                      const Expanded(child: SizedBox()),
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: double.infinity,
                              child: custombuttom(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (type == null) {
                                      AlertController.show(
                                          "",
                                          "please_choose_type_account".tr(),
                                          TypeAlert.warning);
                                      return;
                                    }
                                    if (type == TypeSeller.admin) {
                                      await sl<LocalDataSource>()
                                          .setValue(LocalDataKeys.role,
                                              TypeSeller.admin.name)
                                          .then((value) async => context
                                              .read<AuthBloc>()
                                              .add(AuthEvent.login(
                                                request: LoginRequest(
                                                  fcmToken:
                                                      await firebaseMessaging
                                                          .getToken(),
                                                  email: email.text,
                                                  password: password.text,
                                                ),
                                              )));

                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      return;
                                    }
                                    if (type == TypeSeller.assistant) {
                                      await sl<LocalDataSource>()
                                          .setValue(LocalDataKeys.role,
                                              TypeSeller.assistant.name)
                                          .then((value) async => context
                                              .read<AuthBloc>()
                                              .add(AuthEvent.loginAssistant(
                                                request: LoginRequest(
                                                  fcmToken:
                                                      await firebaseMessaging
                                                          .getToken(),
                                                  email: email.text,
                                                  password: password.text,
                                                ),
                                              )));
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      return;
                                    }
                                  }
                                },
                                child: state.maybeWhen(
                                  orElse: () => const Text("login").tr(),
                                  loading: () =>
                                      LoadingAnimationWidget.prograssiveDots(
                                          color: AppTheme.primaryColor,
                                          size: 20.sp),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              color: Colors.grey,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "or",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ).tr(),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                                child: Divider(
                              color: Colors.grey,
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  fixedSize: const Size(0, 45),
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: AppTheme.secondaryColor,
                                  padding: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Colors.grey.shade300))),
                              child: const Icon(
                                Ionicons.logo_facebook,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<AuthBloc>()
                                    .add(const AuthEvent.signUpGoogle());
                              },
                              style: TextButton.styleFrom(
                                  fixedSize: const Size(0, 45),
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: AppTheme.secondaryColor,
                                  padding: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Colors.grey.shade300))),
                              child: const Icon(
                                Ionicons.logo_google,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  fixedSize: const Size(0, 45),
                                  foregroundColor: AppTheme.secondaryColor,
                                  backgroundColor: Colors.transparent,
                                  padding: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Colors.grey.shade300))),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Ionicons.logo_apple,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        //const Expanded(child:
                        SizedBox(
                          height: 7.h,
                        ),
                        //),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("don't_have_an_account").tr(),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<AuthBloc>()
                                    .add(const AuthEvent.resetState());

                                // sl<LocalDataSource>().setValue(
                                //     LocalDataKeys.userType, UserType.gust);
                                context.goNamed(Routes.signUp.name);
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.grey),
                              child: const Text(
                                "sing_up",
                                style: TextStyle(color: AppTheme.green),
                              ).tr(),
                            ),
                          ],
                        )
                      ],
                    ),
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

enum TypeSeller { admin, assistant }
