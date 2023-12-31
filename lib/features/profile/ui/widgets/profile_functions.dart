import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naz_gem/features/profile/ui/get/edit_profile_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
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
    // leading: IconButton(
    //     onPressed: () {
    //       Get.back();
    //     },
    //     icon: Icon(Icons.arrow_back, color: Colors.white)),
    actions: [
      IconButton(
          onPressed: () {
            Get.to(() => EditProfileScreen(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 300));
          },
          icon: SvgPicture.asset('assets/images/edit.svg'))
    ],
  );
}

ListTile buildEditImageListTile({image}) {
  ImagePicker picker = ImagePicker();
  return ListTile(
    onTap: () async {
      EditProfileGetxController.to.changeImage(await picker.pickImage(source: ImageSource.gallery));
    },
    contentPadding: EdgeInsets.zero,
    leading: Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: EditProfileGetxController.to.file != null
                  ? FileImage(File(EditProfileGetxController.to.file!.path))
                  : NetworkImage(image ??
                          'https://1.bp.blogspot.com/-4l0CGOzR_2s/YGAWcctx5XI/AAAAAAAAVkU/ziLQpEpGhFUyhAyz76IUgaHnEibKanltACLcBGAsYHQ/w528-h640/5.jpg')
                      as ImageProvider)),
    ),
    title: getText('upload_image'.tr,
        color: sucndryColor1, decoration: TextDecoration.underline),
  );
}
