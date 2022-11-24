import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/modules/user/pages/tf_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/routes.dart';
import '../../../mqtt/constants.dart';
import '../../../utils/global_controller.dart';
import '../../../widget_custom/app_bar.dart';
import '../../../widget_custom/touchable_opacity.dart';
import '../user_controller.dart';

class ProfilePage extends GetView<UserController> {
  ProfilePage({Key? key}) : super(key: key);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Thông tin cá nhân',
        isBack: true,
        actionIcon: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            Icons.power_settings_new,
            color: Colors.red,
          ),
        ),
        actionFunc: (){
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('Bạn muốn đăng xuất ?'),
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
      ),
      body: Container(
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
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Obx(() {
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  // CircleAvatar(
                  //     backgroundColor: globalController.colorBackground.value,
                  //     minRadius: 40,
                  //     child: Text(
                  //       controller.ten.value[0].toUpperCase(),
                  //       style: TextStyle(
                  //         color: globalController.colorText.value,
                  //           fontSize: 30, fontWeight: FontWeight.bold),
                  //     )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: Get.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(1, 2),
                            spreadRadius: 1,
                            blurRadius: 5)
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: globalController.colorBackground.value,
                    ),
                    child: Column(
                      children: [
                        ProfileTextField(
                          // icon: Icon(Icons.person, color: Colors.black.withOpacity(0.4)),
                          labelText: "Họ và tên",
                          initValue: controller.ten.value,
                        ),
                        ProfileTextField(
                          labelText: "Tên đăng nhập",
                          initValue: controller.userName.value,
                        ),
                        ProfileTextField(
                          labelText: "Số điện thoại",
                          initValue: controller.sdt.value,
                        ),
                        ProfileTextField(
                          labelText: "Ngày sinh",
                          initValue: controller.birthDate.value,
                        ),
                        ProfileTextField(
                          labelText: "Địa chỉ",
                          initValue: controller.diaChi.value,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
