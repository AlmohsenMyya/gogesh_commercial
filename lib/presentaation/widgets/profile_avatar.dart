import 'package:flutter/material.dart';

import '../../Utils.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(
      {required this.width,
      required this.height,
      required this.style,
      required this.firstName,
      required this.lastName,
      this.color,
      super.key});
  final String firstName;
  final String lastName;
  final TextStyle style;
  final Color? color;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    final first = firstName[0].toUpperCase();
    final last = lastName[0].toUpperCase();
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey.withOpacity(0.6),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "$first$last",
          style: style,
        ),
      ),
    );
  }
}
