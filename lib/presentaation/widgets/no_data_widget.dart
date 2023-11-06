import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget(
      {required this.message, super.key});
  // final VoidCallback tryAgain;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.assets_icons_no_data_svg,
          width: 150,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          message,
          style: const TextStyle(fontSize: 18),
        ).tr()
      ],
    );
  }
}