import 'package:ai_chat/auth/login/login_screen.dart';
import 'package:ai_chat/auth/singUp/sing_up_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  void toggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginScreen(onSwitch: toggle)
        : SignUpScreen(onSwitch: toggle);
  }
}
