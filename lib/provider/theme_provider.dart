import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pref/services/theme_service.dart';
import '../res/color/app_color.dart';
import '../theme/app_theme.dart';

class ThemeProvider {
  static Color get backgroundColor {
    final themeService = Get.find<ThemeService>();
    return themeService.currentTheme.value == AppTheme.Dark.name
        ? AppColor.darkBackgroundColor
        : AppColor.lightBackgroundColor;
  }

  static Color get textColor {
    final themeService = Get.find<ThemeService>();
    return themeService.currentTheme.value == AppTheme.Dark.name
        ? AppColor.darkTextColor
        : AppColor.lightTextColor;
  }

  // Add more colors here if needed
  static Color get appColor {
    final themeService = Get.find<ThemeService>();
    return themeService.currentTheme.value == AppTheme.Dark.name
        ? AppColor.darkAppColor
        : AppColor.lightAppColor;
  }
}
