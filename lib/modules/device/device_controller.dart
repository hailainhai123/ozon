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
      'Loi4',
      'Loi5',
      'Loi6',
      'Loi7',
      'Loi8',
      'Loi9',
      'Loi10',
      'Loi11',
      'Loi12',
      'ngaykichhoat',
      'timeupdate',
      'mac',
    ));
  }
}