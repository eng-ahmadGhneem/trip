import 'package:get/get.dart';
import 'package:trip/view/auth/controller/auth_controller.dart';
import '../core/class/crud.dart';
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(AuthController());
  }
}
