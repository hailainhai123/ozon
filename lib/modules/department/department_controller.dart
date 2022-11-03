import 'package:get/get.dart';
import 'package:ozon/model/device_model.dart';

class DepartmentController extends GetxController {
  RxBool isLoading = true.obs;
  var listDevice = <DeviceModel>[].obs;
}