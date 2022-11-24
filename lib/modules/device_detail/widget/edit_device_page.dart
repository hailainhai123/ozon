import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/modules/device_detail/device_detail_controller.dart';
import 'package:ozon/modules/device_detail/widget/item_edit_infomation.dart';
import 'package:ozon/utils/global_controller.dart';
import 'package:ozon/widget_custom/app_bar.dart';

import '../../user/pages/tf_profile.dart';

class EditDevicePage extends GetView<DeviceDetailController> {
  EditDevicePage({Key? key}) : super(key: key);
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chỉnh sửa thông tin thiết bị',
        actionFunc: () {
          controller.updateDevice(controller.deviceModel.value);
        },
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(16,),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_evn.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(1, 2),
                    spreadRadius: 1,
                    blurRadius: 5)
              ],
              borderRadius: BorderRadius.circular(8),
              color: globalController.colorBackground.value,
            ),
            child: Column(
              children: [
                ItemEditInformation(
                  isEnable: false,
                    textCapitalization: TextCapitalization.words,
                    // onChangeValue: controller.onChangeFullName,
                    hintText: 'Mã thiết bị',
                    labelText: controller.deviceModel.value.deviceId
                ),
                ItemEditInformation(
                  isEnable: false,
                    textCapitalization: TextCapitalization.words,
                    // onChangeValue: _controller.onChangeFullName,
                    hintText: 'Mã trạm',
                    labelText: controller.deviceModel.value.stationId
                ),
                ItemEditInformation(
                    textCapitalization: TextCapitalization.words,
                    onChangeValue: controller.onChangeDevicelName,
                    hintText: 'Tên thiết bị',
                    labelText: controller.deviceModel.value.name
                ),
                ItemEditInformation(
                    textCapitalization: TextCapitalization.words,
                    // onChangeValue: _controller.onChangeFullName,
                    hintText: 'Vị trí',
                    labelText: controller.deviceModel.value.location
                ),
                ItemEditInformation(
                    textCapitalization: TextCapitalization.words,
                    onChangeValue: controller.onChangeThreshold1,
                    hintText: 'Ngưỡng 1',
                    labelText: controller.deviceModel.value.threshold1
                ),
                ItemEditInformation(
                    textCapitalization: TextCapitalization.words,
                    onChangeValue: controller.onChangeThreshold2,
                    hintText: 'Ngưỡng 2',
                    labelText: controller.deviceModel.value.threshold2
                ),
                ItemEditInformation(
                    textCapitalization: TextCapitalization.words,
                    onChangeValue: controller.onChangeThreshold3,
                    hintText: 'Ngưỡng 3',
                    labelText: controller.deviceModel.value.threshold3
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
