import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:trip/core/constant/routes.dart';
import '../../../core/constant/color.dart';
import '../../../widget/custom_button_navbar_widget.dart';
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
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.buttonNavBarScreen);
                    },
                    child: Icon(Icons.arrow_back_ios, color: AppColor.white),
                  ),
                  const Spacer(),
                  CustomText(
                    text: 'Add Trace',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColor.lightGrey,
                  ),
                  const Spacer(),
                  IconButton(
                    icon:  Icon(Icons.arrow_circle_down_sharp,color: AppColor.white,),
                    onPressed: () {

                      Get.to(() => const CustomBottomNavigationWidget(),
                        transition: Transition.upToDown,
                        duration: const Duration(milliseconds: 500),
                      );

                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CameraPreview(controller.cameraController),
              ),
            ),


            const SizedBox(height: 40,),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => controller.takePicture(),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.takePicture(),
                    child:  const Icon(
                      BoxIcons.bx_camera,
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                  ),

                  GestureDetector(
                    onTap: () => controller.takePicture(),
                    child:  const Icon(
                      BoxIcons.bx_gift,
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
