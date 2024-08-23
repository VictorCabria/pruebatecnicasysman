import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    if (Get.isDarkMode) {
      Get.changeTheme(ThemeData.light());
      isDarkMode.value = false;
    } else {
      Get.changeTheme(ThemeData.dark());
      isDarkMode.value = true;
    }
  }
}
