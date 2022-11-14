import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/modules/user/user_page.dart';
import '../contact/contact_page.dart';
import '../home/home_page.dart';
import '../insurance/insurance_page.dart';
import 'navigation_bar.dart';
import 'navigation_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final pages = [
    HomePage(),
    InsurancePage(),
    const ContactPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(() {
        return pages[navController.currentIndex.value];
      }),
      bottomNavigationBar: NavigationBottomBar(),
    );
  }
}
