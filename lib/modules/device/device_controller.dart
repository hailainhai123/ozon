import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api/api_dio_controller.dart';
import '../../model/device_model.dart';
import '../../mqtt/mqttClientWrapper.dart';

class DeviceController extends GetxController {
  RxBool isLoading = true.obs;
  var listDevice = <DeviceModel>[].obs;
  var idStation = ''.obs;
  var deviceMQTT = DeviceModel().obs;

  final nameController = TextEditingController();
  final stationIdController = TextEditingController();
  final adminIdController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  late MQTTClientWrapper mqttClientWrapper;
  RxString mqttMessage = RxString("");

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future getListDevice(String idStation) async {
    listDevice.clear();
    try {
      var list = await ApiDioController.getDeviceForIdStation(idStation);
      listDevice.addAll(list);
    } catch (e) {
      print(e);
    }
  }

  Future initMqtt(String idStationMQTT) async {
    mqttClientWrapper = MQTTClientWrapper(() {
      print('Connect success!');
    }, (message) {
      mqttMessage.value = message;
      final device = DeviceModel.fromJson(jsonDecode(message));
      deviceMQTT.value = device;
      for (var element in listDevice) {
        if (element.deviceId == deviceMQTT.value.deviceId) {
          element.ozone = deviceMQTT.value.ozone;
          print('haiabc ${element.ozone}');
        }
      }
    });
    mqttClientWrapper.prepareMqttClient(idStationMQTT);
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
