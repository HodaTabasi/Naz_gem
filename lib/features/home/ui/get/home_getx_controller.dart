import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';

class HomeGetxController extends GetxController {
  RxInt currentIndex = 0.obs;
  Rx<Color> subBackColor = btnColor.obs;
  Rx<Color> subTextColor = Colors.white.obs;

  static HomeGetxController get to =>
      Get.find<HomeGetxController>();

  changeCurrentIndex({index}){
    currentIndex.value = index;
    if(index == 0){
      subBackColor.value = btnColor;
      subTextColor.value = Colors.white;
    }else {
      subBackColor.value = mainColor;
      subTextColor.value = blackTextColor;
    }
}

}