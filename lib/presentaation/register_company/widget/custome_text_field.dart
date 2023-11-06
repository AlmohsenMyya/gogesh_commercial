import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    Key? key,

    required this.hintname,
    required this.hinturl,
    required this.controllername,
    required this.controllerurl,
    required this.validatorname,
    required this.validatorurl,
    this.inputType,
    this.maxLines,
    this.onChanged,
    this.textInputAction,
    this.label
  }) : super(key: key);
  final String hintname, hinturl;
  final int? maxLines;
 final Widget? label;
  final TextEditingController controllername;
  final TextEditingController controllerurl;

  final String? Function(String?)? validatorname;
  final String? Function(String?)? validatorurl;

  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final String? Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        TextFormField(
          textInputAction: textInputAction,
          maxLines: maxLines,
          style: const TextStyle(height: 1.5),
          keyboardType: inputType,
          decoration: InputDecoration(
            label:  label,
            hintText: hintname.tr(),
          ),
          controller: controllername,
          validator: validatorname,
        ),
        SizedBox(
          height: 2.h,
        ),
        TextFormField(
          textInputAction: textInputAction,
          maxLines: maxLines,
          style: const TextStyle(height: 1.5),
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: hinturl.tr(),
          ),
          controller: controllerurl,
          validator: validatorurl,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
