import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/api/api_dio_controller.dart';
import 'package:ozon/model/device_model.dart';

import '../../mqtt/mqttClientWrapper.dart';

class DeviceDetailController extends GetxController {
  var deviceName = ''.obs;
  var deviceModel = DeviceModel().obs;
  var updateSuccess = false.obs;
  var color = Colors.blue.obs;
  late MQTTClientWrapper mqttClientWrapper;

  // late MQTTBrowserWrapper mqttBrowserWrapper;

  RxString mqttMessage = RxString("");

  @override
  void onInit() {
    initMqtt();
    // TODO: implement onInit
    super.onInit();
  }

  Future initMqtt() async {
    mqttClientWrapper = MQTTClientWrapper(() {
      print('Connect success!');
    }, (message) {
      mqttMessage.value = message;
      final device = DeviceModel.fromJson(jsonDecode(message));
      deviceModel.value = device;
    });
    mqttClientWrapper.prepareMqttClient(deviceModel.value.deviceId!);
  }

  Future updateDevice(DeviceModel device) async {
    try {
      final success = await ApiDioController.updateDevice(device);
      // updateSuccess.value = success;
      deviceModel.value.name = success.name;
    } catch (e) {
      print(e);
    }
  }

  void onChangeDevicelName(String text) {
    deviceModel.value.name = text;
  }

  void onChangeThreshold1(String text) {
    deviceModel.value.threshold1 = text;
  }

  void onChangeThreshold2(String text) {
    deviceModel.value.threshold2 = text;
  }

  void onChangeThreshold3(String text) {
    deviceModel.value.threshold3 = text;
  }

}
