import 'package:get/get.dart';

import '../home/home_controller.dart';

class QueryController extends GetxController {
  final HomeController homeController = Get.find();

  var listTimes = ['7', '15', '30'];
  var time = '7'.obs;
  var showChart = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
