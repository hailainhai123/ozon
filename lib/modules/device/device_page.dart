import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:ozon/modules/device/device_controller.dart';
import 'package:ozon/widget_custom/app_bar.dart';

import '../../constant/routes.dart';
import '../../model/device_model.dart';
import '../../utils/colors.dart';
import '../../widget_custom/touchable_opacity.dart';

class DevicePage extends StatelessWidget {
  DevicePage({Key? key}) : super(key: key);

  final DeviceController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Danh sách thiết bị',
        isBack: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.toNamed(kAddDevicePage);
      //   },
      //   elevation: 2.0,
      //   child: const Icon(Icons.add),
      // ),
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
        }
      ),
    );
  }

  Widget buildItem(DeviceModel deviceModel) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(kDeviceDetailPage);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        child: PhysicalModel(
          color: Colors.white.withOpacity(0.8),
          elevation: 5,
          shadowColor: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                // deviceModel.deviceId ?? "",
                "ma thiet bi",
              ),
              Text( '20',
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              Text('ppm',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  Widget centerProgress() {
    return Stack(
      alignment: Alignment.center,
      children: const [
        ImageIcon(
          AssetImage(
            'assets/images/water_drop.png',
          ),
          size: 30,
          color: Colors.blue,
        ),
        Text('1', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
