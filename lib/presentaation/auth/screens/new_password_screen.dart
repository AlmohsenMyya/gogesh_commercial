import 'package:commmercial_directory_seller/domain/request/auth/reset_password_request.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../widgets/costume_button.dart';
import '../../widgets/input_text_field.dart';
import '../bloc/auth_bloc.dart';

final _formKey = GlobalKey<FormState>();

class NewPasswordScreen extends HookWidget {
  const NewPasswordScreen({required this.code, Key? key}) : super(key: key);
  final String code;
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error,e) => AlertController.show("", error!, TypeAlert.error),
          success: (msg) {
            AlertController.show("", msg!, TypeAlert.success);

            context.goNamed(
              Routes.logIn.name,
            );
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "new_password",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ).tr(),
                Form(
                  key: _formKey,
                  child: InputTextField(
                    label: "password".tr(),
                    hint: "password".tr(),
                    controller: controller,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }
                      return "please_enter_password".tr();
                    },
                  ),
                ),
                SizedBox(height: 5.h),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: custombuttom(
                          child: state.maybeWhen(
                            orElse: () => const Text("send").tr(),
                            loading: () =>
                                LoadingAnimationWidget.prograssiveDots(
                              color: AppTheme.primaryColor,
                              size: 20.sp,
                            ),
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                  AuthEvent.resetpassword(
                                      request: ResetPasswordRequest(
                                          code: code,
                                          password: controller.text,
                                          passwordConfirm: controller.text)));
                            }
                          }),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
