import 'package:flut_getx/components/setting_row.dart';
import 'package:flut_getx/components/title_text.dart';
import 'package:flut_getx/localization/LanguagesSupported.dart';
import 'package:flut_getx/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/app_bar_custom.dart';
import '../components/bottom_sheet.dart';
import '../pref/services/language_service.dart';
import '../pref/services/theme_service.dart';
import '../provider/theme_provider.dart';
import '../theme/app_theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> languages = [
      LanguagesSupported.english.name,
      LanguagesSupported.urdu.name,
      LanguagesSupported.defaultLang.name
    ];
    List<String> themes = [
      AppTheme.Light.name,
      AppTheme.Dark.name,
      AppTheme.Default.name
    ];

    LanguageService languageService =
        Get.find<LanguageService>(); // Register the instance of LanguageService

    ThemeService themeService = Get.find<ThemeService>();
    return Obx(() {
      return Scaffold(
        appBar: AppBarCustom(
          title: 'settings_text'.tr,
          onBack: () {
            Get.back();
          },
        ),
        body: Container(
          color: ThemeProvider.appColor,
          child: Center(
            child: Column(
              children: [
                TitleText(title: 'settings_text'.tr), // Wrapped in Obx

                Obx(() => SettingRow(
                    title: "language_text".tr,
                    subtitle:
                        "${"language_text_selected".tr} ${languageService.currentLanguage.value}",
                    onTap: () {
                      // Open BottomSheet using GetX and pass the title and items
                      Get.bottomSheet(
                        bottomSheetContent("language_text".tr, languages, true),
                        isScrollControlled:
                            false, // Allows the sheet to take up as much space as needed
                      );
                    },
                    iconData: Icons.language)),

                Obx(() => SettingRow(
                    title: "theme_text".tr,
                    subtitle:
                        "${"theme_text_selected".tr} ${themeService.currentTheme.value}",
                    onTap: () {
                      Get.bottomSheet(
                        bottomSheetContent("theme_text".tr, themes, false),
                        isScrollControlled:
                            false, // Allows the sheet to take up as much space as needed
                      );
                    },
                    iconData: Icons.color_lens)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
