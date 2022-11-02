import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ozon/utils/global_controller.dart';

import 'binding/app_binding.dart';
import 'constant/routes.dart';
import 'constant/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final globalController = Get.put(GlobalController(), permanent: true);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.onlyBuilder,
      title: 'Ozon',
      theme: lightTheme(),
      initialBinding: GlobalBinding(),
      debugShowCheckedModeBanner: false,
      getPages: pages,
      // builder: EasyLoading.init(),
      initialRoute: kRouteIndex,
    );;
  }
}