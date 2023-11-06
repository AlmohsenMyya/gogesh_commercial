import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:searchable_paginated_dropdown/searchable_dropdown_controller.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:sizer/sizer.dart';

class SearchDropDownWidget<T> extends StatefulWidget {
  const SearchDropDownWidget(
      {required this.controller,
      super.key,
      this.color,
      required this.hint,
      required this.noRecordText,
      required this.onChanged,
      this.isEnabled = true});

  final SearchableDropdownController<T> controller;
  // final String? title;
  final String hint;
  final bool? color;
  final String noRecordText;
  final bool isEnabled;
  final Function(T? item) onChanged;

  @override
  State<SearchDropDownWidget<T>> createState() =>
      _SearchDropDownWidgetState<T>();
}

class _SearchDropDownWidgetState<T> extends State<SearchDropDownWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return

        // Row(
        //   children: [
        //     widget.title == null
        //         ? const SizedBox()
        //         : Text(
        //             widget.title!,
        //             style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        //           ).tr(),
        //     const Expanded(child: SizedBox()),
        Container(
      height: 6.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.8, color: const Color(0xffcbcbcb))),
      child: Theme(
        data: ThemeData(),
        child: SearchableDropdown.paginated(
          local: context.locale.languageCode,
          trailingIcon: const Icon(
            Icons.arrow_drop_down_sharp,
            color: Colors.black,
          ),
          searchHintText: "search".tr(),
          controller: widget.controller,
          hintText: Text(
            widget.hint,
            style: TextStyle(
                fontSize: 12.sp,
                color: widget.color == null ? Colors.black26 : Colors.black),
          ).tr(),
          isEnabled: widget.isEnabled,
          width: double.infinity,
          dialogWidth: double.infinity,
          requestItemCount: 16,
          noRecordText: Text(widget.noRecordText).tr(),
          onChanged: widget.onChanged,
        ),
      ),
      // ),
      //],
    );
  }
}
