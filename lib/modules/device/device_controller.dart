import 'package:get/get.dart';

import '../../model/device_model.dart';

class DeviceController extends GetxController {
  RxBool isLoading = true.obs;
  var listDevice = <DeviceModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fakeDateDepartment();
    super.onInit();
  }
  void fakeDateDepartment() {
    listDevice.add(DeviceModel(
      'userid',
      'mathietbi',
      'vitri',
      'soloi',
      'dienap',
      'trangthai',
      'TDS',
      'Loi1',
      'Loi2',
      'Loi3',
    ));
    listDevice.add(DeviceModel(
      'userid',
      'mathietbi',
      'vitri',
      'soloi',
      'dienap',
      'trangthai',
      'TDS',
      'Loi1',
      'Loi2',
      'Loi3',
    ));
    listDevice.add(DeviceModel(
      'userid',
      'mathietbi',
      'vitri',
      'soloi',
      'dienap',
      'trangthai',
      'TDS',
      'Loi1',
      'Loi2',
      'Loi3',
    ));
    listDevice.add(DeviceModel(
      'userid',
      'mathietbi',
      'vitri',
      'soloi',
      'dienap',
      'trangthai',
      'TDS',
      'Loi1',
      'Loi2',
      'Loi3',
    ));
    listDevice.add(DeviceModel(
      'userid',
      'mathietbi',
      'vitri',
      'soloi',
      'dienap',
      'trangthai',
      'TDS',
      'Loi1',
      'Loi2',
      'Loi3',
    ));
  }
}