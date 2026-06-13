import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static void show({
    required String title,
    required String message,
    Color bgColor = Colors.black,
    IconData icon = Icons.check_circle,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.transparent,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 2),

        messageText: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),

          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(message, style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ],
          ),
        ),

        animationDuration: Duration(milliseconds: 500),
      ),
    );
  }

  /// Success
  static void success(String msg) {
    show(
      title: "Success",
      message: msg,
      bgColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  /// Error
  static void error(String msg) {
    show(title: "Error", message: msg, bgColor: Colors.red, icon: Icons.error);
  }
}
