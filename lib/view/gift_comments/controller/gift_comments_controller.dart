import 'package:get/get.dart';

class GiftsCommentsController extends GetxController {
  final messages = <Message>[
    Message(name: "Ahmad Mohammed", text: "I want to thank you all for the beautiful gifts I received.", image: "assets/images/user1.png"),
    Message(name: "Sara Falsol", text: "You made me so happy.", image: "assets/images/user2.png"),
    Message(name: "Mohammed Ahmed", text: "I want to share with you all my joy with this special gift.", image: "assets/images/user3.png"),
  ].obs;
}

class Message {
  final String name;
  final String text;
  final String image;

  Message({required this.name, required this.text, required this.image});
}
