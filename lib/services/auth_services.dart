import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  /// Authentication Services
  final FirebaseAuth _authSerices = FirebaseAuth.instance;

  /// GOOGL SININ IN INSTANCE
  final GoogleSignIn _googleSingIn = GoogleSignIn.instance;

  /// SINUP Loading
  RxBool sinUpLoading = false.obs;

  /// LOGIN Loading
  RxBool loginLoading = false.obs;

  // LOGOUT Loading
  RxBool logoutLoading = false.obs;

  /// Singup with email and password
  Future<User?> sinUpWitEmailPassword(String email, String password) async {
    try {
      final UserCredential credential = await _authSerices
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseException {
      rethrow;
    }
  }

  /// Sign in with email and password
  Future<User?> loginWithEmalAndPassword(String email, String password) async {
    try {
      final UserCredential credential = await _authSerices
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseException {
      rethrow;
    }
  }

  // GOOGLE SINGIN
  Future<UserCredential> continueWithGoogle() async {
    try {
      String webClientId =
          '868475064396-cm21dqgbmnlgfp654f10lu18mclnunc6.apps.googleusercontent.com';

      await _googleSingIn.initialize(serverClientId: webClientId);

      GoogleSignInAccount account = await _googleSingIn.authenticate();

      GoogleSignInAuthentication googleAuth = account.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _authSerices.signInWithCredential(
        credential,
      );

      return userCredential;
    } on FirebaseException {
      rethrow;
    }
  }

  // /// FaceBook Sing Uo
  // Future<UserCredential?> facebookSignUp() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();

  //     if (result.status == LoginStatus.success) {
  //       final AccessToken accessToken = result.accessToken!;

  //       final OAuthCredential credential = FacebookAuthProvider.credential(
  //         accessToken.tokenString,
  //       );

  //       return await FirebaseAuth.instance.signInWithCredential(credential);
  //     }

  //     return null;
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //     rethrow;
  //   }
  // }

  /// Reset Password
  Future<void> resetPassword(String email) async {
    try {
      await _authSerices.sendPasswordResetEmail(email: email);
    } on FirebaseException {
      rethrow;
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      // Firebase logout
      await _authSerices.signOut();
    } on FirebaseException {
      rethrow;
    }
  }
}
