import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/home/ui/get/home_getx_controller.dart';

import '../constants/app_colors.dart';

class AppToggle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetX<HomeGetxController>(
      init: HomeGetxController(),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.r),
          child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                  border: Border.all(color: boarderColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2.2,
                              controller.currentIndex == 0 ? 80 : 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.r),
                                  bottomRight: Radius.circular(10.r))),
                          backgroundColor:
                          controller.currentIndex == 0 ? btnColor : tabColor,
                          elevation: 0),
                      onPressed: () {

                          controller.changeCurrentIndex(index: 0);

                      },
                      child: Text(
                        'public_pakage'.tr,
                        style: TextStyle(
                            color: controller.currentIndex == 0
                                ? Colors.white
                                : blackTextColor),
                      )),
                  // getSpace(w: 8.r),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2.2,
                              controller.currentIndex == 1 ? 80 : 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r))),
                          backgroundColor:
                          controller.currentIndex == 1 ? mainColor : tabColor,
                          elevation: 0),
                      onPressed: () {
                          controller.changeCurrentIndex(index: 1);

                      },
                      child: Text('private_pakage'.tr,
                          style: TextStyle(
                              color: controller.currentIndex == 1
                                  ? Colors.white
                                  : blackTextColor)))
                ],
              )),
        );
      }
    );
  }
}
