
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:ozon/mqtt/constants.dart';
import 'package:ozon/mqtt/mqttClientWrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/routes.dart';
import '../constant/theme.dart';

class GlobalController extends GetxController {
  // late MQTTBrowserWrapper mqttBrowserWrapper;

  var userLogin = false.obs;
  var accessToken = "".obs;
  var colorChoose = Colors.black.obs;
  var bookIdFromNotification = '';
  var fontSizeText = [14.0, 16.0, 18.0, 20.0, 22.0, 24.0].obs;
  var fontSize = 14.0.obs;
  var isLogin = false.obs;
  var darkTheme = false.obs;
  var colorBackground = Colors.white.obs;
  var colorText = Colors.black.obs;

  @override
  void onInit() async {
    // initMqtt();
    initOnesignal();
    await checkLogin();
    super.onInit();
  }

  Future<void> initOnesignal() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared
        .setAppId("15d7af90-30a3-45da-9d0d-94dc37e109ea");
  }

  Future<void> checkLogin() async {
    await Future.delayed(Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final signIn = await prefs.getBool(Constants.signedIn) ?? false;
    if (signIn) {
      Get.toNamed(kRouteIndex);
    } else {
      Get.toNamed(kLoginPage);
    }
  }
}
