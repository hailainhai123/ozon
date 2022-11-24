import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/modules/home/home_controller.dart';
import 'package:ozon/widget_custom/app_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartOzonPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LineChartOzonPage({Key? key}) : super(key: key);

  @override
  LineChartOzonPageState createState() => LineChartOzonPageState();
}

class LineChartOzonPageState extends State<LineChartOzonPage> {
  final HomeController controller = Get.find();

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          title: 'Biểu đồ Ozon',
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                5,
              ),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 16,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Initialize the chart widget
                  SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(
                          text: '${controller.nameDevice.value} thuộc trạm ${controller.nameStation.value}'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<OzonData, String>>[
                        LineSeries<OzonData, String>(
                            dataSource: data,
                            xValueMapper: (OzonData sales, _) => sales.day,
                            yValueMapper: (OzonData sales, _) => sales.ozon,
                            name: 'ozone',
                            // Enable data label
                            dataLabelSettings: const DataLabelSettings(
                                isVisible: true))
                      ]),
                ]),
          ),
        ),
      ),
    );
  }
}

class OzonData {
  OzonData(this.day, this.ozon);

  final String day;
  final double ozon;
}