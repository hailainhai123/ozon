import 'package:flutter/material.dart';

import '../../widget_custom/app_bar.dart';

class InsurancePage extends StatelessWidget {
  InsurancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Truy vấn',
        isBack: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_evn.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            'Chức năng đang phát triển',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
