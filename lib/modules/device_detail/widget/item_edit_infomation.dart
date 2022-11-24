import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon/utils/global_controller.dart';

class ItemEditInformation extends StatelessWidget {
  final Widget? icon;
  final String? labelText;
  final Function(String)? onChangeValue;
  final bool? isEnable;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  ItemEditInformation({Key? key, this.icon, this.labelText, this.onChangeValue, this.isEnable, this.keyboardType, this.textCapitalization, this.hintText, this.padding, this.controller, this.validator}) : super(key: key);

  final GlobalController globalController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          icon == null
              ? const SizedBox()
              : Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: icon!,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
              child: TextFormField(
                  style: TextStyle(fontSize: 16.0, color: globalController.colorText.value,),
                  controller: controller,
                  enabled: isEnable,
                  onTap: () {
                    //_textEditingController.clear();
                  },
                  validator: validator,
                  textCapitalization:
                  textCapitalization ?? TextCapitalization.none,
                  keyboardType: keyboardType,
                  autocorrect: false,
                  autofocus: false,
                  onChanged: onChangeValue,
                  initialValue: labelText,
                  decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(fontSize: 16.0, color: globalController.colorText.value,),
                      labelText: hintText,
                      errorStyle: TextStyle(fontSize: 16.0, color: globalController.colorText.value,),
                      labelStyle: TextStyle(fontSize: 16.0, color: globalController.colorText.value,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)))),
            ),
          )
        ],
      ),
    );
  }
}
