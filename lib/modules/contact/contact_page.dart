import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Liên hệ',
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
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      child: Column(
                        children: [
                          deviceInfoItem(
                              'Công ty: ', 'Techno Corp', Colors.green),
                          deviceInfoItem('Email: ', 'Email', Colors.green),
                          deviceInfoItem(
                              'Số điện thoại: ', '0912345678', Colors.green),
                          deviceInfoItem('Địa chỉ: ', 'Hà Nội', Colors.green),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
}