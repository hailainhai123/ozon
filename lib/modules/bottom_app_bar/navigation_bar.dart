import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constant/icons_path.dart';
import '../../constant/theme.dart';
import 'navigation_controller.dart';

class BottomNav {
  final String icon;
  final String title;

  BottomNav({required this.icon, required this.title});
}

class NavigationBottomBar extends GetView<NavController> {
  NavigationBottomBar({Key? key}) : super(key: key);

  final icons = <BottomNav>[
    BottomNav(icon: IconsPath.navHomeIcon, title: "Trang chủ"),
    BottomNav(icon: IconsPath.navSearchIcon, title: "Trạm"),
    BottomNav(icon: IconsPath.navBookmarkIcon, title: "Thiết bị"),
    BottomNav(icon: IconsPath.navUserIcon, title: "Tài khoản"),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: kGreyColor,
              blurRadius: 0.5,
            ),
          ],
        ),
        child: SalomonBottomBar(
            currentIndex: controller.currentIndex.value,
            onTap: (i) => {controller.currentIndex.value = i},
            items: icons
                .asMap().map((i, e) =>
                MapEntry(i,
                    SalomonBottomBarItem(title: Text(e.title),
                        icon: SvgPicture.asset(e.icon, color: i == controller.currentIndex.value ? kPrimaryColor : kAppGreyColor ))
                )).values.toList()
        ),
      );
    });
  }
}
