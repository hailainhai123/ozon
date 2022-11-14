import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/constant/routes.dart';
import 'package:ozon/modules/user/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mqtt/constants.dart';
import '../../widget_custom/app_bar.dart';

class UserPage extends GetView<UserController> {
  UserPage({Key? key}) : super(key: key);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tài khoản',
        isBack: false,
      ),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_evn.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        // color: Color(0xffe7eaf2),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.fromLTRB(40.0, 40, 40, 40),
            child: Obx(
              () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.brown.shade800,
                        minRadius: 40,
                        child: Text(
                          controller.ten.value[0].toUpperCase(),
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    _placeContainer('Tên: ${controller.ten.value}',
                        Colors.white,),
                    _placeContainer(
                        'Tên đăng nhập: ${controller.userName.value}', Colors.white, ),
                    _placeContainer('Địa chỉ: ${controller.diaChi.value}',
                        Colors.white,
                        ),
                    _placeContainer(
                            'SĐT: ${controller.sdt.value}',
                        Colors.white,
                        ),
                    _logoutContainer(
                      'Đăng xuất',
                      const Color(0xffffffff),
                      const Icon(
                        Icons.power_settings_new,
                        color: Colors.red,
                      ),
                      context,
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoutContainer(String title, Color color, Widget icon, BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Bạn muốn đăng xuất ?'),
                // content: new Text('Bạn muốn thoát ứng dụng?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Hủy'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      await prefs.setBool(Constants.signedIn, false);
                      Get.offAndToNamed(kLoginPage);
                    },
                    child: const Text('Đồng ý'),
                  ),
                ],
              );
            });
      },
      child: Column(
        children: <Widget>[
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 40,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: color),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  icon != null ? icon : const Spacer(),
                ],
              ))
        ],
      ),
    );
  }


  Widget _placeContainer(String title, Color color) {
    if (title.length > 20) {
      title = title.substring(0, 20) + '...';
    }
    return Column(
      children: <Widget>[
        Container(
            height: 50,
            width: Get.width - 40,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: color),
            child: Row(
              children: <Widget>[
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ))
      ],
    );
  }

}
