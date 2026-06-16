import 'package:ai_chat/auth_wrapper.dart';
import 'package:ai_chat/bindings/auth_bindigs.dart';
import 'package:ai_chat/controller/theme_controller.dart';
import 'package:ai_chat/firebase_options.dart';
import 'package:ai_chat/services/local_storage_services.dart';
import 'package:ai_chat/utils/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalStorageServices.initlize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() {
      return GetMaterialApp(
        initialBinding: InitialBinding(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.isDarkTheme.value
            ? ThemeMode.dark
            : ThemeMode.light,
        home: AuthWrapper(),
      );
    });
  }
}
