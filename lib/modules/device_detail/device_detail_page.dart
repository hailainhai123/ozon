import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:ozon/utils/global_controller.dart';
import 'package:ozon/widget_custom/app_bar.dart';
import '../../constant/routes.dart';
import '../../model/device_model.dart';
import 'device_detail_controller.dart';

class DeviceDetailPage extends GetView<DeviceDetailController> {
  DeviceDetailPage({
    Key? key,
  }) : super(key: key);

  final GlobalController globalController = Get.find();


  @override
  Widget build(BuildContext context) {
    controller.deviceName.value = Get.parameters['deviceName'] ?? "";
    controller.deviceModel.value.name = Get.parameters['name'] ?? "";
    controller.deviceModel.value.deviceId = Get.parameters['deviceId'] ?? "";
    controller.deviceModel.value.stationId = Get.parameters['stationId'] ?? "";
    controller.deviceModel.value.location = Get.parameters['location'] ?? "";
    controller.deviceModel.value.threshold1 = Get.parameters['threshold1'] ?? "";
    controller.deviceModel.value.threshold2 = Get.parameters['threshold2'] ?? "";
    controller.deviceModel.value.threshold3 = Get.parameters['threshold3'] ?? "";
    return Obx(() {
      return Scaffold(
        appBar: CustomAppBar(
          title: controller.deviceModel.value.name,
          actionIcon: const Text('Sửa', style: TextStyle(color: Colors.black),),
          actionFunc: (){
            Get.toNamed(kEditDevicePage);
          },
        ),
        body: buildBody(),
      );
    });
  }

  Widget buildBody() {
    return Container(
      height: double.infinity,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_evn.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      // width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),
            liquidProgress(),
            deviceInfo(),
          ],
        ),
      ),
    );
  }

  Widget liquidProgress() {
    return SizedBox(
      width: Get.width * 0.6,
      height: Get.height * 0.3,
      child: LiquidCircularProgressIndicator(
        value: 50,
        // Defaults to 0.5.
        valueColor: const AlwaysStoppedAnimation(Colors.lightBlue),
        // Defaults to the current Theme's accentColor.
        backgroundColor: Colors.white,
        // Defaults to the current Theme's backgroundColor.
        borderColor: Colors.blue,
        borderWidth: 3.0,
        direction: Axis.vertical,
        // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
        center: centerProgress(),
      ),
    );
  }

  Widget deviceInfo() {
    final device = controller.deviceModel.value;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        child: PhysicalModel(
          color: globalController.colorBackground.value,
          elevation: 5,
          shadowColor: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                deviceInfoItem('Mã thiết bị: ',
                    device.deviceId ?? '', Colors.black),
                deviceInfoItem(
                    'Mã trạm: ', device.stationId ?? '', Colors.black),
                deviceInfoItem('Vị trí: ',
                    device.location ?? '', Colors.red),
                deviceInfoItem('Ngưỡng 1: ', device.threshold1 ?? '', Colors.red),
                deviceInfoItem('Ngưỡng 2: ', device.threshold2 ?? '', Colors.red),
                deviceInfoItem('Ngưỡng 3: ', device.threshold3 ?? '', Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget deviceInfoItem(String label, String content, Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, textAlign: TextAlign.left, style: TextStyle(color: globalController.colorText.value,),),
          Text(content, textAlign: TextAlign.right, style: TextStyle(color: globalController.colorText.value,),),
        ],
      ),
    );
  }

  Widget centerProgress() {
    final device = controller.deviceModel.value;
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Nồng độ ozone',
              style: TextStyle(fontSize: 16)),
          Text('${device.ozone ?? 10}',
              style: const TextStyle(
                  fontSize: 45,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold)),
          const Text('ppm',
              style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

}
