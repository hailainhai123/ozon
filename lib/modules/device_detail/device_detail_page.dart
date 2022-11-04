import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class DeviceDetailPage extends StatelessWidget {
  const DeviceDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Chi tiết thiết bị',
        ),
        centerTitle: true,
      ),
      body: buildBody(),
    );
  }
  Widget buildBody() {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.yellow,
        image: DecorationImage(
          image: AssetImage("assets/images/cres_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),
            liquidProgress(),
            deviceInfo(),
            deleteButton(),
          ],
        ),
      ),
    );
  }
  Widget liquidProgress() {
    return Container(
      width: Get.width * 0.7,
      height: Get.height * 0.7,
      child: LiquidCircularProgressIndicator(
        value: 50,
        // Defaults to 0.5.
        valueColor: const AlwaysStoppedAnimation(Colors.lightBlue),
        // Defaults to the current Theme's accentColor.
        backgroundColor: Colors.white,
        // Defaults to the current Theme's backgroundColor.
        borderColor: Colors.blue,
        borderWidth: 3.0,
        direction: Axis.vertical,
        // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
        center: centerProgress(),
      ),
    );
  }

  Widget deleteButton() {
    return Container(
      height: 36,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 86,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(1.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
            Text(
              'Xóa thiết bị',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget deviceInfo() {
    String trangthai = '';
    switch ('1') {
      case '1':
        trangthai = 'Lọc';
        break;
      case '2':
        trangthai = 'Xả';
        break;
      case '3':
        trangthai = 'Rửa hóa chất';
        break;
      case '4':
        trangthai = 'Dừng máy';
        break;
      case '5':
        trangthai = 'Mất kết nối';
        break;
      default:
        trangthai = 'Không hoạt động';
        break;
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 5,
          shadowColor: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                deviceInfoItem('Tình trạng máy: ', trangthai, Colors.green),
                deviceInfoItem('Tên máy: ',
                   '', Colors.black),
                deviceInfoItem(
                    'Điện áp: ', '', Colors.black),
                deviceInfoItem('TDS: ', '', Colors.black),
                deviceInfoItem(
                    'Số lõi: ', '', Colors.black),
                deviceInfoItem('Ngày kích hoạt ',
                    '', Colors.red),
                deviceInfoItem('Thời gian bảo hành ', '3 năm', Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget deviceInfoItem(String label, String content, Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, textAlign: TextAlign.left),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(content,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }

  Widget centerProgress() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text('Chỉ số tinh khiết',
              style: TextStyle(fontSize: 16)),
          Text( '20',
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold)),
          Text('Tốt cho sức khỏe',
              style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

}
