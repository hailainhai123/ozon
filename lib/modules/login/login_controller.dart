import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/api/api_dio_controller.dart';
import 'package:ozon/constant/routes.dart';
import 'package:ozon/model/admin_model.dart';
import 'package:ozon/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mqtt/constants.dart';
import '../../utils/global_controller.dart';
import '../home/home_controller.dart';

class LoginController extends GetxController {
  final GlobalController globalController = Get.find();

  var user = UserModel().obs;
  var success = false.obs;
  var loading = false.obs;

  @override
  void onInit() async {
    await checkLogin();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final signIn = await prefs.getBool(Constants.signedIn) ?? false;
    if (signIn) {
      Get.toNamed(kRouteIndex);
    }
  }

  Future<void> login(UserModel userModel) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      userModel.playerId = await prefs.getString(Constants.playerId);
      var userModelRespone =  await ApiDioController.login(userModel);
      if (userModelRespone.user == null) {
        success.value = false;
      } else {
        user.value = userModelRespone;
        success.value = true;
        prefs.setBool(Constants.signedIn, true);
        prefs.setString(Constants.user, userModelRespone.user ?? 'user');
        prefs.setString(Constants.pass, userModelRespone.pass ?? 'user');
        prefs.setString(Constants.userId, userModelRespone.userId ?? 'user');
        globalController.colorBackground.value = Colors.white;
        globalController.colorText.value = Colors.black;
      }
    } catch (e) {
      success.value = false;
      print(e);
    }
  }
}
