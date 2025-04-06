import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trip/view/auth/screen/login_screen.dart';
import '../../../widget/custom_buttom_navbar_widget.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateUser();
  }

  void _navigateUser() async {
    await Future.delayed(const Duration(seconds: 3));
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.offAll(() => const CustomBottomNavigationWidget());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }
}
