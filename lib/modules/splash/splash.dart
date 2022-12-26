import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/styles.dart';
import '../../utils/colors.dart';
import '../../utils/global_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final globalController = Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        SizedBox(
          height: Get.height / 4,
        ),
        Expanded(child: Column(
          children: [
            Image.asset("assets/images/ic_evn.png"),
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: Get.width / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset('assets/images/bg_image_2.jpg'),
                  ),
                ),),
          ],
        )),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'Phiên bản 1.0.0',
          style:
          Styles.subtitleSmallest.copyWith(color: AppColors.black),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          'Sản phẩm phát triển bởi công ty TAWU',
          style: Styles.heading4.copyWith(color: AppColors.black),
        ),
      ],
    ));
  }
}
