
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';
import '../SharedPreferencesService.dart';


class ThemeService extends GetxController {
  RxString currentTheme = AppTheme.Light.name.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadTheme();
  }

  Future<void> loadTheme() async {
    String? savedTheme = await SharedPreferencesService.getTheme();
    currentTheme.value = savedTheme ?? AppTheme.Light.name;
    updateTheme(AppTheme.fromName(currentTheme.value)); // Ensure theme is applied
  }

  void saveTheme(String theme) async {
    print("Selected Theme -> $theme");

    await SharedPreferencesService.saveTheme(theme);
    currentTheme.value = theme;

    updateTheme(AppTheme.fromName(theme)); // Apply theme
  }

  /// Returns the correct `ThemeMode`
  ThemeMode get themeMode {
    AppTheme selectedTheme = AppTheme.fromName(currentTheme.value);
    switch (selectedTheme) {
      case AppTheme.Dark:
        return ThemeMode.dark;
      case AppTheme.Light:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  /// Updates the theme dynamically
  void updateTheme(AppTheme theme) {
    Get.changeThemeMode(themeMode); // Apply theme using computed themeMode
    print("Applied Theme -> ${themeMode.toString()}");
  }
}


