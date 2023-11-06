import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({required this.tryAgain, super.key});
  final VoidCallback tryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.assets_icons_network_error_svg,
          width: 150,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "there_is_no_internet_connection",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ).tr(),
        const Text(
          "connect_to_internet_and_try_again",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ).tr(),
        OutlinedButton(
            onPressed: tryAgain,
            child: const Text(
              "try_again",
            ).tr())
      ],
    );
  }
}