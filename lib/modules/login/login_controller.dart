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
      var userModelRespone =  await ApiDioController.login(userModel);
      if (userModelRespone.user == null) {
        success.value = false;
      } else {
        user.value = userModelRespone;
        success.value = true;
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(Constants.signedIn, true);
        await prefs.setString(Constants.user, userModelRespone.user ?? 'admin');
        await prefs.setString(Constants.pass, userModelRespone.pass ?? 'admin');
        await prefs.setString(Constants.nameUser, userModelRespone.name  ?? 'admin');
        await prefs.setString(Constants.address, userModelRespone.address ?? 'Hà Nội');
        await prefs.setString(Constants.phone, userModelRespone.phone ?? '01234567899');
        await prefs.setString(Constants.birthDate, userModelRespone.birthDate ?? '01/01/1991');
        print('haiabc user ${userModelRespone.user}');
        print('haiabc name ${userModelRespone.name}');
        print('haiabc address ${userModelRespone.address}');
        print('haiabc phone ${userModelRespone.phone}');
        print('haiabc birthDate ${        await prefs.setString(Constants.birthDate, userModelRespone.birthDate ?? '01/01/1991')
            }');
        globalController.colorBackground.value = Colors.white;
        globalController.colorText.value = Colors.black;
      }
    } catch (e) {
      success.value = false;
      print(e);
    }
  }
}
