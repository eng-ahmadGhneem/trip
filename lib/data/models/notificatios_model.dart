import 'package:cloud_firestore/cloud_firestore.dart';
class NotificationModel {
  final String id;  // معرّف الإشعار
  final String senderId;
  final String senderName;
  final String senderImage;
  final String receiverId;
  final String action;
  final Timestamp timestamp;

  NotificationModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.senderImage,
    required this.receiverId,
    required this.action,
    required this.timestamp,
  });

  factory NotificationModel.fromDoc(DocumentSnapshot doc) {
    return NotificationModel(
      id: doc.id, // المعرّف الفريد للإشعار
      senderId: doc['senderId'],
      senderName: doc['senderName'],
      senderImage: doc['senderImage'],
      receiverId: doc['receiverId'],
      action: doc['action'],
      timestamp: doc['timestamp'],
    );
  }
}

