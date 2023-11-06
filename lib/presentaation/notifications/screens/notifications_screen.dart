import 'dart:math';

import 'package:commmercial_directory_seller/app/theme.dart';
import 'package:commmercial_directory_seller/assets.dart';
import 'package:commmercial_directory_seller/core/bloc/error.dart';
import 'package:commmercial_directory_seller/core/fillters/filter.dart';
import 'package:commmercial_directory_seller/domain/entities/notification_entity/notification_entity.dart';
import 'package:commmercial_directory_seller/presentaation/notifications/bloc/notification_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/error_widget.dart'
    as error_widget;
import 'package:commmercial_directory_seller/presentaation/widgets/network_error_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

import '../widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NotificationBloc>();

    bloc.pagingController.addPageRequestListener((pageKey) {
      bloc.add(NotificationEvent.loadNotification(
          filter: Filter(
        page: pageKey,
      )));
    });

    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationBloc, NotificationState>(
          listener: (context, state) {
            state.whenOrNull(
                loaded: (data, pageKey) =>
                    bloc.pagingController.appendPage(data, pageKey),
                lastPageLoaded: (data) =>
                    bloc.pagingController.appendLastPage(data),
                error: (error) => bloc.pagingController.error = error);
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("notifications").tr(),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: RefreshIndicator(
              color: AppTheme.secondaryColor,
              onRefresh: () async {
                bloc.pagingController.refresh();
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            PagedSliverList<int, NotificationEntity>(
                              pagingController: bloc.pagingController,
                              builderDelegate:
                                  PagedChildBuilderDelegate<NotificationEntity>(
                                itemBuilder: (context, item, index) =>
                                    NotificationItem(
                                  notificationEntity: item,
                                ),
                                firstPageErrorIndicatorBuilder: (context) =>
                                    (bloc.pagingController.error as ErrorState)
                                        .when(
                                            networkError: (message) =>
                                                NetworkErrorWidget(
                                                    tryAgain: () => bloc
                                                        .pagingController
                                                        .refresh()),
                                            other: (message) =>
                                                error_widget.ErrorWidget(
                                                  tryAgain: () => bloc
                                                      .pagingController
                                                      .refresh(),
                                                )),
                                noItemsFoundIndicatorBuilder: (context) =>
                                    Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.assets_icons_no_data_svg,
                                      width: 150,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "no_notification_found",
                                      style: TextStyle(fontSize: 18),
                                    ).tr()
                                  ],
                                ),
                                firstPageProgressIndicatorBuilder: (context) =>
                                    Column(
                                  children: [
                                    for (int i = 1; i < 15; i++)
                                      SkeletonItem(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: Random()
                                                      .nextInt(150)
                                                      .toDouble(),
                                                  height: 8,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .background),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  width: Random()
                                                      .nextInt(180)
                                                      .toDouble(),
                                                  height: 5,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .background),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                  ],
                                ),
                                newPageProgressIndicatorBuilder: (context) =>
                                    const Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                    ),
                                  ),
                                ),
                                newPageErrorIndicatorBuilder: (context) =>
                                    GestureDetector(
                                        onTap: () {
                                          bloc.pagingController
                                              .retryLastFailedRequest();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "try_again".tr(),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.refresh_rounded,
                                              size: 20,
                                            )
                                          ],
                                        )),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: SizedBox(
                                //  color: Colors.transparent,
                                height: 10.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
