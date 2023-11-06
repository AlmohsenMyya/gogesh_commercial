import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/costume_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

class SkeltonwidgetShimmer extends StatelessWidget {
  const SkeltonwidgetShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget(
                        height: 20.h,
                        width: 95.w,
                        raduis: 4.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          ShimmerWidget(
                            height: 3.h,
                            width: 15.h,
                            raduis: 1.h,
                          ),
                          const Expanded(child: SizedBox()),
                          ShimmerWidget(
                            height: 3.h,
                            width: 10.h,
                            raduis: 1.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          ShimmerWidget(
                            height: 3.h,
                            width: 16.h,
                            raduis: 1.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      ShimmerWidget(
                        height: 3.h,
                        width: 19.h,
                        raduis: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 6,
                            spacing: 10,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius:
                                  BorderRadius.circular(8),
                              minLength:
                                  MediaQuery.of(context)
                                          .size
                                          .width /
                                      2,
                            )),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ShimmerWidget(
                        height: 3.h,
                        width: 19.h,
                        raduis: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 6,
                            spacing: 10,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius:
                                  BorderRadius.circular(8),
                              minLength:
                                  MediaQuery.of(context)
                                          .size
                                          .width /
                                      2,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 6.h,
                    width: double.infinity,
                    child: custombuttom(
                      onTap: () {},
                      color: AppTheme.secondaryColor,
                      child: const SizedBox(),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 6.h,
                    width: double.infinity,
                    child: custombuttom(
                        onTap: () {},
                        color: Colors.redAccent,
                        child: const SizedBox()),
                  )
                ],
              ),
            ],
          ),
        );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double height;

  final double width;
  final double raduis;

  const ShimmerWidget({
    required this.height,
    required this.width,
    required this.raduis,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: Colors.grey.shade400,
      ),
    );
  }
}