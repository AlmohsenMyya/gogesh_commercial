import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_password_request.dart';
import 'package:commmercial_directory_seller/presentaation/auth/bloc/auth_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/profile/bloc/profile_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/input_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

final _formKey = GlobalKey<FormState>();

class ChangeEmailScreen extends HookWidget {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);
    final String? email = user?.email;
    final emailcontroller = useTextEditingController(text: email);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error, errorState) {
            AlertController.show("", error?.tr() ?? '', TypeAlert.error);
          },
          emailValid: () {
            context.pushNamed(
              Routes.emailConfirmationProfile.name,
              queryParameters: {
                "email": emailcontroller.text,
              },
            );
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("edit_email").tr(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTextField(
                      label: "email".tr(),
                      hint: "email".tr(),
                      suffixIcon: const Icon(
                        Icons.mail_outline,
                        color: AppTheme.secondaryColor,
                        size: 30,
                      ),
                      inputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please_enter_email".tr();
                        }
                        if (isEmail(emailcontroller.text)) {
                          return null;
                        }
                        return "please_enter_valid_email".tr();
                      }),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return custombuttom(
                            child: state.maybeWhen(
                              orElse: () => const Text('edit').tr(),
                              resendingEmail: () =>
                                  LoadingAnimationWidget.prograssiveDots(
                                      color: Colors.white, size: 30),
                            ),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                 if (email == emailcontroller.text) {
                                 AlertController.show(
                                      "",
                                      "please_enter_anouther_email".tr(),
                                      TypeAlert.warning);
                                  return;
                                 }
                                context.read<AuthBloc>().add(
                                    AuthEvent.resendEmailConfirmationCode(
                                        email: emailcontroller.text));
                               
                                // FocusScopeNode currentFocus =
                                //     FocusScope.of(context);

                                // if (!currentFocus.hasPrimaryFocus) {
                                //   currentFocus.unfocus();
                                // }
                              }
                            });
                      },
                    ),
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
