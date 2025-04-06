import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/assets.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_elevated_button.dart';
import '../controller/auth_controller.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.dark,
        body: GetBuilder<AuthController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: Image.asset(
                        Assets.arrowBack,
                        color: AppColor.white,
                        fit: BoxFit.fill,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const Spacer(),
                    CustomText(
                      text: 'Verification Code',
                      fontSize: 25,
                      color: AppColor.lightGrey,
                    ),
                    const Spacer()
                  ],
                ),
                const SizedBox(height: 30),
                Center(child: Image.asset(Assets.verEmail)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Center(
                    child: CustomText(
                      text:
                          'Please check your email for the verification link and click on it.',
                      fontSize: 18,
                      color: AppColor.lightGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                CustomElevatedButton(
                  text: 'Confirmed My Email',
                  buttonColor: AppColor.appColor,
                  onPressed: controller.checkVerification,
                ),
              ],
            ),
          );
        }));
  }
}
