import 'package:get/get.dart';

import '../../api/api_dio_controller.dart';
import '../../model/user_model.dart';

class UserController extends GetxController {

  var ten = 'Khanh'.obs;
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
      final user = await ApiDioController.getAdmin(userModel);
      ten.value = user.name ?? 'Khanh';
      sdt.value = user.phone ?? "1234561";
      diaChi.value = user.address ?? "Hà Nội";
      birthDate.value = user.birthDate ?? '11/26/2021';
    } catch (e) {
      print(e);
    }
  }

}