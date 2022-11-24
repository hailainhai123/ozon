import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_dio_controller.dart';
import '../../mqtt/constants.dart';

class UserController extends GetxController {

  var ten = ''.obs;
  var userName = ''.obs;
  var diaChi = ''.obs;
  var sdt = ''.obs;
  var birthDate = ''.obs;
  var light = false.obs;

  @override
  void onInit() async {
    // await getInfoUser();
    super.onInit();
  }

  Future<void> getInfoUser() async {
    try {
      await ApiDioController.getAdmin();
    } catch (e) {
      print(e);
    }
  }

}