import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/presentaation/profile/screens/profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({ super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('security').tr(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                ProfileItem(
                  onTap: () => context.pushNamed(Routes.changePassword.name),
                  title: 'change_password'.tr(),
                  leading: const Icon(Icons.security),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                ProfileItem(
                  onTap: () =>
                      context.pushNamed(Routes.editEmail.name,),
                  title: "edit_email".tr(),
                  leading: const Icon(Icons.email_outlined),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
