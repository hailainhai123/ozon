
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/mqtt/constants.dart';
import 'package:ozon/mqtt/mqttClientWrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/routes.dart';
import '../constant/theme.dart';

class GlobalController extends GetxController {
  // late MQTTBrowserWrapper mqttBrowserWrapper;
  late MQTTClientWrapper mqttClientWrapper;
  // late MQTTBrowserWrapper mqttBrowserWrapper;

  RxString mqttMessage = RxString("");

  var userLogin = false.obs;
  var accessToken = "".obs;
  var colorChoose = Colors.black.obs;
  var bookIdFromNotification = '';
  var fontSizeText = [14.0, 16.0, 18.0, 20.0, 22.0, 24.0].obs;
  var fontSize = 14.0.obs;
  var isLogin = false.obs;

  @override
  void onInit() async {
    // initMqtt();
    await checkLogin();
    super.onInit();
  }

  Future initMqtt() async {
    mqttClientWrapper = MQTTClientWrapper(() {
      print('Connect success!');
    }, (message) {
      mqttMessage.value = message;
    });
    // check web or mobile
    // if (kIsWeb) {
    //   mqttBrowserWrapper = MQTTBrowserWrapper(() {
    //     print('Connect success!');
    //   }, (message) {
    //     mqttMessage.value = message;
    //   });
    // } else {
    //   mqttClientWrapper = MQTTClientWrapper(() {
    //     print('Connect success!');
    //   }, (message) {
    //     mqttMessage.value = message;
    //   });
    // }
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
