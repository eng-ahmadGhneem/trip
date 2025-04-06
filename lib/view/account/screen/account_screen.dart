import 'package:trip/view/auth/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/color.dart';
import 'package:trip/view/auth/controller/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widget/DarkMode.dart';
import '../../../widget/custom_text.dart';




class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appColor,
        elevation: 3,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        title: CustomText(
          text: 'الملف الشخصي',
          fontWeight: FontWeight.w900,
          color: AppColor.lightGrey,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 20),
            _buildProfileHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  SettingsGroup(title: 'الإعدادات', children: <Widget>[
                    const SizedBox(height: 8),
                    const DarkMode(),
                    buildSpeed(),
                    buildGoPremium(),
                    buildLogout(),
                    buildDeleteAccount(),
                  ]),
                  const SizedBox(height: 12),
                  SettingsGroup(title: 'تقيماتك', children: <Widget>[
                    const SizedBox(height: 8),
                    buildSendFeedback(context),
                    buildPrivacy(context),
                    buildRateApp(context),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.appColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/trip.png'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Obx(() => CustomText(
                //   text: authController.username.value,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 18,
                //   color: Colors.white,
                // )),
                // const SizedBox(height: 4),
                // Obx(() => CustomText(
                //   text: authController.email.value,
                //   fontSize: 14,
                //   color: Colors.white70,
                // )),
                // const SizedBox(height: 8),
                // Obx(() => CustomText(
                //   text: "تبقى لك ${authController.remainingDays.value} يومًا",
                //   fontSize: 14,
                //   color: Colors.yellow,
                //
                // )
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}

Widget buildLogout() => SimpleSettingsTile(
    title: 'تسجيل الخروج',
    leading: const Icon(Icons.logout, color: Colors.blueAccent),
    onTap: () async {
      FirebaseAuth.instance.signOut();
      Get.offAll(LoginScreen());
    });

Widget buildSpeed() => SimpleSettingsTile(
    title: 'كورساتي',
    leading: const Icon(Icons.menu_book, color: Colors.lightGreenAccent),
    onTap: () async {
    });

Widget buildGoPremium() => SimpleSettingsTile(
    title: 'الخطة المدفوعة',
    leading: const Icon(Icons.workspace_premium, color: Colors.green),
    onTap: () async {});

Widget buildDeleteAccount() => SimpleSettingsTile(
    title: 'حذف حسابي',
    leading: const Icon(Icons.delete, color: Colors.pink),
    onTap: () async {
      Get.defaultDialog(
        title: "تأكيد الحذف",
        middleText: "هل أنت متأكد أنك تريد حذف حسابك؟ لا يمكن التراجع عن هذا الإجراء.",
        textConfirm: "نعم، احذف",
        textCancel: "إلغاء",
        confirmTextColor: Colors.white,
        onConfirm: () {
          // تحميل AuthController إذا لم يكن موجودًا
          Get.lazyPut(() => AuthController());

          // الحصول على الـ Controller بعد التأكد من وجوده
          AuthController authController = Get.find<AuthController>();
          authController.deleteAccount();
        },
      );
    });


Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
    title: 'ارسال ملاحظاتك',
    leading: const Icon(Icons.thumb_up, color: Colors.purple),
    onTap: () {
    });

Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
    title: 'سياسة الاستخدام',
    leading: const Icon(Icons.lock, color: Colors.blue),
    onTap: () {
    });

Widget buildRateApp(BuildContext context) => SimpleSettingsTile(
    title: 'التقييم',
    leading: const Icon(Icons.star_rate, color: Colors.orange),
    onTap: () {
    });

