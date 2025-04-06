import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/assets.dart';
import '../../../core/constant/color.dart';
import '../../../widget/custom_buttom_navbar_widget.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../../widget/custom_text.dart';

class SuccessRegistrationScreen extends StatelessWidget {
  const SuccessRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [

          Image.asset(Assets.registerSuccessful),
            SizedBox(height: 20),
            CustomText(
              text: 'Verified',
              fontSize: 24,
              color: AppColor.lightGrey,
            ),
            SizedBox(height: 20,),
            CustomText(
              text: 'your account has been\n verified successfully',
              fontSize: 15,
              color: AppColor.lightGrey,
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: CustomElevatedButton(

                text: 'Done',
                buttonColor: AppColor.appColor,
                onPressed: () {
                  Get.offAll(() =>  CustomBottomNavigationWidget());
                  }),
            )

          ],
        ),
      ),
    );
  }
}
