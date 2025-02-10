import 'package:flut_getx/res/routes/route_name.dart';
import 'package:flut_getx/screens/category_list_screen.dart';
import 'package:flut_getx/screens/setting_screen.dart';
import 'package:get/get.dart';
import '../../screens/splash_screen.dart';

class AppRoutes {
  static appRoutes() =>[


      GetPage(name: RouteName.Splash, page: () => SplashScreen()),
      GetPage(name: RouteName.CategoryList, page: () => CategoryListScreen()),
      GetPage(name: RouteName.Setting, page: () => SettingScreen()),
];

}
