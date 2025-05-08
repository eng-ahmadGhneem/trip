import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:trip/core/constant/const_data.dart';

import '../../notification/controller/notification_controller.dart';

class GiftsCommentsController extends GetxController {
  RxBool isloading = false.obs;
  RxBool isclicked = false.obs;
  String fingerPrintUserId = '';
  var imageUrl = ''.obs;
  RxString titleFinferPrint = ''.obs;
  CollectionReference fingerPrints =
      FirebaseFirestore.instance.collection('fingerprints');
  CollectionReference allUsers = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController message = TextEditingController();
  String profileImages = ''; //users
  final NotificationController notificationController =
      Get.put(NotificationController());

  var allCommectsForFingerPrint = [];
  List allLikesForFingerPrint = [];
  List allusercomment = [];

  void isClickedToggle() {
    isclicked.value = !isclicked.value;
  }

  Future getFinferPrint(String fingerPrintId) async {
    final fingerPrint = await fingerPrints.doc(fingerPrintId).get();
    if (fingerPrint.exists) {
      imageUrl.value = fingerPrint['image'];

      titleFinferPrint.value = fingerPrint['title'];
      fingerPrintUserId = fingerPrint['userId'];
    }

    print('....................Image....${imageUrl})}');
  }

  Future<void> addCommentToFingerPoint(
      String fingerPointId, String commentText) async {
    try {
      final userId = auth.currentUser!.uid;
      final nameuser = auth.currentUser!.displayName;
      final commentRef =
          await fingerPrints.doc(fingerPointId).collection('comments').doc();

      final CommentId = commentRef.id;

      await commentRef.set({
        'commentId': CommentId,
        'userId': userId,
        'username': nameuser ?? '',
        'text': commentText,
        'timestamp': FieldValue.serverTimestamp(),
        'replay': [], // Add a timestamp for the comment
      });
      message.clear();
      await sendNotifiction(
          userId, nameuser ?? '', ' $nameuser Comment on Your Post');
    } catch (e) {
      print('Error adding comment: $e');
    }
  }

  Future<void> likesForFingerPrint(String fingerPrintId, String userId) async {
    final postRef = fingerPrints.doc(fingerPrintId);
    final nameuser = auth.currentUser!.displayName;
    try {
      await postRef.update({
        'likes': FieldValue.arrayUnion([userId]),
      });

      await sendNotifiction(
          userId, nameuser ?? '', ' $nameuser Liked Your Post');
    } catch (xerroe) {
      print('fingerPrint liked error!');
    }
  }

  Future<void> unlikesForFingerPrint(
      String fingerPrintId, String userId) async {
    final fingerPrintRef = fingerPrints.doc(fingerPrintId);

    await fingerPrintRef.update({
      'likes': FieldValue.arrayRemove([userId])
    });
  }

  Future getAllCommectsandLikes() async {
    isloading.value = true;

    final docRef = await fingerPrints.doc(ConstData.fingerprintDocId);

    await docRef.collection('comments').snapshots().listen((event) {
      final doc = event.docs;
      if (doc.isNotEmpty) {
        allCommectsForFingerPrint.assignAll(doc);
        update();
      } else {
        Text('No Comment Now');
        update();
      }
    });

    await getUserComment();
  }

  Future <void> sendNotifiction(String userId, String nameuser, String action) async {
    await notificationController.sendNotification(
        senderId: userId,
        senderName: nameuser ?? '',
        senderImage: profileImages ?? '',
        receiverId: fingerPrintUserId,
        action: action);
  }

  Future getUserComment() async {
    final commentSnapshots = await fingerPrints
        .doc(ConstData.fingerprintDocId)
        .collection('comments')
        .get();
    for (var commentDoc in commentSnapshots.docs) {
      String userId = commentDoc['userId'];
      String commentId = commentDoc['commentId'];
      String commentText = commentDoc['text'];

      final userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        profileImages = userSnapshot.data()?['profileImage'] ?? '';
        //  String username = userSnapshot.data()?['username'] ?? '';

        fingerPrints
            .doc(ConstData.fingerprintDocId)
            .collection('comments')
            .doc(commentId)
            .update({
          'profileImage': profileImages,
        });
        update();
      }
    }
  }

  Future deleteComment(String commentId) async {
    await fingerPrints
        .doc(ConstData.fingerprintDocId)
        .collection('comments')
        .doc(commentId)
        .delete();
  }

  getallLike() async {
    fingerPrints.doc(ConstData.fingerprintDocId).snapshots().listen((event) {
      final doc = event;
      List<dynamic> likes = doc['likes'];
      if (likes.contains(auth.currentUser!.uid)) {
        isclicked.value = true;
      }
      if (doc['likes'] != null) {
        for (String uid in likes) {
          final userDoc = allUsers.doc(uid).get();

          if (userDoc != null) {
            allLikesForFingerPrint.add(userDoc);
            update();
          }
        }
      } else {
        print('Some thing wrong');
      }
    });
  }

  // final messages = <Message>[
  //   Message(
  //       name: "Ahmad Mohammed",
  //       text: "I want to thank you all for the beautiful gifts I received.",
  //       image: "assets/images/user1.png"),
  //   Message(
  //       name: "Sara Falsol",
  //       text: "You made me so happy.",
  //       image: "assets/images/user2.png"),
  //   Message(
  //       name: "Mohammed Ahmed",
  //       text: "I want to share with you all my joy with this special gift.",
  //       image: "assets/images/user3.png"),
  // ].obs;

  @override
  void onInit() {
    getFinferPrint(ConstData.fingerprintDocId);
    getAllCommectsandLikes();
    getallLike();
    // TODO: implement onInit
    super.onInit();
  }
}

class Message {
  final String name;
  final String text;
  final String image;

  Message({required this.name, required this.text, required this.image});
}
