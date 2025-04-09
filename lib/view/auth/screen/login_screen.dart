import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/routes.dart';
import '../../../core/constant/assets.dart';
import '../../../core/constant/color.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_form_filed.dart';
import '../controller/auth_controller.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.dark,
        body: SingleChildScrollView(
          child: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: controller.formKeyLog,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: CustomText(
                          text: 'Sign In',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColor.white,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: CustomText(
                          text: 'Welcome to The World\nGifts Shop Your Specials',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColor.white,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          Assets.logo,
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Email field
                      CustomTextForm(
                        mycontroller: controller.emailController,
                        iconPrefixData: Icons.email,
                        hintText: "Email Address",
                        keyboardType: TextInputType.emailAddress,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Password field
                      CustomTextForm(
                        mycontroller: controller.passwordController,
                        iconPrefixData: Icons.lock,
                        hintText: "Password",
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Login button

                      CustomElevatedButton(
                        text: 'Log In',
                        buttonColor: AppColor.appColor,
                        onPressed: () {
                          if (controller.formKeyLog.currentState!.validate()) {
                            controller.loginWithEmail(
                              controller.emailController.text.trim(),
                              controller.passwordController.text.trim(),
                            );
                          }
                          }

                      ),

                      const SizedBox(height: 20),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         GestureDetector(
                           onTap: () async {
                             await controller.signInWithGoogle();
                           },
                           child: Container(
                             width: 60,
                             height: 60,
                             decoration: const BoxDecoration(
                               color: Colors.blue,
                               shape: BoxShape.circle,
                             ),
                             child: const Icon(
                               Icons.g_mobiledata,
                               color: Colors.white,
                               size: 40,
                             ),
                           ),
                         ),
                         const SizedBox(width: 20),
                         GestureDetector(
                           onTap: () async {
                             final credential = await SignInWithApple.getAppleIDCredential(
                               scopes: [
                                 AppleIDAuthorizationScopes.email,
                                 AppleIDAuthorizationScopes.fullName,
                               ],
                             );
                             print(credential);
                           },
                           child: Icon(
                             Icons.apple,  color: AppColor.white,
                             size: 40,
                           ),
                         ),
                       ],
                     ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Don\'t have an account? ',
                            fontSize: 14,
                            color: AppColor.lightGrey,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.registerScreen);
                            },
                            child: CustomText(
                              text: 'Signup here!',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: AppColor.lightGrey,
                            ),
                          ),
                        ],
                      ),

                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.forgotPasswordScreen);
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
