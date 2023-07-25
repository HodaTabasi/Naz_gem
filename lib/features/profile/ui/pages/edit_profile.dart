import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/profile/ui/get/edit_profile_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/get/general_getx_controller.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_date_text_field.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_widget.dart';
import '../../../auth/domain/entities/user.dart';
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
  String dropdownValue = 'A+';

  User get user {
    return User(
      firstName: _firstNameController.text,
       lastName: _lastNameController.text,
       email: _emailController.text,
       phone: _mobileController.text,
      birthdate:_bdController.text,
      bloodType: dropdownValue,
      length: _hgtController.text,
      profileImage: EditProfileGetxController.to.file!.path
      );
  }

  @override
  void initState() {
    var controller = EditProfileGetxController.to;
    _mobileController = TextEditingController(text:controller.myUser.phone);
    _firstNameController = TextEditingController(text:controller.myUser.firstName);
    _lastNameController = TextEditingController(text:controller.myUser.lastName);
    _emailController = TextEditingController(text:controller.myUser.email);
    _hgtController = TextEditingController(text:controller.myUser.length??'');
    _bdController = TextEditingController(text:controller.myUser.birthdate??'');
    _bloodController = TextEditingController(text:controller.myUser.bloodType??'AB-');
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
        _bdController.text =
            '${currentDate.year}-${currentDate.month}-${currentDate.day}';
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(
        text: 'edit_profile'.tr,
        // textColor: blackTextColor,
        height: 80.h,
        isBack: true,
      ),
      body: GetBuilder<EditProfileGetxController>(
        builder: (controller) {
          return SingleChildScrollView(
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
                      child: Form(
                        key: GeneralGetxController.to.profileKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getText('first_name'.tr,
                                color: blackTextColor,
                                size: 16.sp,
                                align: TextAlign.center),
                            getSpace(h: 16.h),
                            SizedBox(
                              // height: 50.h,
                              child: AppTextField(
                                textController: _firstNameController,
                                hint: '',
                                onSubmitted: GeneralGetxController.to.nameValidation,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    getSpace(w: 23.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getText('last_name'.tr,
                              color: blackTextColor,
                              size: 16.sp,
                              align: TextAlign.center),
                          getSpace(h: 16.h),
                          SizedBox(
                            // height: 50.h,
                            child: AppTextField(
                              textController: _lastNameController,
                              hint: '',
                              onSubmitted: GeneralGetxController.to.nameValidation,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                getSpace(h: 16.0.r),
                getText('mobile_number'.tr,
                    color: blackTextColor, size: 16.sp, align: TextAlign.center),
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
                    onSubmitted: GeneralGetxController.to.mobileValidation,
                  ),
                ),
                getSpace(h: 16.0.r),
                getText('email'.tr,
                    color: blackTextColor, size: 16.sp, align: TextAlign.center),
                getSpace(h: 16.0.r),
                SizedBox(
                  // height: 50.h,
                  child: AppTextField(
                    textController: _emailController,
                    hint: '',
                    textInputType: TextInputType.emailAddress,
                    onSubmitted: GeneralGetxController.to.emailValidation,
                  ),
                ),
                getSpace(h: 16.0.r),
                getText('bod'.tr,
                    color: blackTextColor, size: 16.sp, align: TextAlign.center),
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
                    color: blackTextColor, size: 16.sp, align: TextAlign.center),
                getSpace(h: 16.0.r),
                SizedBox(
                  // height: 50.h,
                  child: AppTextField(
                    textController: _hgtController,
                    hint: '',
                    textInputType: TextInputType.number,
                    onSubmitted: GeneralGetxController.to.nameValidation,
                  ),
                ),
                getSpace(h: 16.0.r),
                getText('blood'.tr,
                    color: blackTextColor, size: 16.sp, align: TextAlign.center),
                getSpace(h: 16.0.r),
                // SizedBox(
                //   // height: 50.h,
                //   child: AppTextField(
                //     textController: _bloodController,
                //     hint: '',
                //     onSubmitted: GeneralGetxController.to.nameValidation,
                //   ),
                // ),
                Container(
                  height: 55.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: boarderColor,
                      // width: 0.5
                    )
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    // Step 3.
                    value: dropdownValue,
                    underline: Center(),
                    // Step 4.
                    items: <String>['A+','A-','B+','B-','O+','O-','AB+','AB-']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
                BtnApp(
                    title: 'save'.tr,
                    color: btnColor,
                    prsee: () {
                      if (GeneralGetxController.to.profileKey.currentState!
                          .validate()) {
                        controller.updateUser(user:user);
                        if(controller.isUpdated){
                          Get.back();
                        }
                        //
                      }
                    }),
                // getSpace(h: 16.0.r),
              ],
            ),
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _hgtController.dispose();
    _bdController.dispose();
    _bloodController.dispose();
    super.dispose();
  }
}
