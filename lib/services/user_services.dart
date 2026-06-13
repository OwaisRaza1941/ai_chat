import 'package:ai_chat/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  /// Collection reference for users in Firestore
  final CollectionReference _usersCollection = FirebaseFirestore.instance
      .collection('users');

  //// Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
 
  /// Method to add a new user to Firestore
  Future<void> addUser(UserModel user) async {
    try {
      final uid = _auth.currentUser?.uid;
      user.uid = uid;
      await _usersCollection.doc(user.uid).set(user.toMap());
    } on FirebaseException {
      rethrow;
    }
  }
}
