import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum Entitlement { free, Upgrade }

class HomeController extends GetxController with WidgetsBindingObserver {
  Rx<int> x = 0.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);

    print('init home controller');
    // init();
    super.onInit();
  }

  Future getSavedData(
    String key,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("amount");
  }

  // Future init() async {
  //   Purchases.addCustomerInfoUpdateListener((purchaserInfo) async {
  //     updatePurchasesStatus();
  //   });
  // }

  Future<void> saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  String newAmount = '';

  // Future<void> updatePurchasesStatus() async {
  //   print('ConstData.amount updatefirst=${ConstData.amount}');
  //   try {
  //     final purchaserInfo = await Purchases.getCustomerInfo();
  //     final activeSubscriptionList = purchaserInfo.activeSubscriptions;
  //
  //     if (activeSubscriptionList.isNotEmpty) {
  //       if (ConstData.amount == "") {
  //         print('before for loop');
  //         for (final promotedProd in activeSubscriptionList) {
  //           if (promotedProd.contains('week')) {
  //             newAmount = '8.99';
  //             // ConstData.amount = '8.99';
  //           } else if (promotedProd.contains('month')) {
  //             newAmount = '13.99';
  //             // ConstData.amount = '13.99';
  //           } else if (promotedProd.contains('year')) {
  //             newAmount = '74.99';
  //             // ConstData.amount = '74.99';
  //           }
  //           print("promotedProd: $promotedProd");
  //           print('ConstData.amount updatelast=${ConstData.amount}');
  //           await saveData('amount', newAmount);
  //           ConstData.amount = newAmount;
  //         }
  //         print("ConstData.amount=${ConstData.amount}");
  //       } else {
  //         print('else != empty');
  //         Get.dialog(const AlertDialog(
  //           title: CustomText(
  //             text: 'You\'r already subscriber,',
  //           ),
  //         ));
  //         Get.back();
  //       }
  //     } else {
  //       print("User does not have an active subscription.");
  //     }
  //     print('ConstData.amount updatelast=${ConstData.amount}');
  //
  //     update();
  //   } catch (e) {
  //     print("Error updating purchases status: $e");
  //   }
  // }
  // Future<void> purchaseCourse(String courseId) async {
  //   try {
  //     // Perform the purchase
  //     final purchaserInfo = await Purchases.purchaseProduct(courseId);
  //     if (purchaserInfo.entitlements.all['premium'] != null) {
  //       // If the purchase is successful, update the UI
  //       updatePurchasesStatus();
  //     }
  //   } catch (e) {
  //     print("Error purchasing course: $e");
  //   }
  // }
  // Future<void> showPaymentDialog() async {
  //   showDialog(
  //     context: Get.context!,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const CustomText(text: 'Payment Required'),
  //         content: const CustomText(
  //           text: 'To download this course, please complete the payment process.',
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: const CustomText(text: 'Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // Navigate to the payment screen
  //               Get.back();
  //             },
  //             child: const CustomText(text: 'Proceed to Payment'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  bool isAppInForeground = true;

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  final RxBool isLoading = false.obs;
}
