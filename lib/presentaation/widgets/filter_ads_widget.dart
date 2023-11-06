import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/domain/enums/enums.dart';
import 'package:commmercial_directory_seller/presentaation/filter_cubit/filter_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class FilterAdsWidget extends StatelessWidget {
  const FilterAdsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterAdsCubit<ServiceTypeEnum>, ServiceTypeEnum?>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: Text(
                  "all",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: state == null ? Colors.white : Colors.black),
                ).tr(),
                selectedColor: AppTheme.orange,
                backgroundColor: Colors.transparent,
                selected: state == null,
                showCheckmark: false,
                shape: StadiumBorder(
                    side: BorderSide(
                  width: 1,
                  color: state == null ? Colors.transparent : Colors.grey,
                )),
                onSelected: (bool value) {
                  context
                      .read<FilterAdsCubit<ServiceTypeEnum>>()
                      .changeItem(null);
                },
              ),
              SizedBox(
                width: 1.h,
              ),
              FilterChip(
                label: Text(
                  "approved",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: state == ServiceTypeEnum.approved
                          ? Colors.white
                          : Colors.black),
                ).tr(),
                backgroundColor: Colors.transparent,
                selectedColor: AppTheme.orange,
                selected: state == ServiceTypeEnum.approved,
                showCheckmark: false,
                shape: StadiumBorder(
                    side: BorderSide(
                  width: 1,
                  color: state == ServiceTypeEnum.approved
                      ? Colors.transparent
                      : Colors.grey,
                )),
                onSelected: (bool value) {
                  context
                      .read<FilterAdsCubit<ServiceTypeEnum>>()
                      .changeItem(ServiceTypeEnum.approved);
                },
              ),
              SizedBox(
                width: 1.h,
              ),
              FilterChip(
                label: Text(
                  "pending",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: state == ServiceTypeEnum.pending
                          ? Colors.white
                          : Colors.black),
                ).tr(),
                backgroundColor: Colors.transparent,
                selected: state == ServiceTypeEnum.pending,
                selectedColor: AppTheme.orange,
                showCheckmark: false,
                shape: StadiumBorder(
                    side: BorderSide(
                  width: 1,
                  color: state == ServiceTypeEnum.pending
                      ? Colors.transparent
                      : Colors.grey,
                )),
                onSelected: (bool value) {
                  context
                      .read<FilterAdsCubit<ServiceTypeEnum>>()
                      .changeItem(ServiceTypeEnum.pending);
                },
              ),
              SizedBox(
                width: 1.h,
              ),
              FilterChip(
                label: Text(
                  "not_paid",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: state == ServiceTypeEnum.notPaid
                          ? Colors.white
                          : Colors.black),
                ).tr(),
                backgroundColor: Colors.transparent,
                selected: state == ServiceTypeEnum.notPaid,
                selectedColor: AppTheme.orange,
                showCheckmark: false,
                shape: StadiumBorder(
                    side: BorderSide(
                  width: 1,
                  color: state == ServiceTypeEnum.notPaid
                      ? Colors.transparent
                      : Colors.grey,
                )),
                onSelected: (bool value) {
                  context
                      .read<FilterAdsCubit<ServiceTypeEnum>>()
                      .changeItem(ServiceTypeEnum.notPaid);
                },
              ),
              SizedBox(
                width: 1.h,
              ),
              FilterChip(
                label: Text(
                  "rejected",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: state == ServiceTypeEnum.rejected
                          ? Colors.white
                          : Colors.black),
                ).tr(),
                backgroundColor: Colors.transparent,
                selected: state == ServiceTypeEnum.rejected,
                selectedColor: AppTheme.orange,
                showCheckmark: false,
                shape: StadiumBorder(
                    side: BorderSide(
                  width: 1,
                  color: state == ServiceTypeEnum.rejected
                      ? Colors.transparent
                      : Colors.grey,
                )),
                onSelected: (bool value) {
                  context
                      .read<FilterAdsCubit<ServiceTypeEnum>>()
                      .changeItem(ServiceTypeEnum.rejected);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
