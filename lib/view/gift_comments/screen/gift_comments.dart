import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/core/constant/assets.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/const_data.dart';
import '../../../widget/custom_text.dart';
import '../controller/gift_comments_controller.dart';
import '../widget/comment_bubble.dart';

class GiftCommentsScreen extends StatelessWidget {
  const GiftCommentsScreen({super.key});

 @override
Widget build(BuildContext context) {
  final controller = Get.put(GiftsCommentsController());

  return Scaffold(
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
      actions: [
        GestureDetector(
          onTap: () async {
            controller.isClickedToggle();
            if (controller.isclicked.value) {
              await controller.likesForFingerPrint(
                ConstData.fingerprintDocId,
                controller.auth.currentUser!.uid,
              );
            } else {
              await controller.unlikesForFingerPrint(
                ConstData.fingerprintDocId,
                controller.auth.currentUser!.uid,
              );
            }
            await controller.getAllCommectsandLikes();
          },
          child: Obx(
            () => Row(
              children: [
                Text(
                  controller.allLikesForFingerPrint.isEmpty
                      ? '0'
                      : '${controller.allLikesForFingerPrint.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  controller.isclicked.value
                      ? Assets.likeIcon
                      : Assets.loveitIcon,
                  width: 28,
                  height: 28,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 15),
      ],
    ),
    body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF2D2D2D), Color(0xFF1E1E1E)],
                    ),
                    border: Border.all(color: AppColor.white, width: 0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() => CustomText(
                              text: controller.titleFinferPrint.value,
                              color: AppColor.white,
                              fontSize: 16,
                            )),
                        Obx(() => controller.imageUrl.value.isNotEmpty
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    controller.imageUrl.value,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                GetBuilder(
                  init: GiftsCommentsController(),
                  builder: (controller) => ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.allCommectsForFingerPrint.length,
                    itemBuilder: (context, index) {
                      final message = controller.allCommectsForFingerPrint;
                      return CommentBubble(
                        deleteComment: () async {
                          await controller
                              .deleteComment(message[index]['commentId']);
                        },
                        name: message[index]['username'],
                        text: message[index]['text'],
                        imagePath: controller.profileImages ?? '',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // 👇 Bottom TextField
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.message,
                  decoration: InputDecoration(
                    hintText: "Type a Message...".tr,
                    hintStyle:  TextStyle(
                        color: AppColor.white, fontSize: 12),
                    filled: true,
                    fillColor: AppColor.appColor,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: const BoxDecoration(
                        color: AppColor.appColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () async {
                              await controller.addCommentToFingerPoint(
                                ConstData.fingerprintDocId,
                                controller.message.text,
                              );
                              await controller.getAllCommectsandLikes();
                              controller.message.clear(); // Clear after send
                            },
                            child: const Icon(Icons.send,
                                color: Colors.white, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}
//  Row(
                      //     children: [
                      //       Expanded(
                      //         child: TextField(
                      //           controller: controller.message,
                      //           decoration: InputDecoration(
                      //             hintText: "Type a Message...".tr,
                      //             hintStyle: TextStyle(
                      //                 color: AppColor.white, fontSize: 12),
                      //             filled: true,
                      //             fillColor: AppColor.appColor,
                      //             border: const OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(10)),
                      //               borderSide: BorderSide.none,
                      //             ),
                      //             contentPadding: const EdgeInsets.symmetric(
                      //                 horizontal: 20),
                      //             suffixIcon: Container(
                      //               padding: const EdgeInsets.symmetric(
                      //                   horizontal: 6),
                      //               decoration: const BoxDecoration(
                      //                 color: AppColor.appColor,
                      //                 borderRadius: BorderRadius.only(
                      //                   topRight: Radius.circular(10),
                      //                   bottomRight: Radius.circular(10),
                      //                 ),
                      //               ),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.min,
                      //                 children: [
                                
                      //                   InkWell(
                      //                       onTap: () async {
                                        
                      //                         await controller
                      //                             .addCommentToFingerPoint(
                      //                                 ConstData
                      //                                     .fingerprintDocId,
                      //                                 controller.message.text);
                      //                         await controller
                      //                             .getAllCommectsandLikes();
                      //                       },
                      //                       child: const Icon(Icons.send,
                      //                           color: Colors.white, size: 20)),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   )
                      // ,
