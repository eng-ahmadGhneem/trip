import 'package:trip/view/auth/screen/forgot_password_screen.dart';
import 'package:trip/view/auth/screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:trip/view/account/screen/account_screen.dart';
import 'package:trip/view/auth/screen/sign_up_screen.dart';
import 'package:trip/view/splash/screen/splash_screen.dart';
import 'core/constant/routes.dart';
List<GetPage<dynamic>>? routes = [
  GetPage(
    name:AppRoutes.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name:AppRoutes.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name:AppRoutes.registerScreen,
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name:AppRoutes.forgotPasswordScreen,
    page: () =>  ForgotPasswordScreen(),
  ),



  GetPage(
    name: '/accountScreen',
    page: () => ProfileScreen(),
  ),
  GetPage(
    name: '/privacyPolicyScreen',
    page: () => const LoginScreen(),
  ),


];
