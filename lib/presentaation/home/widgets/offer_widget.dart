import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
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

class OfferWidget extends StatelessWidget {
  const OfferWidget({required this.offer, Key? key}) : super(key: key);

  final OfferEntity offer;

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());

    return GestureDetector(
      onTap: () {
        context.goNamed(
          Routes.offerDetails.name,
          extra: offer.id,
        );
      },
      child: Stack(
        children: [
          Card(
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
                    imageUrl: offer.images![0] ??
                        "https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                    imageBuilder: (ctx, imageProvider) {
                      return Stack(
                        children: [
                          Container(
                            height: 15.h,
                            width: 15.h,
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
                        offer.title!,
                        style: const TextStyle(
                          color: AppTheme.secondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye,
                            color: Colors.black26,
                            size: 18,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          const Text(
                            '100',
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            '${"number orders".tr()}:',
                            style: const TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                          const Text(
                            '10000',
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 5.h,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.timelapse,
                              color: Colors.black26,
                            ),
                            Text(
                              timeago.format(
                                DateTime.parse(offer.createdAt!),
                                locale: context.locale.languageCode,
                              ),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black26,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: const Icon(
                            //     Icons.delete,
                            //     color: Colors.red,
                            //     size: 30,
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          offer.reason != null ||
                  offer.reasonUpdated != null && offer.updatedId != null
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(3.h),
                    ),
                    child:
                        SvgPicture.asset(Assets.assets_icons_exclamation_svg),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
