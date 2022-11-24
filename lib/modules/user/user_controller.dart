import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_dio_controller.dart';
import '../../model/user_model.dart';
import '../../mqtt/constants.dart';

class UserController extends GetxController {

  var ten = ''.obs;
  var userName = ''.obs;
  var password = ''.obs;
  var diaChi = ''.obs;
  var sdt = ''.obs;
  var birthDate = ''.obs;
  var light = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> getInfoUser(UserModel userModel) async {
    try {
      await ApiDioController.getAdmin(userModel);
    } catch (e) {
      print(e);
    }
  }

}