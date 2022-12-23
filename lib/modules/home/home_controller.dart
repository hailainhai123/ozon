import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/model/device_model.dart';
import 'package:ozon/model/station_model.dart';
import 'package:ozon/model/user_model.dart';

import '../../api/api_dio_controller.dart';
import '../bottom_app_bar/navigation_controller.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final RxDouble opacity = 0.0.obs;
  final RxDouble bgHeight = kBgHeight.obs;
  late ScrollController scrollController;
  late TabController tabController;
  int currentIndex = 0;
  late Timer timer;
  var listStation = <StationModel>[].obs;
  var listIdStation = <String>[].obs;
  var listDevice = <DeviceModel>[].obs;
  var listDeviceQuery = <DeviceModel>[].obs;
  var listIdDevice = <String>[].obs;
  var idStation = ''.obs;
  var idDevice = ''.obs;
  var nameDevice = ''.obs;
  var nameStation = ''.obs;
  var color = Colors.black.obs;
  var userModel = UserModel().obs;
  var isOzon = true.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    initData();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (currentIndex < tabController.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      tabController.animateTo(
        currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    bgHeight.value = 200.0;
    scrollController.addListener(onScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    scrollController.dispose();
  }

  refreshController() {
    bgHeight.value = 200.0;
    scrollController.dispose();
    scrollController = ScrollController();
    scrollController.addListener(onScrolling);
  }

  Future<void> initData() async {
    tabController = TabController(length: 4, vsync: this);
    // await getListStation();
    // await getListDeviceForIdStation(idStation.value);
  }

  onScrolling() {
    calculateBgHeight();
    calculateAppbarOpacity();
  }

  calculateAppbarOpacity() {
    double opa = (1 - 0.006 * scrollController.offset).clamp(0.0, 1.0);
    opacity.value = 1 - opa;
  }

  calculateBgHeight() {
    bgHeight.value =
        (kBgHeight - scrollController.offset).clamp(0.0, kBgHeight);
  }

  Future<void> getListStation() async {
    listStation.clear();
    listIdStation.clear();
    try {
      if (isOzon.value) {
        var list = await ApiDioController.getAllStation();
        listStation.addAll(list);
        for (var element in listStation) {
          listIdStation.add(element.stationId);
          idStation.value = listIdStation.first;
        }
      } else {}
    } catch (e) {
      print(e);
    }
  }

  Future<void> getListDeviceForIdStation(String idStation) async {
    listDevice.clear();
    listIdDevice.clear();
    try {
      var list = await ApiDioController.getDeviceForIdStation(idStation);
      listDevice.addAll(list);
      for (var element in listDevice) {
        listIdDevice.add(element.deviceId ?? '');
        idDevice.value = listIdDevice.first;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> queryStation(
      String idStation, String time, String nguong) async {
    listDevice.clear();
    listIdDevice.clear();
    try {
      var list = await ApiDioController.queryStation(idStation, time, nguong);
      listDevice.addAll(list);
      for (var element in listDevice) {
        listIdDevice.add(element.deviceId ?? '');
        idDevice.value = listIdDevice.first;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> queryDetail(
    String idDevice,
    String time,
  ) async {
    listDeviceQuery.clear();
    try {
      var list = await ApiDioController.queryDetail(
        idDevice,
        time,
      );
      listDeviceQuery.addAll(list);
    } catch (e) {
      print(e);
    }
  }
}
