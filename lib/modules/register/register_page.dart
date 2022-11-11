import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/model/admin_model.dart';
import 'package:ozon/modules/register/register_controller.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../constant/routes.dart';
import '../../utils/icons.dart';
import '../../widget_custom/app_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final RegisterController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        AppInput(
          controller: _emailController,
          validator: (phoneNumber) {
            if (phoneNumber == null || phoneNumber.trim().isEmpty) {
              return '';
            }
            return null;
          },
          enabled: true,
          hintText: 'Tên đăng nhập',
          iconLeft: IconEnums.mail,
          onTapIconRight: () async {
            _emailController.clear();
          },
          enableInteractiveSelection: false,
          iconRight: IconEnums.close,
          // onChangeValue: _loginStore.onChangePhoneNumber,
          // keyboardType: TextInputType.phone,
        ),
        AppInput(
          controller: _passwordController,
          maxLine: 1,
          validator: (password) {
            if (password == null || password.isEmpty) {
              return '';
            }
            return null;
          },
          hintText: 'Mật khẩu',
          iconLeft: IconEnums.lock,
          obscureText: true,
          // onChangeValue: _loginStore.onChangePassword,
        ),
        AppInput(
          controller: _nameController,
          maxLine: 1,
          validator: (password) {
            if (password == null || password.isEmpty) {
              return '';
            }
            return null;
          },
          hintText: 'Tên',
          iconLeft: IconEnums.lock,
          // onChangeValue: _loginStore.onChangePassword,
        ),
        AppInput(
          controller: _phoneController,
          maxLine: 1,
          validator: (password) {
            if (password == null || password.isEmpty) {
              return '';
            }
            return null;
          },
          hintText: 'SĐT',
          iconLeft: IconEnums.lock,
          // onChangeValue: _loginStore.onChangePassword,
        ),
        AppInput(
          controller: _addressController,
          maxLine: 1,
          validator: (password) {
            if (password == null || password.isEmpty) {
              return '';
            }
            return null;
          },
          hintText: 'Địa chỉ',
          iconLeft: IconEnums.lock,
          // onChangeValue: _loginStore.onChangePassword,
        ),
      ],
    );
  }

  Widget _submitButton(String buttonText, String? kNamePage) {
    return InkWell(
      onTap: () async {
        if (kNamePage != null) {
          Get.toNamed(kNamePage);
        } else {
          if (await controller.register(AdminModel(
              _emailController.text,
              _passwordController.text,
              '',
              _nameController.text,
              _phoneController.text,
              _addressController.text,
              '',
              'playerId'))) {
            Get.toNamed(kLoginPage);
          } else {

          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
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
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                    )),
                const SizedBox(
                  height: 16.0,
                ),
                _emailPasswordWidget(),
                const SizedBox(
                  height: 24.0,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                _submitButton('Đăng ký', null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
