import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trip/core/constant/color.dart';

class LeaveTraceController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  Rx<File?> selectedImage = Rx<File?>(null);
  RxBool showMessageField = false.obs;
  RxString message = ''.obs;
  RxString privacy = 'Public'.obs;

  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void toggleMessageField() {
    showMessageField.toggle();
  }

  void updateMessage(String value) {
    message.value = value;
  }

  void placeTrace() {
    Get.snackbar("تم", "تم إرسال التتبع بنجاح!");
  }
  void choosePrivacy() {
    Get.defaultDialog(
      title: "Select Privacy",
      titleStyle:  TextStyle(fontWeight: FontWeight.bold,color: AppColor.white),
      backgroundColor: Colors.grey[900],
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        children: [
          ListTile(
            title: const Text("Public", style: TextStyle(color: Colors.white)),
            leading: const Icon(Icons.public, color: Colors.blue),
            onTap: () {
              privacy.value = "Public";
              Get.back();
            },
          ),
          ListTile(
            title: const Text("Private", style: TextStyle(color: Colors.white)),
            leading: const Icon(Icons.lock, color: Colors.blue),
            onTap: () {
              privacy.value = "Private";
              Get.back();
            },
          ),
        ],
      ),
    );
  }

}
