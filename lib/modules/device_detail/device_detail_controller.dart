import 'package:get/get.dart';
import 'package:ozon/api/api_dio_controller.dart';
import 'package:ozon/model/device_model.dart';

import '../../mqtt/mqttClientWrapper.dart';

class DeviceDetailController extends GetxController {
  var deviceName = ''.obs;
  var deviceModel = DeviceModel(
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    0,
  ).obs;
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
    });
    mqttClientWrapper.prepareMqttClient('deviceId');
  }

  Future updateDevice(DeviceModel device) async {
    try {
      final success = await ApiDioController.updateDevice(device);
      if (success) {
        Get.back();
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  void onChangeDevicelName(String text) {
    deviceModel.value.name = text.trim();
  }

  void onChangeThreshold1(String text) {
    deviceModel.value.threshold1 = text.trim();
  }

  void onChangeThreshold2(String text) {
    deviceModel.value.threshold2 = text.trim();
  }

  void onChangeThreshold3(String text) {
    deviceModel.value.threshold3 = text.trim();
  }

}
