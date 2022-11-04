import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../constant/theme.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: kPrimaryColor));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Danh Sách Trạm',
        ),
        centerTitle: true,
      ),
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
      // color: Colors.white,
      child: Column(
        children: [
          buildTableTitle(),
        ],
      ),
    );
  }

  Widget buildTableTitle() {
    return Container(
      // color: Colors.yellow,
      height: 40,
      child: Row(
        children: [
          buildTextLabel('STT', 1),
          verticalLine(),
          buildTextLabel('Mã', 3),
          verticalLine(),
          buildTextLabel('Ví trí', 3),
          verticalLine(),
          // buildTextLabel('Sđt', 3),
          // verticalLine(),
          buildTextLabel('Sửa', 1),
        ],
      ),
    );
  }

  Widget buildTextLabel(String data, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: Text(
        data,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget verticalLine() {
    return Container(
      height: double.infinity,
      width: 1,
      color: Colors.grey,
    );
  }

  Widget horizontalLine() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey,
    );
  }

}
