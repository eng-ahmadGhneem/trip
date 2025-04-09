import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/widget/loading.dart';

import '../core/constant/color.dart';
import '../view/auth/controller/auth_controller.dart';
import 'custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonColor ,
    // this.textColor = Colors.white,
    required this.text,
    required this.onPressed,
    // this.padding = 10,
    //this.borderColor = AppColor.appColor,
  });

  final Color buttonColor;
  //final Color textColor;
  final String text;

  final void Function() onPressed;

  // final double padding;
  //final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ElevatedButton(

        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          elevation: 0,
          foregroundColor: AppColor.dark,
          // padding: EdgeInsets.all(padding),
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            // side: BorderSide(color: borderColor),
          ),

        ),
        child:
    GetBuilder<AuthController>(
    init: AuthController(),
    builder: (controller) {

      return LoadingManager(
          isLoading: controller.isLoading,
          color:AppColor.white,
            child :CustomText(
              text: text,
              alignment: Alignment.center,
              fontSize: 16,
              textAlign: TextAlign.center,
              // fontWeight: FontWeight.w700,
              color: Colors.white,
              textOverflow: TextOverflow.visible,
            ),
          );
    })
        ),

    );
  }
}
