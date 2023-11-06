import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../app/theme.dart';

class CostumeBottomNavigation extends StatelessWidget {
  const CostumeBottomNavigation(
      {required this.items, required this.index, required this.onTap, Key? key})
      : super(key: key);
  final List<Item> items;
  final int index;

  final Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    assert(items.isNotEmpty);
    return 
    Container(
      height: 9.h,
      color: Colors.transparent,
      margin: EdgeInsets.only(bottom: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: LayoutBuilder(builder: (context, c) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5.h),
                    color: AppTheme.green),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < items.length; i++)
                    AnimatedAlign(
                      alignment: i == index
                          ? Alignment.topCenter
                          : Alignment.bottomCenter,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        width: i == index
                            ? c.maxWidth / (items.length + 0.18.h)
                            : c.maxWidth / (items.length + 0.1.h),
                        height: c.maxWidth / (items.length + 0.18.h),
                        padding:
                            i != index ? const EdgeInsets.only(top: 10) : null,
                        decoration: i == index
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(5.h),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 5,

                                    offset:
                                        const Offset(1, 2), // Shadow position
                                  ),
                                ],
                                color: Colors.white)
                            : null,
                        child: InkWell(
                          onTap: () => onTap(i),
                          splashFactory: NoSplash.splashFactory,
                          borderRadius: BorderRadius.circular(50),
                          child: _Item(
                            icon: items[i].icon,
                            title: items[i].title,
                            active: i == index,
                            activeTitle: items[i].activeTitle,
                            activeIcon: items[i].activeIcon,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class Item {
  Item(
      {required this.icon,
      required this.title,
      this.activeTitle,
      this.activeIcon,
      Key? key});
  final Widget icon;
  final Widget? activeIcon;
  final Text title;
  final Text? activeTitle;
}

class _Item extends StatelessWidget {
  const _Item(
      {required this.icon,
      required this.title,
      required this.active,
      this.activeIcon,
      this.activeTitle,
      Key? key})
      : super(key: key);
  final Widget icon;
  final Widget? activeIcon;
  final Text title;
  final Text? activeTitle;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        active ? (activeIcon ?? icon) : icon,
        active ? (activeTitle ?? title) : title,
      ],
    );
  }
}
