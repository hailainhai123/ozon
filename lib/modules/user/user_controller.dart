import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_dio_controller.dart';
import '../../mqtt/constants.dart';

class UserController extends GetxController {

  var ten = ''.obs;
  var userName = ''.obs;
  var diaChi = ''.obs;
  var sdt = ''.obs;

  @override
  void onInit() async {
    // initMqtt();
    await getInfoUser();
    super.onInit();
  }

  Future<void> getInfoUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ten.value = await prefs.getString(Constants.user) ?? 'Admin';
    userName.value = await prefs.getString(Constants.nameUser) ?? 'adminTest';
    diaChi.value = await prefs.getString(Constants.address) ?? 'Ha Noi';
    sdt.value = await prefs.getString(Constants.phone) ?? '0123456789';
  }

}