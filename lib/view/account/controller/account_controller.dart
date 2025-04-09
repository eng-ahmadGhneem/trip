import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  var userName = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var country = ''.obs;
  var idNumber = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // call on startup
  }

  void fetchUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String userId = currentUser.uid;

        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          userName.value = data['username'] ?? '';
          email.value = data['email'] ?? '';
          phone.value = data['phone'] ?? '';
          country.value = data['country'] ?? '';
          idNumber.value = data['id'] ?? '';
        }
      } else {
        print("User is not logged in.");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

}
