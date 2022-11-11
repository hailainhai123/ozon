import 'package:get/get.dart';
import 'package:ozon/api/api_dio_controller.dart';
import 'package:ozon/model/admin_model.dart';

import '../../utils/global_controller.dart';
import '../home/home_controller.dart';

class RegisterController extends GetxController {
  final GlobalController globalController = Get.find();
  var loading = false.obs;
  RxBool registerStatus = RxBool(false);
  RxString user = RxString("");
  RxString pass = RxString("");
  RxString phone = RxString("");
  RxString address = RxString("");
  RxString name = RxString("");

  void setLoading() => loading.value = !loading.value;

  void skipLogin() async {
    // Get.find<HomeController>().refreshController();
    Get.back();
  }

  Future<bool> register(AdminModel adminModel) async {
    return await ApiDioController.registerAdmin(adminModel);
  }

  Future _success() async {
    Get.find<HomeController>().refreshController();
    // await Get.find<HomeController>().getLastReading();
    Get.back();
    Get.snackbar('Thông báo', 'Đăng ký thành công',
        snackPosition: SnackPosition.TOP);
  }
}
