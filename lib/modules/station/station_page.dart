import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/routes.dart';
import '../../model/station_model.dart';
import '../../utils/global_controller.dart';
import '../../widget_custom/app_bar.dart';
import '../home/home_controller.dart';

class StationPage extends StatefulWidget {
  const StationPage({Key? key}) : super(key: key);

  @override
  State<StationPage> createState() => _StationPageState();
}

class _StationPageState extends State<StationPage> {
  final HomeController controller = Get.find();
  final GlobalController globalController = Get.find();
  ScrollController scrollController = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  Widget itemStation(StationModel stationModel) {
    return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: globalController.colorBackground.value,
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
                    style: TextStyle(
                        color: globalController.colorText.value,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Mã trạm: ${stationModel.stationId}',
                    style: TextStyle(
                      fontSize: 12,
                      color: globalController.colorText.value,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Địa điểm: ${stationModel.location}   ",
                        style: TextStyle(
                            fontSize: 12,
                            color: globalController.colorText.value,
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
              controller.isOzon.value
                  ? Image.asset(
                      "assets/images/item_ozon_transparent.png",
                      height: 60,
                    )
                  : Image.asset(
                      "assets/images/ozone_button.png",
                      height: 60,
                    ),
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Danh sách trạm',
        isBack: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_evn.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        height: size.height,
        child: Obx(() {
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
                            Get.toNamed(kDevicePage, parameters: {
                              'idStation':
                                  controller.listStation[index].stationId
                            });
                          },
                          child: Align(
                            // heightFactor: 0.7,
                            alignment: Alignment.topCenter,
                            child: itemStation(controller.listStation[index]),
                          ),
                        );
                      })),
            ],
          );
        }),
      ),
    );
  }
}
