import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ozon/modules/home/home_controller.dart';
import 'package:ozon/modules/query/query_controller.dart';
import 'package:ozon/widget_custom/app_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/colors.dart';
import '../../../widget_custom/touchable_opacity.dart';

class LineChartOzonPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LineChartOzonPage({Key? key}) : super(key: key);

  @override
  LineChartOzonPageState createState() => LineChartOzonPageState();
}

class LineChartOzonPageState extends State<LineChartOzonPage> {
  final HomeController homeController = Get.find();
  final QueryController controller = Get.find();

  List<OzonData> data = [
    OzonData('1', 35),
    OzonData('2', 28),
    OzonData('3', 34),
    OzonData('4', 32),
    OzonData('5', 40),
    OzonData('6', 36),
    OzonData('7', 25),
  ];

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     appBar: CustomAppBar(
    //       title: 'Biểu đồ Ozon',
    //     ),
    //     body: SingleChildScrollView(
    //       child: Container(
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(
    //             5,
    //           ),
    //           border: Border.all(
    //             color: Colors.black,
    //           ),
    //         ),
    //         margin: const EdgeInsets.symmetric(
    //           horizontal: 4,
    //           vertical: 16,
    //         ),
    //         child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               //Initialize the chart widget
    //               SfCartesianChart(
    //                   primaryXAxis: CategoryAxis(),
    //                   // Chart title
    //                   title: ChartTitle(
    //                       text: '${controller.nameDevice.value} thuộc trạm ${controller.nameStation.value}'),
    //                   // Enable legend
    //                   legend: Legend(isVisible: true),
    //                   // Enable tooltip
    //                   tooltipBehavior: TooltipBehavior(enable: true),
    //                   series: <ChartSeries<OzonData, String>>[
    //                     LineSeries<OzonData, String>(
    //                         dataSource: data,
    //                         xValueMapper: (OzonData sales, _) => sales.day,
    //                         yValueMapper: (OzonData sales, _) => sales.ozon,
    //                         name: 'ozone',
    //                         // Enable data label
    //                         dataLabelSettings: const DataLabelSettings(
    //                             isVisible: true))
    //                   ]),
    //             ]),
    //       ),
    //     ),
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Thống kê ${homeController.nameStation.value}', style: const TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: TouchableOpacity(
            onTap: () {
              Get.back();
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
                'Nồng độ ozone',
                'Thời gian',
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
        height: (homeController.listDeviceQuery.length)  * 36,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          itemCount: homeController.listDeviceQuery.length,
          itemBuilder: (context, index) {
            final device = homeController.listDeviceQuery[index];
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  buildRow([
                    (index + 1).toString(),
                    device.ozone.toString() ?? '',
                    device.time ?? '',
                  ],
                    // colorText: homeController.color.value,
                  ),
                ],
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

class OzonData {
  OzonData(this.day, this.ozon);

  final String day;
  final double ozon;
}