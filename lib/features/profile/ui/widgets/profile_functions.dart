import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_widget.dart';
import '../pages/edit_profile.dart';

AppBar buildAppBar() {
  return AppBar(
    toolbarHeight: 90.h,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: getText(
      'profile'.tr,
      color: Colors.white,
      size: 20.sp,
    ),
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white)),
    actions: [
      IconButton(
          onPressed: () {
            Get.to(()=>EditProfileScreen(),transition: Transition.downToUp,
                duration: const Duration(milliseconds: 500));
          },
          icon: SvgPicture.asset('assets/images/edit.svg'))
    ],
  );
}