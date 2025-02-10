import 'package:flut_getx/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../localization/Languages.dart';
import '../pref/services/language_service.dart';
import '../pref/services/theme_service.dart';
import '../res/routes/app_routes.dart';
import '../res/routes/route_name.dart';
import '../theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure bindings are initialized

  final languageService =  Get.put(LanguageService()); // Register the instance of LanguageService
  await languageService.loadLanguage();  // Wait for language to load

 final themeService =  Get.put(ThemeService()); // Initialize ThemeService
  await themeService.loadTheme();  // Wait for language to load



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  LanguageService  languageService =   Get.find<LanguageService>(); // Fetch the locale
  ThemeService  themeService =   Get.find<ThemeService>(); // Fetch the locale

  print("local2-> ${languageService.currentLanguage.value}");
  print("local1-> ${languageService.getCurrentLocale()}");


    return Obx(() => GetMaterialApp(
      title: 'app_name'.tr,
      translations: Languages(),
      locale:  languageService.getCurrentLocale(),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: RouteName.Splash,  // Starting screen
      getPages: AppRoutes.appRoutes(), // Your route definitions
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeService.themeMode, // Use centralized logic
      home:  SplashScreen(),
    ));
  }
}


