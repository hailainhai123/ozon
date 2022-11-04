import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:ozon/modules/device/device_controller.dart';

import '../../constant/routes.dart';
import '../../model/device_model.dart';

class DevicePage extends StatelessWidget {
  DevicePage({Key? key}) : super(key: key);

  final DeviceController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Danh sách trạm'),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Get.toNamed(kLoginPage);
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>
          //         AddDeviceScreen(
          //           updateCallback: (device) {
          //             getDevices();
          //           },
          //         ),
          //   ),
          // );
        },
        elevation: 2.0,
        child: const Icon(Icons.add),
      ),
      // body: controller.isLoading.value
      //     ? const Center(
      //   child: CircularProgressIndicator(),
      // )
      //     : buildBody(),
      body: buildBody(),
    );
  }
  Widget buildBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/cres_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 10,
                mainAxisSpacing: 2,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return buildItem(controller.listDevice[index]);
              },
              itemCount: controller.listDevice.length,
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(DeviceModel deviceModel) {
    return GestureDetector(
      onTap: () {
        // _selectedDevice = tb.mathietbi;
        // navigatorPush(
        //     context,
        //     DeviceDetailScreen(
        //       thietBi: tb,
        //       updateCallback: (device) {
        //         getDevices();
        //       },
        //     ));
      },
      onLongPress: () {
        // showDialog(
        //   context: context,
        //   builder: (context)
        //   =>
        //       AlertDialog(
        //         title: new Text(
        //           'Xóa thiết bị ?',
        //         ),
        //         actions: <Widget>[
        //           new FlatButton(
        //             onPressed: () =>
        //             {
        //               Navigator.of(context).pop(),
        //             },
        //             child: new Text(
        //               'Hủy',
        //             ),
        //           ),
        //           new FlatButton(
        //             onPressed: () {
        //               pubTopic = 'deletetb';
        //               ThietBi t = ThietBi(
        //                 iduser,
        //                 tb.mathietbi,
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 '',
        //                 Constants.mac,
        //               );
        //               publishMessage(pubTopic, jsonEncode(t));
        //             },
        //             child: new Text(
        //               'Đồng ý',
        //             ),
        //           ),
        //         ],
        //       ),
        // );
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        child: PhysicalModel(
          color: Colors.white.withOpacity(0.8),
          elevation: 5,
          shadowColor: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                deviceModel.mathietbi ?? "",
              ),
              Container(
                width: 100,
                height: 100,
                child: LiquidCircularProgressIndicator(
                  value: 0.5,
                  // Defaults to 0.5.
                  valueColor: const AlwaysStoppedAnimation(Colors.lightBlue),
                  // Defaults to the current Theme's accentColor.
                  backgroundColor: Colors.white,
                  // Defaults to the current Theme's backgroundColor.
                  borderColor: Colors.blue,
                  borderWidth: 1.0,
                  direction: Axis.vertical,
                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                  center: centerProgress(),
                ),
              ),
              // Image.asset(
              //   'images/water_filter.png',
              //   width: 60,
              //   height: 60,
              //   fit: BoxFit.cover,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget centerProgress() {
    return Stack(
      alignment: Alignment.center,
      children: const [
        ImageIcon(
          AssetImage(
            'images/water_drop.png',
          ),
          size: 30,
          color: Colors.blue,
        ),
        Text('1', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
