import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/mqtt/mqttBrowserWrapper.dart';
import 'package:ozon/mqtt/mqttClientWrapper.dart';

import '../../model/device_model.dart';
import '../bottom_app_bar/navigation_controller.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final RxDouble opacity = 0.0.obs;
  final RxDouble bgHeight = kBgHeight.obs;
  late ScrollController scrollController;
  late TabController tabController;
  int currentIndex = 0;
  late Timer timer;

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

  Future initData() async {
    tabController = TabController(length: 4, vsync: this);
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

  var FOOD_DATA = [
    {
      "name":"Burger",
      "brand":"Hawkers",
      "price":2.99,
      "image":"burger.png"
    },{
      "name":"Cheese Dip",
      "brand":"Hawkers",
      "price":4.99,
      "image":"cheese_dip.png"
    },
    {
      "name":"Cola",
      "brand":"Mcdonald",
      "price":1.49,
      "image":"cola.png"
    },
    {
      "name":"Fries",
      "brand":"Mcdonald",
      "price":2.99,
      "image":"fries.png"
    },
    {
      "name":"Ice Cream",
      "brand":"Ben & Jerry's",
      "price":9.49,
      "image":"ice_cream.png"
    },
    {
      "name":"Noodles",
      "brand":"Hawkers",
      "price":4.49,
      "image":"noodles.png"
    },
    {
      "name":"Pizza",
      "brand":"Dominos",
      "price":17.99,
      "image":"pizza.png"
    },
    {
      "name":"Sandwich",
      "brand":"Hawkers",
      "price":2.99,
      "image":"sandwich.png"
    },
    {
      "name":"Wrap",
      "brand":"Subway",
      "price":6.99,
      "image":"wrap.png"
    }
  ];
}
