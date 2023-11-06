import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

class dropdown extends StatelessWidget {
  final String label;

  final String hint;
  final List item;
  void Function(String?)? onChanged;

   dropdown(
      {required this.label,
      required this.hint,
      required this.item,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 1.5.h,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 1.h,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    hint,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: item
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            //  value: selectedValue,
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: 6.h,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffcbcbcb),
                ),

                // color: Colors.redAccent,
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                textDirection: TextDirection.ltr,
              ),
              iconSize: 25,
              iconEnabledColor: Colors.black26,
              iconDisabledColor: AppTheme.green,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 91.5.w,
              padding: EdgeInsets.all(10),
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
        ),
      ],
    );
  }
}
