import 'package:ai_chat/dailog/app_snackbar.dart';
import 'package:ai_chat/model/user_model.dart';
import 'package:ai_chat/services/auth_services.dart';
import 'package:ai_chat/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  /// Authentication Services
  final AuthServices _authServices = AuthServices();
  final UserServices _userServices = UserServices();

  /// SINUP Loading
  RxBool sinUpLoading = false.obs;

  /// LOGIN Loading
  RxBool loginLoading = false.obs;

  // GOOGLE Loading
  RxBool googleLoading = false.obs;

  // LOGOUT Loading
  RxBool logoutLoading = false.obs;

  // Reset Password Loading
  RxBool resetPasswordLoading = false.obs;

  /// VALIDATION
  /// WE USE THESE VARIABLES TO VALIDATE THE USER INPUTS AND SHOW ERROR MESSAGES IF THE INPUTS ARE INVALID
  final nameError = ''.obs;
  final emailError = ''.obs;
  final passwordError = ''.obs;

  /// VALIDATION STATUS
  final isNameValid = false.obs;
  final isEmailValid = false.obs;
  final isPasswordValid = false.obs;

  /// VALIDATION FUNCTIONS
  void validateName(String value) {
    if (value.trim().length >= 3) {
      isNameValid.value = true;
      nameError.value = '';
    } else {
      isNameValid.value = false;
      nameError.value = 'Name must be at least 3 characters';
    }
  }

  /// VALIDATION FUNCTIONS
  void validateEmail(String value) {
    if (GetUtils.isEmail(value)) {
      isEmailValid.value = true;
      emailError.value = '';
    } else {
      isEmailValid.value = false;
      emailError.value = 'Invalid email';
    }
  }

  /// VALIDATION FUNCTIONS
  void validatePassword(String value) {
    if (value.length >= 6) {
      isPasswordValid.value = true;
      passwordError.value = '';
    } else {
      isPasswordValid.value = false;
      passwordError.value = 'Password must be at least 6 characters';
    }
  }

  /// Sing up with email and password
  Future<User?> sinUpWitEmailPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      sinUpLoading.value = true;
      final User? cred = await _authServices.sinUpWitEmailPassword(
        email,
        password,
      );

      if (cred != null) {
        await cred.updateDisplayName(name);

        UserModel userModel = UserModel(
          name: name,
          email: email,
          createdAt: DateTime.now(),
        );

        await _userServices.addUser(userModel);

        AppSnackbar.success("Signup successful! Please login to continue.");
      }
      return cred;
    } on FirebaseException catch (e) {
      String msg = "Signup failed";
      if (e.code == 'email-already-in-use') {
        msg = "You already have an account, please login.";
      } else if (e.code == 'weak-password') {
        msg = "Password is too weak";
      } else if (e.code == 'invalid-email') {
        msg = "Email is invalid";
      }
      AppSnackbar.error(msg);
    } finally {
      sinUpLoading.value = false;
    }
    return null;
  }

  /// Lgin with email and password
  Future<User?> loginWithEmalAndPassword(String email, String password) async {
    try {
      loginLoading.value = true;
      final User? cred = await _authServices.loginWithEmalAndPassword(
        email,
        password,
      );
      if (cred != null) {
        AppSnackbar.success("Login successful!");
      }
      return cred;
    } on FirebaseException catch (e) {
      String msg = "Login failed";
      if (e.code == 'user-not-found') {
        msg = "No account found with this email.";
      } else if (e.code == 'wrong-password') {
        msg = "Incorrect password.";
      } else if (e.code == 'invalid-email') {
        msg = "Please enter a valid email address.";
      } else if (e.code == 'user-disabled') {
        msg = "Your account has been disabled.";
      }
      AppSnackbar.error(msg);
    } finally {
      loginLoading.value = false;
    }
    return null;
  }

  //// GOOGLE AUTHENTICATION
  // Future<void> continueWithGoogle() async {
  //   try {
  //     googleLoading.value = true;
  //     UserCredential? credential = await _authServices.continueWithGoogle();
  //     if (credential != null) {
  //       AppSnackbar.success('Googel Account Created Succesfull');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     String msg = "Google sign in failed";

  //     if (e.code == "account-exists-with-different-credential") {
  //       msg = "This email is already linked with another sign in method.";
  //     } else if (e.code == "invalid-credential") {
  //       msg = "Invalid Google credentials.";
  //     } else if (e.code == "operation-not-allowed") {
  //       msg = "Google Sign-In is not enabled.";
  //     } else if (e.code == "network-request-failed") {
  //       msg = "Please check your internet connection.";
  //     } else if (e.code == "too-many-requests") {
  //       msg = "Too many attempts. Try again later.";
  //     }

  //     AppSnackbar.error(msg);
  //   } finally {
  //     googleLoading.value = false;
  //   }
  // }

  /// Reset Password
  Future<void> resetPassword(String email) async {
    try {
      resetPasswordLoading.value = true;
      await _authServices.resetPassword(email);
      AppSnackbar.success('Reset Password Successfully!');
    } catch (e) {
      AppSnackbar.error(e.toString());
    } finally {
      resetPasswordLoading.value = false;
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      logoutLoading.value = true;
      // Firebase logout
      await _authServices.logout();
    } catch (e) {
      rethrow;
    } finally {
      logoutLoading.value = false;
    }
  }
}
