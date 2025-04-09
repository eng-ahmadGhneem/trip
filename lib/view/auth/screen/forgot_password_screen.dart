import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/assets.dart';
import '../../../core/constant/routes.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_form_filed.dart';
import '../../../core/constant/color.dart';
import '../controller/auth_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child:const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  const Spacer(),
                  CustomText(
                    text: 'Send Email',
                    fontSize: 25,
                    color: AppColor.lightGrey,
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(height: 40),
              Image.asset(Assets.icon_lock),
              const SizedBox(height: 20),
              CustomText(
                text: 'Email',
                fontSize: 25,
                color: AppColor.lightGrey,
              ),
              const CustomText(
                text: 'Login to your account',
                fontSize: 16,
                color: AppColor.appColor,
              ),
              const SizedBox(height: 20),
              CustomTextForm(
                mycontroller: _emailController,
                hintText: 'البريد الإلكتروني',
                iconPrefixData: Icons.email,
                valid: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                text: 'Send Email',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _authController.sendPasswordResetEmail(
                      _emailController.text.trim(),
                    );
                  }
                },
                buttonColor: AppColor.appColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
