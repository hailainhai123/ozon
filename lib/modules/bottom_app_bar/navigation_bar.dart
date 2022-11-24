import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ozon/utils/global_controller.dart';
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
  final GlobalController globalController = Get.find();

  final icons = <BottomNav>[
    BottomNav(icon: IconsPath.navHomeIcon, title: "Trang Chủ"),
    BottomNav(icon: IconsPath.navInsuranceIcon, title: "Truy vấn"),
    BottomNav(icon: IconsPath.navContactIcon, title: "Liên Hệ"),
    BottomNav(icon: IconsPath.navSettingIcon, title: "Cài đặt"),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: globalController.colorBackground.value,
          boxShadow: const <BoxShadow>[
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
