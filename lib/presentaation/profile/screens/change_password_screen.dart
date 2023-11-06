import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/domain/request/profile/edit_password_request.dart';
import 'package:commmercial_directory_seller/presentaation/profile/bloc/profile_bloc.dart';
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

import '../../widgets/costume_button.dart';
import '../../widgets/input_text_field.dart';

final _formKey = GlobalKey<FormState>();

class ChangePasswordScreen extends HookWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final oldPassword = useTextEditingController();
    final newPassword = useTextEditingController();
    final confirmNewPassword = useTextEditingController();
    return BlocProvider(
      create: (context) => ProfileBloc(
        changePasswordUseCase: sl(),
      ),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (error) {
              AlertController.show("", error!, TypeAlert.error);
            },
            succes: () {
              AlertController.show("", "msg", TypeAlert.success);
              context.pop();
            },
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("change_password").tr(),
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
                      label: "Current_Password".tr(),
                      hint: "Current_Password".tr(),
                      prefixIcon: const Icon(
                        Icons.key,
                        color: AppTheme.secondaryColor,
                        size: 30,
                      ),
                      controller: oldPassword,
                      validator: passwordValidator,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Text(
                      "new_password",
                      style: TextStyle(fontSize: 16),
                    ).tr(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Builder(builder: (context) {
                      bool visible = false;
                      return StatefulBuilder(builder: (context, setState) {
                        return TextFormField(
                            textInputAction: TextInputAction.next,
                            obscureText: !visible,
                            decoration: InputDecoration(
                                hintText: "new_password".tr(),
                                suffix: GestureDetector(
                                  onTap: () => setState(() {
                                    visible = !visible;
                                  }),
                                  child: visible
                                      ? const Icon(Ionicons.eye)
                                      : const Icon(Ionicons.eye_off),
                                ),
                                prefixIcon: const Icon(Icons.key)),
                            controller: newPassword,
                            validator: passwordValidator);
                      });
                    }),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Text(
                      "password_confirmation",
                      style: TextStyle(fontSize: 16),
                    ).tr(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Builder(builder: (context) {
                      bool visible = false;
                      return StatefulBuilder(builder: (context, setState) {
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
                          controller: confirmNewPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please_enter_password_confirmation".tr();
                            }
                            if (value != newPassword.text) {
                              return "password_confirmation_doesn't_match".tr();
                            }
                            return null;
                          },
                        );
                      });
                    }),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return custombuttom(
                              child: state.maybeWhen(
                                orElse: () => const Text('edit').tr(),
                                loading: () =>
                                    LoadingAnimationWidget.prograssiveDots(
                                        color: Colors.white, size: 30),
                              ),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<ProfileBloc>()
                                      .add(ProfileEvent.changePassword(
                                          request: EditPasswordRequest(
                                        newPassword: newPassword.text,
                                        oldPassword: oldPassword.text,
                                        newPasswordConfirmation:
                                            confirmNewPassword.text,
                                      )));
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
      ),
    );
  }
}
