import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/color.dart';
import 'package:trip/widget/custom_text.dart';
import '../controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());

    return Scaffold(
      backgroundColor: AppColor.dark,
      body: SafeArea(
        child: Obx(() {
          if (controller.notifications.isEmpty) {
            return Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios, color:AppColor.white),
                    ),const Spacer(),
                    CustomText(
                      text:
                      "Notifications",
                      color: AppColor.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,

                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {

                        controller.sendNotification(
                          senderId: "123",
                          senderName: "Ahmed",
                          senderImage: "https://link.to/profile.jpg",
                          receiverId: "456",
                          action: "تم اضافة بصمة في منطقة الرياض",
                        );
                      },
                    )

                  ],
                ),
                const Spacer(),
                const Center(
                  child: Text(
                    "No notifications yet.",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                const Spacer()
              ],
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios, color:AppColor.white),
                    ),const Spacer(),
                     CustomText(
                      text:
                      "Notifications",
                        color: AppColor.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,

                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {

                        controller.sendNotification(
                          senderId: "123",
                          senderName: "Ahmed",
                          senderImage: "https://link.to/profile.jpg",
                          receiverId: "456",
                          action: "liked your post",
                        );
                      },
                    )

                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.notifications.length,
                    separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                    itemBuilder: (context, index) {
                      final notification = controller.notifications[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(notification.senderImage),
                          radius: 25,
                        ),
                        title: Text(
                          notification.senderName,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "${notification.action} • ${controller.formatTime(notification.timestamp)}",
                          style: const TextStyle(color: Colors.white54, fontSize: 12),
                        ),

                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert, color: Colors.white),
                          onPressed: () => controller.showOptions(notification),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: (){},
                    child:  CustomText(text: "View previous notifications",fontSize: 16,color: AppColor.white,),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
