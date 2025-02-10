import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../res/color/app_color.dart';

class AppUtils {
  static void fieldFocus(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
  static isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
  }
  static isPasswordValid(String password) {
    return password.length >= 6;
  }
  static isPhoneNumberValid(String phone) {
    return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phone);
  }
  static isNameValid(String name) {
    return name.length >= 3;
  }
  static isAddressValid(String address) {
    return address.length >= 3;
  }

  static void showSnackBar(String title,String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.blackColor,
        colorText: AppColor.whiteColor);
  }



  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.blackColor,
        textColor: AppColor.whiteColor,
        fontSize: 16.0);
  }
}
