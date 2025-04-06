import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/color.dart';
import 'package:trip/widget/custom_elevated_button.dart';
import 'package:trip/widget/custom_text_form_filed.dart';
import '../../../core/constant/assets.dart';
import '../../../core/constant/routes.dart';
import '../../../widget/custom_text.dart';
import '../controller/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColor.dark,
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
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
                        text: 'Sign up',
                        fontSize: 25,
                        color: AppColor.lightGrey,
                      ),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: controller.pickProfileImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.profileImage != null
                          ? FileImage(controller.profileImage!)
                          : null,
                      child: controller.profileImage == null
                          ? const Icon(Icons.camera_alt, size: 40, color: Colors.white)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    mycontroller: controller.usernameController,
                    hintText: "Enter your name",
                    iconPrefixData: Icons.person,
                    valid: (val) => val == null || val.isEmpty ? 'Enter your name' : null,
                  ),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    mycontroller: controller.emailController,
                    hintText: "Enter your email",
                    iconPrefixData: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    valid: (val) =>
                    !GetUtils.isEmail(val!) ? 'Enter a valid email' : null,
                  ),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    mycontroller: controller.birthdateController,
                    hintText: "Date of Birth",
                    iconPrefixData: Icons.calendar_today,
                    readOnly: true,
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        controller.birthdateController.text =
                        "${date.year}-${date.month}-${date.day}";
                      }
                    },
                    valid: (val) =>
                    val == null || val.isEmpty ? 'Enter birthdate' : null,
                  ),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    mycontroller: controller.passwordController,
                    hintText: "Password",
                    obscuretext: true,
                    iconPrefixData: Icons.lock,
                    valid: (val) => val != null && val.length >= 6
                        ? null
                        : 'Password must be at least 6 characters',
                  ),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    mycontroller: controller.confirmPasswordController,
                    hintText: "Confirm Password",
                    obscuretext: true,
                    iconPrefixData: Icons.lock,
                    valid: (val) =>
                    val == controller.passwordController.text
                        ? null
                        : 'Passwords do not match',
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Text("Gender: ", style: TextStyle(color: Colors.white)),
                      Expanded(
                        child: Obx(() => DropdownButton<String>(
                          value: controller.gender.value,
                          isExpanded: true,
                          dropdownColor: Colors.black,
                          style: const TextStyle(color: Colors.white),
                          items: const [
                            DropdownMenuItem(
                                value: 'Male', child: Text("Male")),
                            DropdownMenuItem(
                                value: 'Female', child: Text("Female")),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              controller.gender.value = value;
                            }
                          },
                        )),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    text: 'Register',
                    buttonColor: AppColor.appColor,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.registerWithEmail(
                          controller.emailController.text.trim(),
                          controller.passwordController.text.trim(),
                          controller.usernameController.text.trim(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
