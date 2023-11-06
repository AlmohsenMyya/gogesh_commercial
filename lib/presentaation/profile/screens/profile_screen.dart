import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/profile_avatar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../app/theme.dart';
import '../../../assets.dart';
import '../../main/bloc/bottom_nav_cubit.dart';
import '../bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({required this.state, Key? key}) : super(key: key);
  final bool state;
  @override
  Widget build(BuildContext context) {
    if (state) {
      context.read<ProfileBloc>().add(const ProfileEvent.loadedProfile());
    }
    String email = '';
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //       onPressed: () {
        //         context.read<SideMenuCubit>().sideMenuActionTaken();
        //       },
        //       icon: const Icon(Icons.menu)),
        //   title: const Text("me").tr(),
        //   centerTitle: true,
        //   // actions: [
        //   //   TextButton(
        //   //     onPressed: () {},
        //   //     style: TextButton.styleFrom(
        //   //         backgroundColor: Colors.transparent,
        //   //         foregroundColor: Colors.grey),
        //   //     child: const Text("edit").tr(),
        //   //   ),
        //   // ],
        // ),
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (previous, current) => current.maybeWhen(
                orElse: () => false,
                loading: () => true,
                error: (error) => true,
                loaded: (data) => true,
              ),
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loading: () => Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            CachedNetworkImage(
                              imageUrl: "https://i.pravatar.cc",
                              imageBuilder: (ctx, imageProvider) {
                                return Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Colors.grey, width: 8),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      )),
                                );
                              },
                              placeholder: (_, __) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade200,
                                highlightColor: Colors.grey.shade50,
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              height: 2.h,
                              width: 10.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(2.h)),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              height: 2.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(2.h)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                  error: (value) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(value ?? "something_went_error").tr(),
                      SizedBox(
                        height: 2.h,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          context
                              .read<ProfileBloc>()
                              .add(const ProfileEvent.loadedProfile());
                        },
                        child: const Text("try_again"),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                  loaded: (value) {
                    email = value.data.email ?? '';
                    print(email);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: value.data.image ?? "",
                              imageBuilder: (ctx, imageProvider) {
                                return Container(
                                  height: 10.h,
                                  width: 10.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Colors.grey, width: 8),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      )),
                                );
                              },
                              errorWidget: (context, url, error) =>
                                  ProfileAvatar(
                                height: 10.h,
                                width: 10.h,
                                lastName: value.data.lastName ?? '',
                                firstName: value.data.firstName ?? '',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              placeholder: (_, __) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade200,
                                highlightColor: Colors.grey.shade50,
                                child: Container(
                                  height: 10.h,
                                  width: 10.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   bottom: -1.h,
                            //   left: -1.h,
                            //   child: IconButton(
                            //       onPressed: () {
                            //         // context.read<AuthBloc>().add(
                            //         //     const AuthEvent.uploadImage(
                            //         //         source: ImageSource.gallery));
                            //       },
                            //       style: const ButtonStyle(
                            //           padding: MaterialStatePropertyAll(
                            //               EdgeInsets.zero)),
                            //       icon: SvgPicture.asset(
                            //         Assets.assets_icons_edit_svg,
                            //         width: 40,
                            //         height: 40,
                            //       )),
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "${value.data.firstName!} ${value.data.lastName!}",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15.sp),
                        ),
                        Text(
                          value.data.phone ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return ProfileItem(
                  title: 'edit_profile'.tr(),
                  leading: const Icon(Icons.person_outline_rounded),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () async {
                    await context
                        .pushNamed(
                          Routes.editProfile.name,
                        )
                        .then(
                          (value) => context.read<ProfileBloc>().add(
                                const ProfileEvent.loadedProfile(),
                              ),
                        );
                  },
                );
              },
            ),
            ProfileItem(
              onTap: () => context.pushNamed(
                Routes.securityscreen.name,
              ),
              title: 'security'.tr(),
              leading: const Icon(Icons.security),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            ProfileItem(
              title: "Notification_settings".tr(),
              leading: const Icon(Icons.notifications_none_rounded),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                hint: Row(
                  children: [
                    const Icon(Icons.language_outlined),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "language".tr(),
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ).tr(),
                  ],
                ),
                items: ["ar".tr(), "en".tr()]
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Row(
                            children: [
                              Image.asset(
                                e == "ar"
                                    ? Assets.assets_icons_saudi_arabia_png
                                    : Assets.assets_icons_usa_png,
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                {
                                      "ar": "arabic".tr(),
                                      "en": "english".tr()
                                    }[e] ??
                                    "",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
                value: context.locale.languageCode,
                onChanged: (v) {
                  saveLocale(v!);
                  context.setLocale(Locale(v));
                  context.read<BottomNavCubit>().changeIndex(0);
                },
                iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    iconEnabledColor: AppTheme.secondaryColor),
                buttonStyleData: const ButtonStyleData(
                  height: 40,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
              ),
            ),
            ProfileItem(
              title: 'dark_mood'.tr(),
              leading: const Icon(Icons.dark_mode_outlined),
              trailing: SizedBox(
                width: 35,
                child: Builder(builder: (context) {
                  bool value = false;
                  return StatefulBuilder(builder: (context, setState) {
                    return Switch(
                      value: value,
                      onChanged: (v) {
                        setState(() => value = v);
                      },
                      activeColor: AppTheme.secondaryColor,
                    );
                  });
                }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {Key? key,
      this.onTap,
      required this.title,
      required this.leading,
      required this.trailing})
      : super(key: key);
  final String title;
  final Widget leading;
  final Widget trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            leading,
            SizedBox(
              width: 4.w,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            const Expanded(child: SizedBox()),
            trailing
          ],
        ),
      ),
    );
  }
}
