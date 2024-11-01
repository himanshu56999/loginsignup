import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbService {
  User? user = FirebaseAuth.instance.currentUser;

  // USER DATA
  // save user data after creating new account
  Future saveUserData({required String name, required String email}) async {
    try {
      Map<String, dynamic> data = {
        "name": name,
        "email": email,
      };
      //random
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .set(data);
    } catch (e) {
      print("error on saving user data: $e");
    }
  }

  // update other data in database
  Future updateUserData({required Map<String, dynamic> extraData}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update(extraData);
  }

  // read user current  user data
  Stream<DocumentSnapshot> readUserData() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .snapshots();
  }
}

