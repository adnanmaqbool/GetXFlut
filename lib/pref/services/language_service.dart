import 'dart:ui';

import 'package:flut_getx/localization/LanguagesSupported.dart';
import 'package:get/get.dart';

import '../SharedPreferencesService.dart';

class LanguageService extends GetxController {
  RxString currentLanguage =
      LanguagesSupported.english.name.obs; // Observable language variable

  @override
  void onInit() async {
    await loadLanguage();
    super.onInit();
  }

  Future<void> loadLanguage() async {
    String? savedLanguage = await SharedPreferencesService.getLanguage();
    currentLanguage.value = savedLanguage ?? LanguagesSupported.english.name;
  }

  void saveLanguage(String language) async {
    await SharedPreferencesService.saveLanguage(language);
    currentLanguage.value = language; // Update UI automatically

    Locale newLocale = getCurrentLocale();

    print("Updating locale to: $newLocale"); // Debugging

    Get.updateLocale(getCurrentLocale());

    // Get.updateLocale(Locale('languageCode', 'countryCode')).
  }

  Locale getCurrentLocale() {
    // Convert the current language to a LanguagesSupported enum value
    LanguagesSupported selectedLanguage =
        LanguagesSupported.fromName(currentLanguage.value);

    // Return the locale associated with the selected language
    return selectedLanguage.locale;
  }

  void changeLocale() {}
}
