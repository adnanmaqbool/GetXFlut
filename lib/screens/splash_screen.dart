import 'dart:ffi';

import 'package:flut_getx/components/title_text.dart';
import 'package:flut_getx/const/app_const.dart';
import 'package:flut_getx/res/color/app_color.dart';
import 'package:flut_getx/res/routes/app_routes.dart';
import 'package:flut_getx/res/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/theme_provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay for 3 seconds before navigating to HomeScreen
    Future.delayed(const Duration(seconds: AppConst.splashShowTime), () {
      Get.offNamed(RouteName
          .CategoryList); // Or you can use Get.toNamed(RouteName.Home) based on your requirement
    });

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ThemeProvider.backgroundColor,
        child: Center(
          child:
        TitleText(title: 'splash_text'.tr),
        ),
      ),
    );
  }
}
