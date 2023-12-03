import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:commmercial_directory_seller/domain/request/company/edit_social_account.dart';
import 'package:commmercial_directory_seller/presentaation/activity_project/social_account_bloc/social_account_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/register_company/widget/custome_text_field.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/network_error_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';
// import 'package:string_validator/string_validator.dart';

import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/social_account_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/input_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class EditSocialAccount extends HookWidget {
  EditSocialAccount({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  //final RegisterPartTwoSeller information;
  @override
  Widget build(BuildContext context) {
    final nameFacebook = useTextEditingController();
    final urlFacebook = useTextEditingController();
    final nameWhatsapp = useTextEditingController();
    final urlWhatsapp = useTextEditingController();
    final nameInstagram = useTextEditingController();
    final urlInstagram = useTextEditingController();
    final nameTwitter = useTextEditingController();
    final urlTwitter = useTextEditingController();
    final nameYoutube = useTextEditingController();
    final urlYoutube = useTextEditingController();
    ProfileEntity? user = sl<LocalDataSource>().getValue(LocalDataKeys.profile);
    Upgraded? upgraded = user?.upgraded;
    if (user != null) {
      if (upgraded != null) {
        if (upgraded.socialAccounts!= null && upgraded.socialAccounts!.isNotEmpty) {
          if (upgraded.socialAccounts!.any(
            (element) => element.type == "Facebook",
          )) {
            for (var element in upgraded.socialAccounts!) {
              element.type == "Facebook"
                  ? () {
                      print("******************");
                      nameFacebook.text = element.name;
                      urlFacebook.text = element.url;
                    }()
                  : null;
            }
          }
          if (upgraded.socialAccounts!.any(
            (element) => element.type == "Whatsapp",
          )) {
            for (var element in upgraded.socialAccounts!) {
              element.type == "Whatsapp"
                  ? () {
                      nameWhatsapp.text = element.name;
                      urlWhatsapp.text = element.url;
                    }()
                  : null;
            }
          }
          if (upgraded.socialAccounts!.any(
            (element) => element.type == "Instagram",
          )) {
            for (var element in upgraded.socialAccounts!) {
              element.type == "Instagram"
                  ? () {
                      nameInstagram.text = element.name;
                      urlInstagram.text = element.url;
                    }()
                  : null;
            }
          }
          if (upgraded.socialAccounts!.any(
            (element) => element.type == "Twitter",
          )) {
            for (var element in upgraded.socialAccounts!) {
              element.type == "Twitter"
                  ? () {
                      nameTwitter.text = element.name;
                      urlTwitter.text = element.url;
                    }()
                  : null;
            }
          }
          if (upgraded.socialAccounts!.any(
            (element) => element.type == "Youtube",
          )) {
            for (var element in upgraded.socialAccounts!) {
              element.type == "Youtube"
                  ? () {
                      nameYoutube.text = element.name;
                      urlYoutube.text = element.url;
                    }()
                  : null;
            }
          }
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contact_information").tr(),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          InputTextField(
                            label: "name_account_facebook",
                            hint: "name_account_facebook",
                            textInputAction: TextInputAction.next,
                            controller: nameFacebook,
                            validator: (p0) {
                              return nameAccountValidator(p0, true);
                            },
                            suffixIcon: const Icon(Ionicons.logo_facebook),
                          ),
                          InputTextField(
                            label: "url_account_facebook",
                            hint: "url_account_facebook",
                            textInputAction: TextInputAction.next,
                            controller: urlFacebook,
                            suffixIcon: const Icon(Ionicons.logo_facebook),
                            validator: (value) {
                              return urlValidator(value, nameFacebook.text);
                            },
                          ),
                          InputTextField(
                            label: "name_account_what_sap",
                            hint: "name_account_what_sap",
                            textInputAction: TextInputAction.next,
                            controller: nameWhatsapp,
                            suffixIcon: const Icon(Ionicons.logo_whatsapp),
                            validator: (p0) {
                              return nameAccountValidator(p0, true);
                            },
                          ),
                          InputTextField(
                            label: "url_account_what_sap",
                            hint: "url_account_what_sap",
                            textInputAction: TextInputAction.next,
                            controller: urlWhatsapp,
                            suffixIcon: const Icon(Ionicons.logo_whatsapp),
                            validator: (value) {
                              return urlValidator(value, nameWhatsapp.text);
                            },
                          ),
                          InputTextField(
                            label: "name_account_instagram",
                            hint: "name_account_instagram",
                            textInputAction: TextInputAction.next,
                            suffixIcon: const Icon(Ionicons.logo_instagram),
                            controller: nameInstagram,
                            validator: (p0) {
                              return nameAccountValidator(p0, true);
                            },
                          ),
                          InputTextField(
                            label: "url_account_instagram",
                            hint: "url_account_instagram",
                            textInputAction: TextInputAction.next,
                            suffixIcon: const Icon(Ionicons.logo_instagram),
                            controller: urlInstagram,
                            validator: (value) {
                              return urlValidator(value, nameInstagram.text);
                            },
                          ),
                          InputTextField(
                            label: "name_account_X",
                            hint: "name_account_X".tr(),
                            textInputAction: TextInputAction.next,
                            controller: nameTwitter,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 2.h),
                              child: Text(
                                "X",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            validator: (p0) {
                              return nameAccountValidator(p0, false);
                            },
                          ),
                          InputTextField(
                            label: "url_account_X",
                            hint: "url_account_X",
                            textInputAction: TextInputAction.next,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 2.h),
                              child: Text(
                                "X",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            controller: urlTwitter,
                            validator: (value) {
                              return urlValidator(value, nameTwitter.text);
                            },
                          ),
                          InputTextField(
                            label: "name_account_youtube",
                            hint: "name_account_youtube",
                            textInputAction: TextInputAction.next,
                            controller: nameYoutube,
                            suffixIcon: const Icon(Ionicons.logo_youtube),
                            validator: (p0) {
                              return nameAccountValidator(p0, false);
                            },
                          ),
                          InputTextField(
                            label: "url_account_youtube",
                            hint: "url_account_youtube",
                            textInputAction: TextInputAction.next,
                            controller: urlYoutube,
                            suffixIcon: const Icon(Ionicons.logo_youtube),
                            validator: (value) {
                              return urlValidator(value, nameYoutube.text);
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: custombuttom(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          List<SocialAccounts> socialAccounts = [];

                          socialAccounts.add(SocialAccounts(
                              name: nameFacebook.text,
                              type: "Facebook",
                              url: urlFacebook.text));
                          socialAccounts.add(SocialAccounts(
                              name: nameWhatsapp.text,
                              type: "Whatsapp",
                              url: urlWhatsapp.text));
                          socialAccounts.add(SocialAccounts(
                              name: nameInstagram.text,
                              type: "Instagram",
                              url: urlInstagram.text));
                          if (nameTwitter.text.isNotEmpty) {
                            socialAccounts.add(SocialAccounts(
                                name: nameTwitter.text,
                                type: "Twitter",
                                url: urlTwitter.text));
                          }
                          if (nameYoutube.text.isNotEmpty) {
                            socialAccounts.add(SocialAccounts(
                                name: nameYoutube.text,
                                type: "Youtube",
                                url: urlYoutube.text));
                          }
                          // context.pushNamed(Routes.selectDays.name,
                          //     extra: RegisterPartTwoSeller(
                          //       price: information.price,
                          //       logo: information.logo,
                          //       specialities: information.specialities,
                          //       seasons: information.seasons,
                          //       socialAccounts: socialAccounts,
                          //     ));
                        }
                      },
                      child: const Text("edit").tr(),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
