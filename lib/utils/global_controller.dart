import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/theme.dart';

final colors = <String, dynamic>{
  'black': Colors.black,
  'primary': kPrimaryColor,
  'white': Colors.white
};

class GlobalController extends GetxController {
  var userLogin = false.obs;
  var accessToken = "".obs;
  var textColors = [Colors.black, kPrimaryColor, Colors.white].obs;
  var colorChoose = Colors.black.obs;
  var bookIdFromNotification = '';
  var fontSizeText = [14.0, 16.0, 18.0, 20.0, 22.0, 24.0].obs;
  var fontSize = 14.0.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  setToken(String apiToken) {
    accessToken.value = apiToken;
    log(apiToken);
    if (apiToken != "") {
      getSetting();
    }
    update();
  }

  void refreshToken() async {
  }

  void getSetting() async {
    // await ApiDioController.getSetting().then((appSetting) {
    //   if (appSetting == null) return;
    //   colorChoose.value = colors['${appSetting.textColor}'];
    //   fontSize.value = appSetting.fontSize!.toDouble();
    // });
  }

  void saveSetting() async {
    String nameColor = "";
    for (var item in colors.entries) {
      if (item.value == colorChoose.value) {
        nameColor = item.key;
      }
    }
    Map<String, dynamic> setting = {
      "textColor": nameColor,
      "fontSize": fontSize.value
    };
    // await ApiDioController.saveSetting(setting).then((data) {
    //   Utils.showSuccess('', 'Lưu thành công');
    // });
  }

  void setBookId(String? bookId) {
    bookIdFromNotification = bookId ?? "";
  }
}
