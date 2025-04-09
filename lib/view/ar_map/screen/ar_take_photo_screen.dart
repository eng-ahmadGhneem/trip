import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../widget/custom_text.dart';
import '../controller/ar_map_controller.dart';

class ArTakePhotoScreen extends StatelessWidget {
  const ArTakePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArMapController());

    return Scaffold(
      backgroundColor: AppColor.dark,
      body: Obx(() {
        if (!controller.isCameraInitialized.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios, color: AppColor.white),
                  ),
                  const Spacer(),
                  CustomText(
                    text: 'Take AR',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColor.lightGrey,
                  ),
                  const Spacer(),
                  IconButton(
                    icon:  Icon(Icons.info_outline,color: AppColor.white,),
                    onPressed: () {
                      Get.snackbar("معلومات", "اضغط على زر البصمة لالتقاط صورة اللواقع الافتراضي.");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CameraPreview(controller.cameraController),
              ),
            ),


            SizedBox(height: 40,),

            Center(
              child: GestureDetector(
                onTap: () => controller.takePicture(),
                child: const Icon(
                  Icons.fingerprint,
                  size: 80,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
