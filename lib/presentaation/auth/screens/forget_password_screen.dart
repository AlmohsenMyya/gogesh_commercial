import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/domain/request/auth/forget_password_request.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

import '../../../Utils.dart';
import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../widgets/costume_button.dart';
import '../../widgets/input_text_field.dart';
import '../bloc/auth_bloc.dart';

class ForgetPasswordScreen extends HookWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error, e) =>
              AlertController.show("", error!, TypeAlert.error),
          success: (msg) {
            AlertController.show("", msg!, TypeAlert.success);
            context.goNamed(
              Routes.resetPasswordCode.name,
              queryParameters: {"email": email.text},
            );
          },
        );
      },
      child: WillPopScope(
        onWillPop: () async {
          context.read<AuthBloc>().add(const AuthEvent.resetState());
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () async {
                  context.read<AuthBloc>().add(const AuthEvent.resetState());
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  const Text(
                    "find_your_account",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ).tr(),
                  const Text(
                    "enter_your_email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ).tr(),
                  Form(
                    key: _formKey,
                    child: InputTextField(
                      inputType: TextInputType.emailAddress,
                      suffixIcon: const Icon(
                        Icons.mail_outline,
                        color: AppTheme.secondaryColor,
                        size: 30,
                      ),
                      label: '',
                      hint: "email".tr(),
                      controller: email,
                      validator: (value) {
                        if (isEmail(email.text)) {
                          return null;
                        } else {
                          if (value == null || value.isEmpty) {
                            return "please_enter_email".tr();
                          } else {
                            return "please_enter_valid_email".tr();
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: custombuttom(
                            child: state.maybeWhen(
                              orElse: () => const Text("find_account").tr(),
                              loading: () =>
                                  LoadingAnimationWidget.prograssiveDots(
                                color: AppTheme.primaryColor,
                                size: 20.sp,
                              ),
                            ),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthEvent.forgetpassword(
                                      request: ForgetPasswordRequest(
                                          email: email.text),
                                    ));
                              }
                            }),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
