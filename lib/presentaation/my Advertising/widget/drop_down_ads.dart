import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DropDownAdsWidget<T extends dynamic> extends StatelessWidget {
  const DropDownAdsWidget(
      {required this.hint,
      Key? key,
      this.value,
      this.loading = false,
      required this.data,
      required this.onChange})
      : super(key: key);

  final String hint;
  final void Function(T?) onChange;
  final T? value;
  final List<T> data;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        hint: loading
            ? SizedBox(
                height: 2.h,
                width: 2.h,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : Text(
                hint,
                style: TextStyle(fontSize: 12.sp, color: Colors.black26),
              ).tr(),
        items: data
            .map((e) => DropdownMenuItem<T>(
                  value: e,
                  child: Text(
                      "${"place".tr()}"":""${e.place.name}" "  ""${"Today's_price".tr()}"":""${e.price}"),
                ))
            .toList(),
        value: value,
        onChanged: onChange,
        buttonStyleData: ButtonStyleData(
          height: 6.h,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xffcbcbcb),
            ),

            // color: Colors.redAccent,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down_sharp,
          ),
          iconSize: 25,
          iconEnabledColor: Colors.black26,
          iconDisabledColor: AppTheme.green,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 95.5.w,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Color(0xffcbcbcb),
          ),
          elevation: 1,
          //  offset: const Offset(-10, -10),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
