import 'dart:math';

import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/app/router.dart';
import 'package:commmercial_directory_seller/assets.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:commmercial_directory_seller/domain/request/payment/payment_request.dart';
import 'package:commmercial_directory_seller/presentaation/payment/payment_bloc/payment_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'data/local_data_source/local_data_keys.dart';
import 'data/local_data_source/local_data_source.dart';

final ImagePicker picker = ImagePicker();

Future<List<XFile>> pickMultiImage() async {
  List<XFile> adImage = await picker.pickMultiImage();
  print(adImage);
  return adImage;
}

Future<String?> pickVideo(ImageSource source) async {
  XFile? adImage = await picker.pickVideo(source: source);
  final fileName = await VideoThumbnail.thumbnailFile(
    video: adImage!.path,
    imageFormat: ImageFormat.PNG,
    quality: 100,
  );
  return fileName;
}

Future<XFile?> pickImage(ImageSource source) async {
  XFile? adImage = await picker.pickImage(source: source);
  print(adImage);
  return adImage;
}

saveLocale(String language) async {
  await sl<LocalDataSource>().setValue(LocalDataKeys.languageKey, language);
  print(sl<LocalDataSource>().getValue(LocalDataKeys.languageKey));
}

bool isEmailValid(String email) {
  // Regular expression pattern for email validation
  String pattern = r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}

bool isHourValid(String hour) {
  String pattern = r'^([01]\d|2[0-3]):([0-5]\d)$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(hour);
}

String typeUrl(String value) {
  Uri uri = Uri.parse(value);

  String domain = uri.host;

  List<String> domainParts = domain.split('.');

  String type = domainParts[1];
  return type[0].toUpperCase() + type.substring(1);
}

Color getRandomColor() {

  final Random random = Random();
  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);

  // Ensure that the generated color is not white
  while (red > 220 && green > 220 && blue > 220) {
    red = random.nextInt(256);
    green = random.nextInt(256);
    blue = random.nextInt(256);
  }

  return Color.fromRGBO(red, green, blue, 0.5);
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "please_enter_password".tr();
  } else if (!RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&-])[A-Za-z\d@$!%*?&-]{8,}$')
      .hasMatch(value)) {
    if (value.length < 8) {
      return "Password_must_be_at_least_8_characters_long.".tr();
    }
    return "password_invalid".tr();
  } else {
    return null;
  }
}

String? firstNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "please_enter_first_name".tr();
  } else if (value.length < 3) {
    return "the_first_name_must_be_at_least_3_characters".tr();
  } else {
    return null;
  }
}

String? lastNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "please_enter_last_name".tr();
  } else if (value.length < 3) {
    return "the_last_name_must_be_at_least_3_characters".tr();
  } else {
    return null;
  }
}

String? reasonValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please_enter_a_modification_reason".tr();
  } else if (value.length < 3) {
    return "the_last_name_must_be_at_least_3_characters".tr();
  } else {
    return null;
  }
}

String? googleMapsValidator(String? value) {
  final RegExp googleMapsLocationPattern = RegExp(
    r'@(-?\d+\.\d+),(-?\d+\.\d+)',
    caseSensitive: false,
  );
  String googleMapsUrl = value ?? "";
  if (value == null || value.isEmpty) {
    Match? match = googleMapsLocationPattern.firstMatch(googleMapsUrl);

    if (match != null) {
      double latitude = double.parse(match.group(1)!);
      double longitude = double.parse(match.group(2)!);

      return null;
    } else {
      return "please_enter_url_valid".tr();
    }
  } else {
    return "please_enter_url_valid".tr();
  }
}

String? nameAccountValidator(String? value, bool condition) {
  if (value == null || value.isEmpty && condition) {
    return "please_enter_name_account".tr();
  } else if (value.length < 3 && condition) {
    return "the_name_account_must_be_at_least_3_characters".tr();
  } else {
    return null;
  }
}

String? urlValidator(String? url, String name) {
  if (name.isNotEmpty) {
    if (url == null || url.isEmpty) {
      return "please_enter_url_account";
    } else {
      if (isURL(url)) {
        return null;
      }
      return "please_enter_url_valid".tr();
    }
  }
  return null;
}

Future<dynamic> dialogPayment(BuildContext context, double amount, String type,
    int? packageId, int? offerId, int? adsId) {
  return SmartDialog.show(
    builder: (_) {
      return Container(
        height: 70.h,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "methoud_payment",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ).tr(),
              SizedBox(
                height: 3.h,
              ),
              SvgPicture.asset(
                Assets.assets_icons_payment_svg,
                height: 35.h,
                width: 35.w,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    style:
                        TextButton.styleFrom(padding: const EdgeInsets.all(5)),
                    onPressed: () async {
                      SmartDialog.dismiss();

                      context.pushNamed(Routes.paypalscreen.name);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text("Paypal").tr(),
                              SizedBox(
                                width: 1.h,
                              ),
                              const Icon(Ionicons.logo_paypal)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  TextButton(
                    style:
                        TextButton.styleFrom(padding: const EdgeInsets.all(5)),
                    onPressed: () async {
                      SmartDialog.dismiss();
                      context.read<PaymentBloc>().add(
                            PaymentEvent.addPayment(
                              request: PaymentRequest(
                                amount: amount,
                                type: type,
                                adsId: adsId,
                                offerId: offerId,
                                packageId: packageId,
                              ),
                            ),
                          );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            Assets.assets_icons_Stripe__company__Logo_wine_svg,
                            color: Colors.white,
                            height: 4.h,
                            width: 7.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer()
              //  Text("Available payment methods")
            ],
          ),
        ),
      );
    },
  );
  // showDialog(
  //   context: context,
  //   builder: (context) {
  //     return AlertDialog(
  //       title: const Text('methoud_payment').tr(),
  //       content: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           TextButton(
  //             style: TextButton.styleFrom(padding: const EdgeInsets.all(5)),
  //             onPressed: () async {
  //               await context
  //                   .pushNamed(Routes.paypalscreen.name)
  //                   .then((value) => context.pop());
  //             },
  //             child: Row(
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Row(
  //                     children: [
  //                       const Text("Paypal").tr(),
  //                       SizedBox(
  //                         width: 1.h,
  //                       ),
  //                       const Icon(Ionicons.logo_paypal)
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             width: 5.h,
  //           ),
  //           TextButton(
  //             style: TextButton.styleFrom(padding: const EdgeInsets.all(5)),
  //             onPressed: () async {
  //               context.read<PaymentBloc>().add(
  //                     PaymentEvent.addPayment(
  //                       request: PaymentRequest(
  //                         amount: amount,
  //                         type: type,
  //                         packageId: packageId,
  //                       ),
  //                     ),
  //                   );

  //               context.pop();
  //             },
  //             child: Row(
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: SvgPicture.asset(
  //                     Assets.assets_icons_Stripe__company__Logo_wine_svg,
  //                     color: Colors.white,
  //                     height: 4.h,
  //                     width: 7.h,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   },
  // );
}

extension IMAGE on String? {
  String toImageOrEmpty() {
    final imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp'];
    if (this == null) return "";
    for (final extension in imageExtensions) {
      if (this!.toLowerCase().endsWith(extension)) {
        return this!;
      }
    }
    return "";
  }
}

String getShortenedEmail(String email) {
  List<String> parts = email.split('@');
  String username = parts[0];
  int maxLength = 5; // Adjust this based on your preference

  if (username.length > maxLength) {
    return '${username.substring(0, maxLength)}...';
  }

  return username;
}

List<TypeCompanty> type = [
  TypeCompanty(
      name: "licensed_companies".tr(),
      type: Type.Company,
      icon: const Icon(Iconsax.bank)),
  TypeCompanty(
      name: "personal_projects".tr(),
      type: Type.Personal,
      icon: const Icon(Iconsax.user))
];
