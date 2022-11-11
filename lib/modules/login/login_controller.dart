import 'package:get/get.dart';
import 'package:ozon/api/api_dio_controller.dart';
import 'package:ozon/model/admin_model.dart';
import 'package:ozon/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mqtt/constants.dart';
import '../../utils/global_controller.dart';
import '../home/home_controller.dart';

class LoginController extends GetxController {

  var user = UserModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  final GlobalController globalController = Get.find();
  var loading = false.obs;

  void setLoading() => loading.value = !loading.value;

  Future<void> login(UserModel userModel) async {
    try {
      var userModelRespone =  await ApiDioController.login(userModel);
      user.value = userModelRespone;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(Constants.isLogin, true);
      await prefs.setString(Constants.user, userModelRespone.user!);
      await prefs.setString(Constants.pass, userModelRespone.pass!);
      await prefs.setString(Constants.nameUser, userModelRespone.name!);
      await prefs.setString(Constants.address, userModelRespone.address!);
      await prefs.setString(Constants.phone, userModelRespone.phone!);
      await prefs.setString(Constants.birthDate, userModelRespone.birthDate!);
    } catch (e) {
      print(e);
    }
  }
}
