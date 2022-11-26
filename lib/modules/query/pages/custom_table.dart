import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ozon/constant/routes.dart';
import 'package:ozon/modules/home/home_controller.dart';
import 'package:ozon/modules/query/query_controller.dart';
import 'package:ozon/widget_custom/app_bar.dart';

import '../../../utils/colors.dart';
import '../../../widget_custom/touchable_opacity.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({super.key});

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {

  final HomeController homeController = Get.find();
  final QueryController controller = Get.find();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Thống kê ${homeController.nameStation.value}', style: const TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: TouchableOpacity(
            onTap: () {
              Get.back();
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeRight,
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 36,
              color: AppColors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // buildTableNote(),
                const SizedBox(
                  height: 8.0,
                ),
                buildTableOzon(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTableOzon() {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Table(
            border: TableBorder.all(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              buildRow([
                'STT',
                'Mã thiết bị',
                'Số lần vượt',
                '',
              ], isHeader: true),
            ],
          ),
        ),
        buildList(),
      ],
    );
  }

  Widget buildList() {
    return Obx(() {
      return SizedBox(
        height: (homeController.listDevice.length)  * 36,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          itemCount: homeController.listDevice.length,
          itemBuilder: (context, index) {
            final device = homeController.listDevice[index];
            final nguongCanhBao = int.parse(controller.nguongQuery.value);
            if (nguongCanhBao >= 15) {
              homeController.color.value = Colors.red;
            } else if (10 <= nguongCanhBao && nguongCanhBao < 15) {
              homeController.color.value = Colors.orange;
            } else if (5 <= nguongCanhBao && nguongCanhBao < 10) {
              homeController.color.value = Colors.yellowAccent;
            } else {
              homeController.color.value = Colors.white;
            }
            return InkWell(
              onTap: () async {
                await homeController.queryDetail(device.deviceId ?? '', controller.time.value);
                Get.toNamed(kChartPage);
              },
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Table(
                  border: TableBorder.all(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    buildRow([
                      (index + 1).toString(),
                      device.deviceId ?? '',
                      device.soLanVuot.toString(),
                      'Chi Tiết',
                    ],
                      // colorText: homeController.color.value,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  TableRow buildRow(List<String> cells,
      {bool isHeader = false, Color colorText = Colors.white}) {
    final style = TextStyle(
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      fontSize: 18,
      // color: colorText,
    );
    return TableRow(
      children: cells.map((cell) {
        return Container(
          height: 36,
          color: colorText,
          child: Center(
              child: Text(
                cell,
                textAlign: TextAlign.center,
                style: style,
              )),
        );
      }).toList(),
    );
  }
}
