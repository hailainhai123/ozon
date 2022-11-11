import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/api/api_dio_controller.dart';
import 'package:ozon/model/station_model.dart';

import '../../model/device_model.dart';

class StationController extends GetxController {
  RxBool isLoading = true.obs;
  var listDevice = <DeviceModel>[].obs;

  final nameController = TextEditingController();
  final stationIdController = TextEditingController();
  final adminIdController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<bool> registerStation() async {
    StationModel stationModel = StationModel(
        stationIdController.text,
        adminIdController.text,
        nameController.text,
        descriptionController.text,
        locationController.text);
    return await ApiDioController.registerStation(stationModel);
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
