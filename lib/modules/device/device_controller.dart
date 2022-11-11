import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api/api_dio_controller.dart';
import '../../model/device_model.dart';

class DeviceController extends GetxController {
  RxBool isLoading = true.obs;
  var listDevice = <DeviceModel>[].obs;

  final nameController = TextEditingController();
  final stationIdController = TextEditingController();
  final adminIdController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    getListDevice();
    super.onInit();
  }

  Future getListDevice() async {
    listDevice.clear();
    try {
      var list = await ApiDioController.getDevice();
      listDevice.addAll(list);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> registerDevice() async {
    DeviceModel deviceModel = DeviceModel(
      stationIdController.text,
      adminIdController.text,
      nameController.text,
      descriptionController.text,
      locationController.text,
      '',
      '',
      '',
      '',
      '',
    );
    return await ApiDioController.registerDevice(deviceModel);
  }

  @override
  void dispose() async {
    nameController.dispose();
    stationIdController.dispose();
    adminIdController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
