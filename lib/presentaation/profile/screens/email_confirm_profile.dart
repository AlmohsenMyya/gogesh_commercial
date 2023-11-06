import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/presentaation/auth/bloc/auth_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/profile/bloc/profile_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../Utils.dart';
import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../assets.dart';

class EmailConfirmationProfileScreen extends HookWidget {
  const EmailConfirmationProfileScreen({required this.email, Key? key})
      : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          emailConfirmed: () {
            context
                .read<ProfileBloc>()
                .add(ProfileEvent.changeEmail(email: email));
            
            return context.goNamed(Routes.me.name, extra: true);
          },
          emailValid: () => SmartDialog.showToast("code_sent".tr()),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("confirm_email_address").tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    SvgPicture.asset(
                      Assets.assets_onboarding_email_confirmation_svg,
                      height: 20.h,
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    const Text(
                      "the_code_has_been_sent_to_your_email",
                    ).tr(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getShortenedEmail(email),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    PinInputTextField(
                      decoration: BoxLooseDecoration(
                        strokeColorBuilder: PinListenColorBuilder(
                            Colors.green, AppTheme.secondaryColor),
                      ),
                      pinLength: 6,
                      controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (code) {
                        if (code.length == 6) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      },
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) => current.maybeWhen(
                        orElse: () => false,
                        error: (error, errorState) => true,
                      ),
                      builder: (context, state) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: state.maybeWhen(
                            orElse: () => const SizedBox(),
                            error: (error, errorState) => Text(
                              error ?? '',
                              style: const TextStyle(color: Colors.red),
                            ).tr(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: custombuttom(onTap: () {
                        context.read<AuthBloc>().add(AuthEvent.confirmEmail(
                            email: email, code: controller.text));
                      }, child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => Text(
                              "confirm",
                              style: GoogleFonts.cairo(),
                            ).tr(),
                            loading: () =>
                                LoadingAnimationWidget.prograssiveDots(
                                    color: AppTheme.primaryColor, size: 20.sp),
                          );
                        },
                      )),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "did_not_receive_your_code",
                          style: TextStyle(fontSize: 16),
                        ).tr(),
                        TextButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                AuthEvent.resendEmailConfirmationCode(
                                    email: email));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: AppTheme.orange),
                          child: const Text("resend").tr(),
                        ),
                      ],
                    ),
                    const Expanded(
                      flex: 4,
                      child: SizedBox(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
