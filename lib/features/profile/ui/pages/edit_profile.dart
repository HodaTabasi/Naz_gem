import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_widget.dart';
import '../widgets/profile_functions.dart';

class EditProfileScreen extends StatefulWidget {

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _mobileController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _hgtController;
  late TextEditingController _bdController;
  late TextEditingController _bloodController;
  bool appearOtp = false;
  @override
  void initState() {
    _mobileController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _hgtController = TextEditingController();
    _bdController = TextEditingController();
    _bloodController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:getAppBar(
        text: 'edit_profile'.tr,
        // textColor: blackTextColor,
        height: 80.h,
        isBack: true,

      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSpace(h: 16.0.r),
            buildEditImageListTile(),

            getSpace(h: 20.0.r),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText('first_name'.tr,
                          color:blackTextColor,
                          size: 16.sp,
                          align: TextAlign.center
                      ),
                      getSpace(h: 16.h),
                      SizedBox(
                        height: 50.h,
                        child: AppTextField(
                          textController: _firstNameController,
                          hint: '',
                        ),
                      ),
                    ],
                  ),
                ),
                getSpace(w: 23.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText('last_name'.tr,
                          color:blackTextColor,
                          size: 16.sp,
                          align: TextAlign.center
                      ),
                      getSpace(h: 16.h),
                      SizedBox(
                        height: 50.h,
                        child: AppTextField(
                          textController: _lastNameController,
                          hint: '',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            getSpace(h: 16.0.r),
            getText('mobile_number'.tr,
                color:blackTextColor,
                size: 16.sp,
                align: TextAlign.center
            ),
            getSpace(h: 16.0.r),
            SizedBox(
              height: 50.h,
              child: AppTextField(
                textController: _mobileController,
                hint: '',
                text: '+966',
                hasSufix: true,
                textInputType: TextInputType.number,
              ),
            ),
            getSpace(h: 16.0.r),
            getText('email'.tr,
                color:blackTextColor,
                size: 16.sp,
                align: TextAlign.center
            ),
            getSpace(h: 16.0.r),
            SizedBox(
              height: 50.h,
              child: AppTextField(
                textController: _emailController,
                hint: '',
                textInputType: TextInputType.emailAddress,
              ),
            ),
            getSpace(h: 16.0.r),
            getText('bod'.tr,
                color:blackTextColor,
                size: 16.sp,
                align: TextAlign.center
            ),
            getSpace(h: 16.0.r),
            SizedBox(
              height: 50.h,
              child: AppTextField(
                textController: _bdController,
                hint: '',
                hasSufix: true,
                direction: TextDirection.ltr,
              ),
            ),
            getSpace(h: 16.0.r),
            getText('hgt'.tr,
                color:blackTextColor,
                size: 16.sp,
                align: TextAlign.center
            ),
            getSpace(h: 16.0.r),
            SizedBox(
              height: 50.h,
              child: AppTextField(
                textController: _hgtController,
                hint: '',
              ),
            ),
            getSpace(h: 16.0.r),
            getText('blood'.tr,
                color:blackTextColor,
                size: 16.sp,
                align: TextAlign.center
            ),
            getSpace(h: 16.0.r),
            SizedBox(
              height: 50.h,
              child: AppTextField(
                textController: _bloodController,
                hint: '',
              ),
            ),

            BtnApp(title: 'save'.tr, color: btnColor, prsee: () {
              Get.back();
            }),
            // getSpace(h: 16.0.r),
          ],
        ),
      ),
    );
  }


}
