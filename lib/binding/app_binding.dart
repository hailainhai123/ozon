import 'package:get/get.dart';
import 'package:ozon/modules/device/device_controller.dart';
import 'package:ozon/modules/device_detail/device_detail_controller.dart';
import 'package:ozon/modules/user/user_controller.dart';

import '../modules/bottom_app_bar/navigation_controller.dart';
import '../modules/contact/contact_controller.dart';
import '../modules/home/home_controller.dart';
import '../modules/login/login_controller.dart';
import '../modules/query/query_controller.dart';
import '../modules/register/register_controller.dart';
import '../modules/station/station_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavController(), permanent: true);
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(QueryController(), permanent: true);
    Get.put(UserController(), permanent: true);
    Get.put(ContactController(), permanent: true);
  }
}


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}


class StationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StationController());
  }
}

class DeviceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DeviceController(), permanent: true);
  }
}

class DeviceDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DeviceDetailController(), permanent: true);
  }
}
