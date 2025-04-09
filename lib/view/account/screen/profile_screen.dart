import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/routes.dart';
import '../../auth/screen/login_screen.dart';
import '../controller/account_controller.dart';
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
              const ProfileMenuItem(icon: Icons.local_offer, title: "EARN COINS"),
              const ProfileMenuItem(icon: Icons.card_giftcard, title: "GIFT ITEMS"),
              InkWell(onTap:(){
                Get.toNamed(AppRoutes.settingsScreen);
              },child: const ProfileMenuItem(icon: Icons.settings, title: "SETTINGS")),
              const ProfileMenuItem(icon: Icons.warning, title: "Term Of Use"),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                Get.offAll(const LoginScreen());},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text("Log OUT", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
