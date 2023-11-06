import 'package:flutter/material.dart';
import 'package:multi_dropdown/enum/app_enums.dart';
import 'package:multi_dropdown/models/chip_config.dart';
import 'package:multi_dropdown/models/network_config.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:multi_dropdown/widgets/hint_text.dart';
import 'package:multi_dropdown/widgets/selection_chip.dart';
import 'package:multi_dropdown/widgets/single_selected_item.dart';
import 'package:sizer/sizer.dart';

class MultiDropDown<T extends dynamic> extends StatelessWidget {
  MultiDropDown(
      {required this.hint,
      Key? key,
      // this.value,
      // this.satus = true,
      required this.selectionType,
     required this.selectedOptions,
      required this.data,
      required this.controller,
      required this.onOptionSelected})
      : super(key: key);

  final String hint;
  // final void Function(T?) onChange;
  // final T? value;
  final List<ValueItem> data;
  // bool satus;
  final List<ValueItem> selectedOptions;
  MultiSelectController? controller;
  final void Function(List<ValueItem>)? onOptionSelected;
SelectionType selectionType;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: MultiSelectDropDown(
        hint: hint,
        hintStyle: TextStyle(fontSize: 12.sp, color: Colors.black26),
        showClearIcon: true,
        controller: controller,
        selectedOptions:selectedOptions ,
        onOptionSelected: onOptionSelected,
        options: data,
        selectionType: selectionType,
        chipConfig: const ChipConfig(wrapType: WrapType.wrap),
        dropdownHeight: 300,
        optionTextStyle: const TextStyle(fontSize: 16),
        selectedOptionIcon: const Icon(Icons.check_circle),
      ),
    );
  }
}
