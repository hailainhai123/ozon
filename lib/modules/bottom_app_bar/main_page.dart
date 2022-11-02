import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_page.dart';
import 'navigation_bar.dart';
import 'navigation_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
    // const SearchPage(),
    // BookmarkPage(),
    // UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavController>();
    print('haiabc');
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(() {
        return pages[navController.currentIndex.value];
      }),
      bottomNavigationBar: NavigationBottomBar(),
    );
  }
}
