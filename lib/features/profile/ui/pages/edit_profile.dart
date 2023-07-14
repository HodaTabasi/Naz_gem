import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/profile/ui/get/edit_profile_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_date_text_field.dart';
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
  DateTime currentDate = DateTime.now();
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        cancelText: 'الغاء الامر',
        confirmText: 'حسنا',
        textDirection: TextDirection.rtl,
        helpText: 'حدد التاريخ',
        firstDate: DateTime(1900),
        lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: btnColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: blackTextColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: btnColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        _bdController.text = '${currentDate.day} /${currentDate.month} / ${currentDate.year}';
      });
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
            getSpace(h: 14.0.r),
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
                        // height: 50.h,
                        child: AppTextField(
                          textController: _firstNameController,
                          hint: '',
                          onSubmitted: EditProfileGetxController.to.nameValidation,
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
                        // height: 50.h,
                        child: AppTextField(
                          textController: _lastNameController,
                          hint: '',
                          onSubmitted: EditProfileGetxController.to.nameValidation,
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
              // height: 50.h,
              child: AppTextField(
                textController: _mobileController,
                hint: '',
                text: '+966',
                hasSufix: true,
                isEnabled: false,
                textInputType: TextInputType.number,
                onSubmitted: EditProfileGetxController.to.mobileValidation,
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
              // height: 50.h,
              child: AppTextField(
                textController: _emailController,
                hint: '',
                textInputType: TextInputType.emailAddress,
                onSubmitted: EditProfileGetxController.to.emailValidation,
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
              child: AppDateTextField(
                textController: _bdController,
                hint: 'dD/MM/YYYY',
                hasSufix: true,
                isEnabled: false,
                direction: TextDirection.ltr,
                onSubmitted: () {
                  _selectDate(context);
                },
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
              // height: 50.h,
              child: AppTextField(
                textController: _hgtController,
                hint: '',
                onSubmitted: EditProfileGetxController.to.nameValidation,
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
              // height: 50.h,
              child: AppTextField(
                textController: _bloodController,
                hint: '',
                onSubmitted: EditProfileGetxController.to.nameValidation,
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
