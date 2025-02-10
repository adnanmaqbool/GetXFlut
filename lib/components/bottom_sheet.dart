import 'package:flut_getx/components/title_text.dart';
import 'package:flut_getx/localization/LanguagesSupported.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pref/services/language_service.dart';
import '../pref/services/theme_service.dart';
import '../provider/theme_provider.dart';
import '../theme/app_theme.dart';

Widget bottomSheetContent(String title, List<String> items, bool isLanguage) {
  // Accessing the service anywhere in your app
  LanguageService languageService = Get.find<LanguageService>();
  ThemeService themeService = Get.find<ThemeService>(); // Theme management

  return Container(
    padding: EdgeInsets.all(16),
    color: ThemeProvider.appColor,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Display the title at the top
        TitleText(
          title: title,
        ),
        SizedBox(height: 20),
        // Use ListView to display the items with Radio buttons
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Obx(() {
                String selectedValue = isLanguage
                    ? languageService.currentLanguage.value
                    : themeService.currentTheme.value; // Check theme

                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Radio Button for each item
                    Radio<String>(
                      value: items[index],
                      groupValue: selectedValue,
                      // Bind to GetX
                      onChanged: (String? value) {
                        if (isLanguage) {
                          LanguagesSupported selectedLanguage =
                              LanguagesSupported.fromName(value!);
                          languageService.saveLanguage(selectedLanguage.name);
                        } else {
                          AppTheme appTheme = AppTheme.fromName(value!);

                          themeService
                              .saveTheme(appTheme.name); // Save selected theme
                        }
                        Get.back();
                      },
                    ),
                    // Text for each item
                    TitleText(
                      title: items[index],
                    ),
                  ],
                );
              });
            },
          ),
        ),
      ],
    ),
  );
}
