import 'package:flutter/material.dart';

class InsurancePage extends StatelessWidget {
  InsurancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Bảo hành',
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/cres_bg.jpg"),
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
