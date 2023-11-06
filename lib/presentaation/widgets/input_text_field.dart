import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.validator,
    this.readOnly = false,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.inputType,
    this.initialValue,
    this.maxLines,
    this.maxlenght,
    this.textInputAction,
  }) : super(key: key);
  final String label;
  final String hint;
  final String ? initialValue;
  final int? maxLines, maxlenght;
  final TextEditingController controller;
 final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 1.h,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ).tr(),
        SizedBox(
          height: 1.h,
        ),
        TextFormField(
           initialValue: initialValue,
          textInputAction: textInputAction,
          maxLines: maxLines,
          maxLength: maxlenght,
          style: const TextStyle(height: 1.5),
          keyboardType: inputType,
          readOnly: readOnly,
          decoration: InputDecoration(
              hintText: hint.tr(),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon),
          controller: controller,
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
