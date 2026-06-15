import 'package:ai_chat/services/local_storage_services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  /// Is Darked Value
  RxBool isDarkTheme = false.obs;

  /// Wen COntroller Call Start Set Theme
  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  /// Load Theme
  void loadTheme() {
    final value = LocalStorageServices.getBool(LocalStorageKeys.themeValue);
    isDarkTheme.value = value ?? false;
  }

  /// Chaneg Theme
  void changeTheme(bool isDark) {
    isDarkTheme.value = isDark;

    LocalStorageServices.setBool(
      LocalStorageKeys.themeValue,
      isDarkTheme.value,
    );
  }
}
