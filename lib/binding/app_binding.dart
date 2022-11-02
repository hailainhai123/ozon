import 'package:get/get.dart';

import '../modules/bottom_app_bar/navigation_controller.dart';
import '../modules/home/home_controller.dart';
import '../modules/login/login_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavController(), permanent: true);
    // Get.put(NotificationController(), permanent: true);
    Get.put(LoginController(), permanent: false);
    Get.put(HomeController(), permanent: true);
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    // Get.put(SearchController(), permanent: true);
    // Get.put(BookMarkController(), permanent: true);
    // Get.put(UserController(), permanent: true);
  }
}

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(() => SearchController());
  }
}

class BookDetailsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => BookDetailsController());
    // Get.lazyPut(() => ReadingController());
  }
}

class CommentsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => CommentsPageController());
  }
}

class GridPageBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => GridPagesController());
  }
}
