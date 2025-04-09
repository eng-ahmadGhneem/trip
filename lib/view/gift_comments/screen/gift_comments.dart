import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios, color:AppColor.white),
                ),
                const Spacer(),
                CustomText(
                  text: 'Gift Comments',
                  fontSize: 20,
                  color: AppColor.lightGrey,
                ),
                const Spacer(),
                Icon(Icons.more_vert, color: AppColor.white),
              ],
            ),
            const SizedBox(height: 40,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2D2D2D),
                    Color(0xFF1E1E1E),
                  ],
                ),
                border: Border.all(color:AppColor.white, width: 0.5), 
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                     Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/comments_background.png"),
                        ),
                        const SizedBox(width: 8),
                        CustomText(
                          text:
                          "Gifts Page - Saudi Arabia",
                         color:AppColor.white,
                          fontSize: 15,
                        ),
                        const Spacer(),
                        Icon(Icons.close, color:AppColor.white),
                        Icon(Icons.more_horiz, color:AppColor.white),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      text: "Providing special gift offers such as the Great Winter Sale Or buy now and enjoy free shipping, which can ... See More ",
                     color:AppColor.white,
                      fontSize: 12,
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset("assets/images/comments_background.png"),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type a Message...",
                              hintStyle: TextStyle(color: AppColor.white, fontSize: 12),
                              filled: true,
                              fillColor: AppColor.appColor,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              suffixIcon: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  color: AppColor.appColor,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.mic, color: Colors.white, size: 20),
                                    SizedBox(width: 6),
                                    Icon(Icons.image, color: Colors.white, size: 20),
                                    SizedBox(width: 6),
                                    Icon(Icons.add, color: Colors.white, size: 20),
                                    SizedBox(width: 6),
                                    Icon(Icons.send, color: Colors.white, size: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return CommentBubble(
                      name: message.name,
                      text: message.text,
                      imagePath: message.image,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
