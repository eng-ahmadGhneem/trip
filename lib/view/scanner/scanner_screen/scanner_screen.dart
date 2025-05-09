import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/assets.dart';
import 'package:trip/core/constant/color.dart';
import 'package:trip/widget/custom_text.dart';
import '../../gift_comments/screen/gift_comments.dart';
import '../scanner_controller/scanner_controller.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.dark,
        appBar: AppBar(
          backgroundColor: AppColor.dark,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
        ),
        body: GetBuilder(
          init: ScannerController(),
          builder: (controller) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: controller.isLoading 
                    ? const Center(
                        child: Center(
                        child: CircularProgressIndicator(
                          color: AppColor.appColor,
                        ),
                      ))
                    : controller.nearby.isEmpty
                        ? const Center(
                            child: CustomText(
                              text: 'No Thing To Show',
                              fontSize: 18,
                              color: AppColor.appColor,
                            ),
                          )
                        : ListView.separated(
                            itemCount: controller.nearby.length,
                            separatorBuilder: (context, index) => const Divider(
                                  color: Colors.white,
                                  height: 10,
                                  thickness: .2,
                                ),
                            itemBuilder: (context, index) {
                              final nearbyFingerPrint =
                                  controller.nearby[index];
                              return Container(
                                height: 70,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: AppColor.appColor, width: 1)),
                                child: GestureDetector(
                                  onTap: () =>
                                      Get.to(() => const GiftCommentsScreen()),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        foregroundColor: AppColor.lightGrey,
                                        foregroundImage:
                                            const AssetImage(Assets.logo),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomText(
                                        text: nearbyFingerPrint['username'],
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
