import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[
    NotificationModel(
      username: "Ahmed Ali",
      imageUrl: "https://i.pravatar.cc/150?img=3",
      time: "2 mins ago",
    ),
    NotificationModel(
      username: "Sara Mohammed",
      imageUrl: "https://i.pravatar.cc/150?img=5",
      time: "10 mins ago",
    ),
    NotificationModel(
      username: "Omar Al-Farouq",
      imageUrl: "https://i.pravatar.cc/150?img=7",
      time: "30 mins ago",
    ),
  ].obs;

  void showOptions(NotificationModel notification) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("Delete Notification"),
              onTap: () {
                notifications.remove(notification);
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text("Cancel"),
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationModel {
  final String username;
  final String imageUrl;
  final String time;

  NotificationModel({
    required this.username,
    required this.imageUrl,
    required this.time,
  });
}
