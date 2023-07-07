import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_widget.dart';

class EditProfileScreen extends StatefulWidget {

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _mobileController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  bool appearOtp = false;
  @override
  void initState() {
    _mobileController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80.h,
        title: Text('edit_profile'.tr,style: TextStyle(fontSize: 20.sp,color: blackTextColor),),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSpace(h: 16.0.r),
            ListTile(
              onTap: (){},
              contentPadding: EdgeInsets.zero,
             leading: Container(
               width: 80.w,
               height: 80.h,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 image: DecorationImage(
                   image: NetworkImage('https://1.bp.blogspot.com/-4l0CGOzR_2s/YGAWcctx5XI/AAAAAAAAVkU/ziLQpEpGhFUyhAyz76IUgaHnEibKanltACLcBGAsYHQ/w528-h640/5.jpg')
                 )
               ),

             ),
              title: getText('upload_image'.tr,color: sucndryColor1,decoration: TextDecoration.underline),
            ),

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
                getSpace(w: 50.w),
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
                textController: _emailController,
                hint: '',
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
                textController: _emailController,
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
                textController: _emailController,
                hint: '',
              ),
            ),

            BtnApp(title: 'save'.tr, color: btnColor, prsee: () {

            }),
            // getSpace(h: 16.0.r),
          ],
        ),
      ),
    );
  }
}
