import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final int id;
  final String username;
  final String userImage;
  final String postText;
  final DateTime postDate;
  final String? postImage;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final bool isOwner;
  final List<String> recentInteractors; // مصفوفة التفاعلات الأخيرة
  final List<Comment> comments; // قائمة التعليقات

  Post({
    required this.id,
    required this.username,
    required this.userImage,
    required this.postText,
    required this.postDate,
    this.postImage,
    required this.likesCount,
    required this.commentsCount,
    required this.sharesCount,
    required this.isOwner,
    required this.recentInteractors, // التفاعلات
    required this.comments, // التعليقات
  });

  // تحويل البيانات من Firestore إلى نموذج Post
  factory Post.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Post(
      id: data['id'],
      username: data['username'],
      userImage: data['userImage'],
      postText: data['postText'],
      postDate: (data['postDate'] as Timestamp).toDate(),
      postImage: data['postImage'],
      likesCount: data['likesCount'],
      commentsCount: data['commentsCount'],
      sharesCount: data['sharesCount'],
      isOwner: data['isOwner'],
      recentInteractors: List<String>.from(data['recentInteractors'] ?? []),
      comments: (data['comments'] as List)
          .map((commentData) => Comment.fromMap(commentData))
          .toList(),
    );
  }

  // تحويل النموذج إلى بيانات لتخزينها في Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'userImage': userImage,
      'postText': postText,
      'postDate': Timestamp.fromDate(postDate),
      'postImage': postImage,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'sharesCount': sharesCount,
      'isOwner': isOwner,
      'recentInteractors': recentInteractors,
      'comments': comments.map((comment) => comment.toMap()).toList(),
    };
  }
}

class Comment {
  final String username;
  final String commentText;
  final DateTime commentDate;

  Comment({
    required this.username,
    required this.commentText,
    required this.commentDate,
  });

  factory Comment.fromMap(Map<String, dynamic> data) {
    return Comment(
      username: data['username'],
      commentText: data['commentText'],
      commentDate: (data['commentDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'commentText': commentText,
      'commentDate': Timestamp.fromDate(commentDate),
    };
  }
}
