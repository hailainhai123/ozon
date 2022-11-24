import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ozon/constant/icons_path.dart';
import 'package:ozon/constant/routes.dart';
import 'package:ozon/constant/styles.dart';
import 'package:ozon/modules/user/user_controller.dart';
import 'package:ozon/utils/global_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mqtt/constants.dart';
import '../../widget_custom/app_bar.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final GlobalController globalController = Get.find();

  final UserController controller = Get.find();

  void getInformationUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    controller.ten.value = prefs.getString(Constants.user) ?? 'Admin';
    controller.userName.value = prefs.getString(Constants.nameUser) ?? 'adminTest';
    controller.diaChi.value = prefs.getString(Constants.address) ?? 'Ha Noi';
    controller.sdt.value = prefs.getString(Constants.phone) ?? '0123456789';

    print('haiabcd ${controller.ten.value}');
    print('haiabcd ${controller.userName.value}');
    print('haiabcd ${controller.diaChi.value}');
    print('haiabcd ${controller.sdt.value}');
  }

  @override
  void initState() {
    // TODO: implement initState
    getInformationUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cài đặt',
        isBack: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          // color: Color(0xffe7eaf2),
          image: DecorationImage(
            image: AssetImage("assets/images/bg_evn.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infomationUser(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  getInformation(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  apperance(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  otherSetting(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  _logoutContainer(
                    'Đăng xuất',
                    globalController.colorBackground.value,
                    const Icon(
                      Icons.power_settings_new,
                      color: Colors.red,
                    ),
                    context,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _logoutContainer(
      String title, Color color, Widget icon, BuildContext context) {
    return InkWell(
      onTap: () {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Spacer(),
          Container(
              height: 50,
              width: 160,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(1, 2),
                      spreadRadius: 1,
                      blurRadius: 5)
                ],
                borderRadius: BorderRadius.circular(8.0),
                color: color,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: globalController.colorText.value,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  icon != null ? icon : const Spacer(),
                ],
              )),
          const Spacer(),
        ],
      ),
    );
  }

  Widget infomationUser() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: Get.width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 2),
              spreadRadius: 1,
              blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(8),
        color: globalController.colorBackground.value,
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(kInforPage);
        },
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                minRadius: 40,
                child: Text(
                  controller.ten.value[0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.ten.value,
                    style: TextStyle(
                      color: globalController.colorText.value,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(controller.diaChi.value, style: TextStyle(
                    color: globalController.colorText.value,
                  ),),
                ],
              ),
            ),
            Icon(Icons.edit,color: globalController.colorText.value,),
          ],
        ),
      ),
    );
  }

  Widget getInformation() {
    return Container(
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
      child: InkWell(
        onTap: () {
          Get.toNamed(kInforPage);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tài khoản',
              style: TextStyle(
                color: globalController.colorText.value,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            itemRow("assets/images/button_persion.png", 'Thông tin người dùng'),
            const Divider(
              color: Colors.grey,
              thickness: 1.5,
            )
          ],
        ),
      ),
    );
  }

  Widget apperance() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: Get.width,
      decoration: BoxDecoration(
        color: globalController.colorBackground.value,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(1, 2),
              spreadRadius: 1,
              blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Giao diện',
            style: TextStyle(
              color: globalController.colorText.value,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                child: SvgPicture.asset(
                  globalController.darkTheme.value
                      ? IconsPath.darkMode
                      : IconsPath.lightMode,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                  child: globalController.darkTheme.value
                      ? Text(
                          'Giao diện tối',
                          style: TextStyle(
                            color: globalController.colorText.value,
                          ),
                        )
                      : Text(
                          'Giao diện sáng',
                          style: TextStyle(
                            color: globalController.colorText.value,
                          ),
                        )),
              Switch(
                // This bool value toggles the switch.
                value: globalController.darkTheme.value,
                activeColor: Colors.red,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  globalController.darkTheme.value = value;
                  if (globalController.darkTheme.value) {
                    globalController.colorBackground.value = Colors.black;
                    globalController.colorText.value = Colors.white;
                  } else {
                    globalController.colorBackground.value = Colors.white;
                    globalController.colorText.value = Colors.black;
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          itemRow("assets/images/button_text_size.png", 'Cỡ chữ'),
          const Divider(
            color: Colors.grey,
            thickness: 1.5,
          )
        ],
      ),
    );
  }

  Widget otherSetting() {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cài đặt khác',
            style: TextStyle(
              color: globalController.colorText.value,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                child: Image.asset(
                  "assets/images/button_security.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(child: Text('Bảo mật', style: TextStyle(
                color: globalController.colorText.value,
              ),)),
              Container(
                height: 24,
                width: 24,
                child: Image.asset(
                  "assets/images/button_da_bao_mat.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Icon(Icons.chevron_right, color: globalController.colorText.value,),
            ],
          ),
          // const SizedBox(
          //   height: 8.0,
          // ),
          // Row(
          //   children: [
          //     Container(
          //       height: 30,
          //       width: 30,
          //       child: Image.asset(
          //         "assets/images/button_bao_hanh.png",
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 16.0,
          //     ),
          //     Expanded(child: Text('Chính sách bảo hành',style: TextStyle(
          //       color: globalController.colorText.value,
          //     ),)),
          //     Container(
          //       height: 24,
          //       width: 24,
          //       child: Image.asset(
          //         "assets/images/button_da_bao_hanh.png",
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 8.0,
          //     ),
          //     Icon(Icons.chevron_right, color: globalController.colorText.value,),
          //   ],
          // ),
          const SizedBox(
            height: 8.0,
          ),
          itemRow("assets/images/button_thong_bao.png", 'Thông báo'),
          const SizedBox(
            height: 8.0,
          ),
          itemRow("assets/images/button_ho_tro.png", 'Hỗ trợ'),
          const SizedBox(
            height: 8.0,
          ),
          itemRow("assets/images/button_danh_gia.png", 'Đánh giá'),
          const Divider(
            color: Colors.grey,
            thickness: 1.5,
          )
        ],
      ),
    );
  }

  Widget itemRow(
    String image,
    String title,
  ) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
            child: Text(
          title,
          style: TextStyle(
            color: globalController.colorText.value,
          ),
        )),
        const SizedBox(
          width: 8.0,
        ),
        Icon(
          Icons.chevron_right,
          color: globalController.colorText.value,
        ),
      ],
    );
  }
}
