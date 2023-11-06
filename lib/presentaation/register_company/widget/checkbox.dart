import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../app/theme.dart';

class CheckBoxDays extends StatelessWidget {
  const CheckBoxDays({
    required this.onChanged,
    required this.value,
    required this.hint,
    required this.controllerfrom,
    required this.controllerto,
    required this.validatorfrom,
    required this.validatorto,
    required this.enabled,
    this.onTapTo,
    this.onTapFrom,
    super.key,
  });
  final void Function(bool?)? onChanged;
  final bool? value;
  final String hint;
  final bool? enabled;
  final TextEditingController controllerfrom;
  final TextEditingController controllerto;
  final void Function()? onTapTo;
  final void Function()? onTapFrom;
  final String? Function(String?)? validatorfrom;
  final String? Function(String?)? validatorto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppTheme.green,
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.5.h)),
        ),
        Expanded(
          child: Text(hint).tr(),
        ),
        Text("from".tr() + " : "),
        SizedBox(
          height: 5.h,
          width: 10.h,
          child: TextFormField(
            readOnly: true,
            onTap: onTapFrom,
            enabled: enabled,
            cursorHeight: 2.5.h,
            textInputAction: TextInputAction.done,
            style: const TextStyle(height: 1.5),
            //keyboardType: TextInputType.date,
            decoration: const InputDecoration(
              hintText: "08:00",
              // Adjust the vertical padding as needed
            ),
            controller: controllerfrom,
            validator: validatorfrom,
          ),
        ),
        SizedBox(
          width: 1.h,
        ),
        Text("to".tr() + " : "),
        SizedBox(
          height: 5.h,
          width: 10.h,
          child: TextFormField(
            readOnly: true,
            onTap: onTapTo,
            enabled: enabled,
            cursorHeight: 2.5.h,
            textInputAction: TextInputAction.done,
            style: const TextStyle(height: 1.5),
            // keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              hintText: "19:00",
            ),
            controller: controllerto,
            validator: validatorto,
          ),
        )
      ],
    );
  }
}
