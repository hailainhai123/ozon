import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/constant/routes.dart';
import 'package:ozon/utils/global_controller.dart';
import '../../widget_custom/app_bar.dart';
import '../home/home_controller.dart';
import 'query_controller.dart';

class QueryPage extends GetView<QueryController> {
  QueryPage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Truy vấn',
        isBack: false,
      ),
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_evn.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              dropDownMaTram(),
              dropDownThoiGian(),
              const SizedBox(
                height: 8,
              ),
              _submitButton('Truy vấn'),
            ],
          );
        }),
      ),
    );
  }

  Widget dropDownMaTram() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: globalController.colorBackground.value,
        borderRadius: BorderRadius.circular(
          5,
        ),
        border: Border.all(
          color: globalController.colorText.value,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 8,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Mã trạm: ',
              style: TextStyle(
                fontSize: 16,
                color: globalController.colorText.value,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Text("Chọn mã trạm "),
              dropdownColor: globalController.colorBackground.value,
              value: homeController.idStation.value,
              // value: homeController.listIdStation.first,
              isDense: true,
              onChanged: (newValue) async {
                homeController.idStation.value = newValue ?? '';
                // await homeController
                //     .getListDeviceForIdStation(homeController.idStation.value);
              },
              items: homeController.listIdStation
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      color: globalController.colorText.value,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDownMaThietBi() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: globalController.colorBackground.value,
        borderRadius: BorderRadius.circular(
          5,
        ),
        border: Border.all(
          color: globalController.colorText.value,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 8,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Mã thiết bị: ',
              style: TextStyle(
                fontSize: 16,
                color: globalController.colorText.value,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Text("Chọn mã thiết bị "),
              value: homeController.idDevice.value,
              dropdownColor: globalController.colorBackground.value,
              // value: homeController.listIdStation.first,
              isDense: true,
              onChanged: (newValue) {
                homeController.idDevice.value = newValue ?? '';
              },
              items: homeController.listIdDevice
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      color: globalController.colorText.value,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDownThoiGian() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: globalController.colorBackground.value,
        borderRadius: BorderRadius.circular(
          5,
        ),
        border: Border.all(
          color: globalController.colorText.value,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 8,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Thời gian truy vấn (ngày): ',
              style: TextStyle(fontSize: 16, color: globalController.colorText.value,),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Text(""),
              value: controller.time.value,
              dropdownColor: globalController.colorBackground.value,
              // value: homeController.listIdStation.first,
              isDense: true,
              onChanged: (newValue) {
                controller.time.value = newValue ?? '';
              },
              items: controller.listTimes
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 16,color: globalController.colorText.value,),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitButton(
    String buttonText,
  ) {
    return InkWell(
      onTap: () async {
        print('${homeController.idStation.value}');
        print('${controller.time.value}');
        // homeController.listDevice.forEach((element) {
        //   if (homeController.idDevice.value == element.deviceId) {
        //     homeController.nameDevice.value = element.name;
        //   }
        // });
        homeController.listStation.forEach((element) {
          if (homeController.idStation.value == element.stationId) {
            homeController.nameStation.value = element.name;
          }
        });
        homeController.queryStation(homeController.idStation.value, controller.time.value);
        // homeController.queryStation('evnStaion2', controller.time.value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Spacer(),
          Container(
              height: 50,
              width: 160,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: globalController.colorBackground.value,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(1, 2),
                      spreadRadius: 1,
                      blurRadius: 5)
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    buttonText,
                    style: TextStyle(
                        color: globalController.colorText.value,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
