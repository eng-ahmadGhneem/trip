import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/routes.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey,
              Colors.black,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const AppHeader(title: 'Profile Screen',optionsSettings:true),
              const SizedBox(height: 20),
              const Text(
                "Setting DATA",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              const ProfileMenuItem(icon: Icons.leaderboard, title: "LEADERBOARD"),
              const ProfileMenuItem(icon: Icons.local_offer, title: "TRACE"),
              const ProfileMenuItem(icon: Icons.card_giftcard, title: "GIFT ITEMS"),
              InkWell(onTap:(){
                Get.toNamed(AppRoutes.settingsScreen);
              },child: const ProfileMenuItem(icon: Icons.settings, title: "SETTINGS")),
              const ProfileMenuItem(icon: Icons.warning, title: "Term Of Use"),
              const Spacer(),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
