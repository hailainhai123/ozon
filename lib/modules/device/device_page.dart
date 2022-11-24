import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/modules/device/device_controller.dart';
import 'package:ozon/utils/global_controller.dart';
import 'package:ozon/widget_custom/app_bar.dart';
import '../../constant/routes.dart';
import '../../model/device_model.dart';

class DevicePage extends StatefulWidget {
  DevicePage({Key? key}) : super(key: key);

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final DeviceController controller = Get.find();
  final GlobalController globalController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    controller.idStation.value = Get.parameters['idStation'] ?? '';
    controller.getListDevice(controller.idStation.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Danh sách thiết bị',
        isBack: true,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_evn.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      width: double.infinity,
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 2,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildItem(controller.listDevice[index]);
                },
                itemCount: controller.listDevice.length,
              ),
            )
          ],
        );
      }),
    );
  }

  Widget buildItem(DeviceModel deviceModel) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(kDeviceDetailPage, parameters: {
          "deviceName": deviceModel.name!,
          "name": deviceModel.name!,
          "deviceId": deviceModel.deviceId!,
          "stationId": deviceModel.stationId!,
          "location": deviceModel.location!,
          "threshold1": deviceModel.threshold1!,
          "threshold2": deviceModel.threshold2!,
          "threshold3": deviceModel.threshold3!,
        });
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        child: PhysicalModel(
          color: globalController.colorBackground.value,
          elevation: 5,
          shadowColor: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                deviceModel.name ?? '',
                style: TextStyle(
                  color: globalController.colorText.value,
                ),
              ),
              Text('${deviceModel.ozone}',
                  style: const TextStyle(
                      fontSize: 45,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              Text('ppm',
                  style: TextStyle(
                    fontSize: 16,
                    color: globalController.colorText.value,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
