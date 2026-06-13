import 'package:ai_chat/services/local_storage_services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void loadTheme() {
    final value = LocalStorageServices.getBool(LocalStorageKeys.themeValue);
    isDarkTheme.value = value ?? false;
  }

  void changeTheme(bool isDark) {
    isDarkTheme.value = isDark;

    LocalStorageServices.setBool(
      LocalStorageKeys.themeValue,
      isDarkTheme.value,
    );
  }
}
