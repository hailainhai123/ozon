import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ozon/constant/routes.dart';
import 'package:ozon/model/station_model.dart';
import 'package:ozon/utils/global_controller.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../widget_custom/app_bar.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.find();
  final GlobalController globalController = Get.find();
  ScrollController scrollController = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      double value = scrollController.offset / 119;
      setState(() {
        topContainer = value;
        closeTopContainer = scrollController.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Trang chủ',
        isBack: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_evn.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      controller.isOzon.value = true;
                      await controller.getListStation();
                      Get.toNamed(kStationPage);
                    },
                    child: Container(
                      height: 180,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                          color: globalController.colorBackground.value,
                          boxShadow: [
                            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Expanded(child: Text('Giám Sát Ozone')),
                            SizedBox(
                              width: 100,
                                height: 100,
                                child: Image.asset("assets/images/ozone_button.png", fit: BoxFit.fill,)),
                          ],
                        ),
                      ),              ),
                  ),
                  InkWell(
                    onTap: () async {
                      controller.isOzon.value = false;
                      await controller.getListStation();
                      Get.toNamed(kStationPage);
                    },
                    child: Container(
                      height: 180,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                          color: globalController.colorBackground.value,
                          boxShadow: [
                            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Expanded(child: Text('Giám Sát Nhiệt')),
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset("assets/images/temperature_button.png", fit: BoxFit.fill,)),
                          ],
                        ),
                      ),              ),
                  ),
                ],
              ),
              const SizedBox(height: 64,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: globalController.colorBackground.value,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                    ]),
                child: Image.asset("assets/images/evn_hn_homepage.jpg", fit: BoxFit.fill,),
              ),
              const SizedBox(height: 16,),
            ],
          ),
        )),
    );
  }
}
