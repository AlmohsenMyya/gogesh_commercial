import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../assets.dart';
import 'package:timeago/timeago.dart' as timeago;

class AdsWidget extends StatelessWidget {
  const AdsWidget({required this.ads, Key? key}) : super(key: key);

  final AdsEntity ads;

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());

    return GestureDetector(
      onTap: () {
        context.goNamed(
          Routes.adDetails.name,
          extra: ads.id,
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 1.h),
          padding: EdgeInsets.all(1.h),
          height: 20.h,
          width: double.infinity,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: ads.images!,
                imageBuilder: (ctx, imageProvider) {
                  return Stack(
                    children: [
                      Container(
                        height: 14.h,
                        width: 14.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black26),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.w),
                        child: SvgPicture.asset(
                          Assets.assets_icons_fav_filled_svg,
                          width: 2.w,
                          color: Colors.redAccent,
                        ),
                      )
                    ],
                  );
                },
                placeholder: (_, __) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade50,
                  child: Container(
                    height: 15.h,
                    width: 15.h,
                  ),
                ),
              ),
              SizedBox(
                width: 1.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    ads.title!,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppTheme.secondaryColor,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "${"price".tr()} :   ",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        ads.price!.toString() + "riyal".tr(),
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                  //   SizedBox(
                  //     height: 5.h,
                  //     child: Row(
                  //       // crossAxisAlignment: CrossAxisAlignment.end,
                  //       // mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         SizedBox(
                  //           width: 40.w,
                  //         ),
                  //         // IconButton(
                  //         //   onPressed: () {},
                  //         //   icon: const Icon(
                  //         //     Icons.delete,
                  //         //     color: Colors.red,
                  //         //     size: 30,
                  //         //   ),
                  //         // ),
                  //       ],
                  //     ),
                  //   )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
