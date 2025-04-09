import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/view/account/widgets/profile_header.dart';

import '../controller/account_controller.dart';
import '../widgets/profile_row.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.put(AccountController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container( decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey,
            Colors.black,
          ],
        ),
      ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              const AppHeader(title: "Account Settings",optionsSettings:false),
              const SizedBox(height: 20),
              const Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 60, color: Colors.blue),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(Icons.camera_alt, size: 15, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    accountController.userName.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.edit, color: Colors.white, size: 16),
                ],
              )),

              const SizedBox(height: 10),
              const Text(
                'PROFILE DATA',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white10),
                ),
                child: Obx(() => Column(
                  children: [
                    ProfileRow(
                      icon: Icons.email,
                      title: "Email address",
                      value: accountController.email.value,
                    ),
                    const Divider(color: Colors.white24),
                    ProfileRow(
                      icon: Icons.person,
                      title: "Name",
                      value: accountController.userName.value,
                      editable: true,
                    ),
                    const Divider(color: Colors.white24),
                    ProfileRow(
                      icon: Icons.phone,
                      title: "Phone Number",
                      value: accountController.phone.value,
                    ),
                    const Divider(color: Colors.white24),
                    ProfileRow(
                      icon: Icons.flag,
                      title: "Country",
                      value: accountController.country.value,
                    ),
                    const Divider(color: Colors.white24),
                    ProfileRow(
                      icon: Icons.badge,
                      title: "Id Number",
                      value: accountController.idNumber.value,
                    ),
                  ],
                ))

              ),
            ],
          ),
        ),
      ),
    );
  }
}

