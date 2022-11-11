
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/modules/device/device_controller.dart';
import 'package:ozon/modules/station/station_controller.dart';

import '../../../utils/colors.dart';
import '../../../widget_custom/app_bar.dart';
import '../../../widget_custom/touchable_opacity.dart';

class AddDevicePage extends GetView<DeviceController> {
  const AddDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
      title: 'Thêm thiết bị',
      isBack: true,
    ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            idDeviceContainer(
              'Mã thiết bị',
              const Icon(Icons.vpn_key),
              TextInputType.text,
              controller.stationIdController,
            ),
            idDeviceContainer(
              'Mã admin',
              const Icon(Icons.vpn_key),
              TextInputType.text,
              controller.adminIdController,
            ),
            buildTextField(
              'Tên',
              const Icon(Icons.email),
              TextInputType.text,
              controller.nameController,
            ),
            buildTextField(
              'Vị trí',
              const Icon(Icons.email),
              TextInputType.text,
              controller.locationController,
            ),
            buildTextField(
              'Mô tả',
              const Icon(Icons.email),
              TextInputType.text,
              controller.descriptionController,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget idDeviceContainer(String labelText, Icon prefixIcon,
      TextInputType keyboardType, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 44,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        autocorrect: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: labelText,
          // labelStyle: ,
          // hintStyle: ,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () async {
              // String? cameraScanResult = await scanner.scan();
              // controller.text = cameraScanResult!;
            },
          ),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, Icon prefixIcon,
      TextInputType keyboardType, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 44,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        autocorrect: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: labelText,
          // labelStyle: ,
          // hintStyle: ,
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          // suffixIcon: Icon(Icons.account_balance_outlined),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }

  Widget buildButton() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 32,
      ),
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                print('Back');
                Get.back(closeOverlays: true);
              },
              child: const Text('Hủy'),
            ),
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () async {
                if (await controller.registerDevice()) {
                  print('Them thanh cong');
                  Get.back(closeOverlays: true);
                }
              },
              color: Colors.blue,
              child: const Text('Lưu'),
            ),
          ),
        ],
      ),
    );
  }
}
