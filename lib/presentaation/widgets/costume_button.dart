import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



/////////////////////////////////
class custombuttom extends StatelessWidget {
  // final String hint;
  final Color? color;
  final VoidCallback onTap;
  final Widget child;

  custombuttom(
      { this.color, required this.onTap, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: color,
      ),
      child: child,
    );
  }
}
