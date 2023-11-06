import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/presentaation/auth/bloc/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils.dart';
import '../../../app/theme.dart';
import '../../widgets/costume_button.dart';

class SignUpScreen extends HookWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    final passwordConfirmation = useTextEditingController();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          socialRegistered: (msg) {
            context.goNamed(Routes.completeProfile.name);
          },
          emailValid: () {
            context.pushNamed(
              Routes.emailConfirmation.name,
              extra: true,
              queryParameters: {
                "email": email.text,
                "password": password.text,
              },
            );
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
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          width: 15.h,
                          height: 15.h,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const Text(
                          "create_new_account",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600),
                        ).tr(),
                        SizedBox(
                          height: 2.h,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    error: (error,s) => TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          suffixIcon: const Icon(
                                            Icons.mail_outline,
                                            color: AppTheme.secondaryColor,
                                            size: 30,
                                          ),
                                          hintText: "email".tr(),
                                          errorText: error),
                                      controller: email,
                                      validator: (value) {
                                        if (isEmailValid(email.text)) {
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
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        suffixIcon: const Icon(
                                          Icons.mail_outline,
                                          color: AppTheme.secondaryColor,
                                          size: 30,
                                        ),
                                        hintText: "email".tr(),
                                      ),
                                      controller: email,
                                      validator: (value) {
                                        if (isEmailValid(email.text)) {
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
                                height: 2.h,
                              ),
                              Builder(builder: (context) {
                                bool visible = false;
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return TextFormField(
                                    textInputAction: TextInputAction.next,
                                    obscureText: !visible,
                                    decoration: InputDecoration(
                                        hintText: "password_confirmation".tr(),
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: custombuttom(onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                    AuthEvent.resendEmailConfirmationCode(
                                        email: email.text));
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              }
                            }, child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () => const Text("sing_up").tr(),
                                  resendingEmail: () =>
                                      LoadingAnimationWidget.prograssiveDots(
                                          color: AppTheme.primaryColor,
                                          size: 20.sp),
                                );
                              },
                            ))),
                        SizedBox(
                          height: 2.h,
                        ),
                        Flexible(
                          child: Row(
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
                        const Expanded(child: SizedBox()),
                        Flexible(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("already_have_an_account").tr(),
                            TextButton(
                              onPressed: () {
                                context.goNamed(Routes.logIn.name);
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.grey),
                              child: const Text(
                                "login",
                                style: TextStyle(color: AppTheme.green),
                              ).tr(),
                            ),
                          ],
                        )),
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
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_dropdown_alert/alert_controller.dart';
// import 'package:flutter_dropdown_alert/model/data_alert.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:sizer/sizer.dart';
// import 'package:string_validator/string_validator.dart';

// import '../../../Utils.dart';
// import '../../../app/router.dart';
// import '../../../app/theme.dart';
// import '../../widgets/costume_button.dart';
// import '../bloc/auth_bloc.dart';

// class SignUpScreen extends HookWidget {
//   SignUpScreen({Key? key}) : super(key: key);
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final email = useTextEditingController();
//     final password = useTextEditingController();
//     final passwordConfirmation = useTextEditingController();
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         state.maybeWhen(
//           orElse: () {},
//           registered: (msg) {
//             AlertController.show("", msg!, TypeAlert.success);
//             context.goNamed(Routes.home.name);
//             // context.pushNamed(Routes.registerCompany.name);
//           },
//         );
//       },
//       child: GestureDetector(
//         onTap: () {
//           FocusScopeNode currentFocus = FocusScope.of(context);

//           if (!currentFocus.hasPrimaryFocus) {
//             currentFocus.unfocus();
//           }
//         },
//         child: Scaffold(
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CustomScrollView(
//                 slivers: [
//                   SliverFillRemaining(
//                     hasScrollBody: false,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         Container(
//                           width: 15.h,
//                           height: 15.h,
//                           decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(100)),
//                         ),
//                         const Text(
//                           "create_new_account",
//                           style: TextStyle(
//                               fontSize: 23, fontWeight: FontWeight.w600),
//                         ).tr(),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         Form(
//                           key: _formKey,
//                           child: Column(
//                             children: [
//                               BlocBuilder<AuthBloc, AuthState>(
//                                 builder: (context, state) {
//                                   return state.maybeWhen(
//                                     emailError: (error) => TextFormField(
//                                       textInputAction: TextInputAction.next,
//                                       decoration: InputDecoration(
//                                           hintText: "email".tr(),
//                                           errorText: error),
//                                       controller: email,
//                                       validator: (value) {
//                                         if (isEmail(email.text)) {
//                                           return null;
//                                         } else {
//                                           if (value == null || value.isEmpty) {
//                                             return "please_enter_email".tr();
//                                           } else {
//                                             return "please_enter_valid_email"
//                                                 .tr();
//                                           }
//                                         }
//                                       },
//                                     ),
//                                     orElse: () => TextFormField(
//                                       textInputAction: TextInputAction.next,
//                                       decoration: InputDecoration(
//                                         prefixIcon: const Icon(Icons.email),
//                                         hintText: "email".tr(),
//                                       ),
//                                       controller: email,
//                                       validator: (value) {
//                                         if (isEmail(email.text)) {
//                                           return null;
//                                         } else {
//                                           if (value == null || value.isEmpty) {
//                                             return "please_enter_email".tr();
//                                           } else {
//                                             return "please_enter_valid_email"
//                                                 .tr();
//                                           }
//                                         }
//                                       },
//                                     ),
//                                   );
//                                 },
//                               ),
//                               SizedBox(
//                                 height: 2.h,
//                               ),
//                               BlocBuilder<AuthBloc, AuthState>(
//                                 builder: (context, state) {
//                                   return state.maybeWhen(
//                                     passworderror: (error) =>
//                                         Builder(builder: (context) {
//                                       bool visible = false;

//                                       return StatefulBuilder(
//                                           builder: (context, setState) {
//                                         return TextFormField(
//                                           textInputAction: TextInputAction.next,
//                                           autofocus: !visible,
//                                           decoration: InputDecoration(
//                                               hintText: "password".tr(),
//                                               suffix: GestureDetector(
//                                                 onTap: () => setState(() {
//                                                   visible = !visible;
//                                                 }),
//                                                 child: visible
//                                                     ? const Icon(Ionicons.eye)
//                                                     : const Icon(
//                                                         Ionicons.eye_off),
//                                               ),
//                                               prefixIcon:
//                                                   const Icon(Icons.key)),
//                                           controller: password,
//                                           validator: passwordValidator,
//                                         );
//                                       });
//                                     }),
//                                     orElse: () => Builder(builder: (context) {
//                                       bool visible = false;
//                                       return StatefulBuilder(
//                                           builder: (context, setState) {
//                                         return TextFormField(
//                                           obscureText: !visible,
//                                           textInputAction: TextInputAction.next,
//                                           decoration: InputDecoration(
//                                               hintText: "password".tr(),
//                                               suffix: GestureDetector(
//                                                 onTap: () => setState(() {
//                                                   visible = !visible;
//                                                 }),
//                                                 child: visible
//                                                     ? const Icon(Ionicons.eye)
//                                                     : const Icon(
//                                                         Ionicons.eye_off),
//                                               ),
//                                               prefixIcon:
//                                                   const Icon(Icons.key)),
//                                           controller: password,
//                                           validator: passwordValidator,
//                                         );
//                                       });
//                                     }),
//                                   );
//                                 },
//                               ),
//                               SizedBox(
//                                 height: 2.h,
//                               ),
//                               Builder(builder: (context) {
//                                 bool visible = false;
//                                 return StatefulBuilder(
//                                     builder: (context, setState) {
//                                   return TextFormField(
//                                     textInputAction: TextInputAction.next,
//                                     obscureText: !visible,
//                                     decoration: InputDecoration(
//                                         hintText: "password_confirmation".tr(),
//                                         suffix: GestureDetector(
//                                           onTap: () => setState(() {
//                                             visible = !visible;
//                                           }),
//                                           child: visible
//                                               ? const Icon(Ionicons.eye)
//                                               : const Icon(Ionicons.eye_off),
//                                         ),
//                                         prefixIcon: const Icon(Icons.key)),
//                                     controller: passwordConfirmation,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return "please_enter_password_confirmation"
//                                             .tr();
//                                       }
//                                       if (value != password.text) {
//                                         return "password_confirmation_doesn't_match"
//                                             .tr();
//                                       }
//                                       return null;
//                                     },
//                                   );
//                                 });
//                               }),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         SizedBox(
//                             width: double.infinity,
//                             child: custombuttom(
//                                 onTap: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     context.pushNamed(Routes.fillProfile.name,
//                                         queryParameters: {
//                                           "email": email.text,
//                                           "password": password.text,
//                                           "passwordConfirmation":
//                                               passwordConfirmation.text
//                                         });
//                                   }
//                                 },
//                                 child: const Text("sing_up").tr())),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         Flexible(
//                           child: Row(
//                             children: [
//                               const Expanded(
//                                   child: Divider(
//                                 color: Colors.grey,
//                               )),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               const Text(
//                                 "or",
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.w600),
//                               ).tr(),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               const Expanded(
//                                   child: Divider(
//                                 color: Colors.grey,
//                               )),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             TextButton(
//                               onPressed: () {},
//                               style: TextButton.styleFrom(
//                                   fixedSize: const Size(0, 45),
//                                   backgroundColor: Colors.transparent,
//                                   foregroundColor: AppTheme.secondaryColor,
//                                   padding: const EdgeInsets.all(8),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       side: BorderSide(
//                                           color: Colors.grey.shade300))),
//                               child: const Icon(
//                                 Ionicons.logo_facebook,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 context
//                                     .read<AuthBloc>()
//                                     .add(const AuthEvent.signUpGoogle());
//                               },
//                               style: TextButton.styleFrom(
//                                   fixedSize: const Size(0, 45),
//                                   backgroundColor: Colors.transparent,
//                                   foregroundColor: AppTheme.secondaryColor,
//                                   padding: const EdgeInsets.all(8),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       side: BorderSide(
//                                           color: Colors.grey.shade300))),
//                               child: const Icon(
//                                 Ionicons.logo_google,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             TextButton(
//                               onPressed: () {},
//                               style: TextButton.styleFrom(
//                                   fixedSize: const Size(0, 45),
//                                   foregroundColor: AppTheme.secondaryColor,
//                                   backgroundColor: Colors.transparent,
//                                   padding: const EdgeInsets.all(8),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       side: BorderSide(
//                                           color: Colors.grey.shade300))),
//                               child: const Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Ionicons.logo_apple,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Expanded(child: SizedBox()),
//                         Flexible(
//                             child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text("already_have_an_account").tr(),
//                             TextButton(
//                               onPressed: () {
//                                 context.goNamed(Routes.logIn.name);
//                               },
//                               style: TextButton.styleFrom(
//                                   backgroundColor: Colors.transparent,
//                                   foregroundColor: Colors.grey),
//                               child: const Text(
//                                 "login",
//                                 style: TextStyle(color: AppTheme.green),
//                               ).tr(),
//                             ),
//                           ],
//                         )),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
