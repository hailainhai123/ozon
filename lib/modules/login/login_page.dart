import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../constant/icons_path.dart';
import '../../constant/routes.dart';
import '../../constant/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _entryField(String title, TextEditingController _controller,
      {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: _controller,
              obscureText: isPassword,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey,
                  filled: true))
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        Container(
          // decoration: BoxDecoration(
          //   color: Colors.white.withOpacity(0.7)
          // ),
          child: _entryField("Tên đăng nhập", _emailController),
        ),
        _entryField("Mật khẩu", _passwordController, isPassword: true),
      ],
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        print('1');
        Get.toNamed(kRouteIndex);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.lightBlueAccent, Colors.blueAccent])),
        child: const Text(
          'Đăng nhập',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: Get.width,
                  child: AspectRatio(
                      aspectRatio: 359 / 286,
                      child: SvgPicture.asset(
                        IconsPath.imageBackground,
                        color: kPrimaryColor,
                      ))),
              const SizedBox(height: 300)
            ],
          ),
          SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: SizedBox(
                                  width: Get.width / 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                        'assets/images/bg_image_2.jpg'),
                                  ),
                                )),
                            const SizedBox(
                              height: 8.0,
                            ),
                            _emailPasswordWidget(),
                            const SizedBox(
                              height: 16.0,
                            ),
                            _submitButton(),

                            // TODO đăng nhập vs fb, gg, apple
                            // SizedBox(
                            //   width: 250,
                            //   height: 50,
                            //   child: SignInButton(
                            //     Buttons.googleDark,
                            //     text: "Đăng nhập với Google",
                            //     padding: const EdgeInsets.all(15),
                            //     onPressed: () async {
                            //     },
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 8,
                            // ),
                            // SizedBox(
                            //   width: 250,
                            //   height: 50,
                            //   child: SignInButton(
                            //     Buttons.facebookNew,
                            //     text: "Đăng nhập với Facebook",
                            //     padding: const EdgeInsets.all(15),
                            //     onPressed: () {
                            //     },
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 8,
                            // ),
                            // GetPlatform.isIOS
                            //     ? SizedBox(
                            //   width: 250,
                            //   height: 50,
                            //   child: SignInButton(
                            //     Buttons.apple,
                            //     text: "Đăng nhập với Apple",
                            //     padding: const EdgeInsets.all(15),
                            //     onPressed: () {
                            //     },
                            //   ),
                            // )
                            //     : const SizedBox()
                          ],
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

