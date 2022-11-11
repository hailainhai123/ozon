import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/constant/routes.dart';
import 'package:ozon/model/station_model.dart';

import '../../widget_custom/app_bar.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.find();
  ScrollController scrollController = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  Widget itemStation(StationModel stationModel) {
    return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    stationModel.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Mã trạm: ${stationModel.stationId}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Địa điểm: ${stationModel.location}   ",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Image.asset(
                      //   "assets/images/green_dot.png",
                      //   height: 20,
                      // ),
                      // Text(
                      //   "${post["active"]}   ",
                      //   style: const TextStyle(
                      //       fontSize: 12,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Image.asset(
                      //   "assets/images/red_dot.png",
                      //   height: 20,
                      // ),
                      // Text(
                      //   "${post["stop"]}",
                      //   style: const TextStyle(
                      //       fontSize: 12,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold),
                      // )
                    ],
                  )
                ],
              ),
              Image.asset(
                "assets/images/item_ozon_transparent.png",
                height: 60,
              )
            ],
          ),
        ));
  }

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
    final Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Danh sách trạm',
          isBack: false,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_evn.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          height: size.height,
          child: Obx(
            () {
              return Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: controller.listStation.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            double scale = 1.0;
                            if (topContainer > 0.5) {
                              scale = index + 0.5 - topContainer;
                              if (scale < 0) {
                                scale = 0;
                              } else if (scale > 1) {
                                scale = 1;
                              }
                            }
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(kDevicePage);
                              },
                              child: Align(
                                // heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemStation(controller.listStation[index]),),
                            );
                          })),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
