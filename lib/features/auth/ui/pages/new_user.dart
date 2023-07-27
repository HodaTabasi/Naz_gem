import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/get/general_getx_controller.dart';
import 'package:naz_gem/features/auth/domain/entities/user.dart';
import 'package:naz_gem/features/auth/ui/get/auth_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/snackbar_message.dart';
import '../../../../core/strings/failures.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_widget.dart';
import '../widget/auth_functions.dart';
import 'login.dart';
import 'otp_register_screen.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  late TextEditingController _mobileController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  bool checkValue = false;

  User get user  {
    return User(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phone: _mobileController.text,
      email: _emailController.text,
    );
  }

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
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: GetBuilder<AuthGetxController>(
        builder: (controller) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                // height: 100,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.3,
                  padding: EdgeInsets.all(16.r),
                  width: double.infinity,
                  decoration: buildBoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText('new_user'.tr,
                          color: Colors.white,
                          size: 28.sp,
                          weight: FontWeight.bold),
                      getSpace(h: 20.0.h),
                      getText('welcome'.tr,
                          color: Colors.white,
                          size: 18.sp,
                          weight: FontWeight.bold),
                      getSpace(h: 10.0.h),
                      getText('register_sub1'.tr,
                          color: Colors.white,
                          size: 12.sp,
                          weight: FontWeight.normal),
                      getSpace(h: 45.0.h)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.64,
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: buildBoxDecoration2(),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: GeneralGetxController.to.newUserKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getSpace(h: 16.0.r),
                          getText('name'.tr,
                              color: blackTextColor,
                              size: 16.sp,
                              align: TextAlign.center),

                          getSpace(h: 16.0.r),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  // height: 50.h,
                                  child: AppTextField(
                                    textController: _firstNameController,
                                    hint: '',
                                    onSubmitted:
                                    GeneralGetxController.to.nameValidation,
                                  ),
                                ),
                              ),
                              getSpace(w: 23.w),
                              Expanded(
                                child: SizedBox(
                                  // height: 50.h,
                                  child: AppTextField(
                                      textController: _lastNameController,
                                      hint: '',
                                      onSubmitted:
                                      GeneralGetxController.to.nameValidation),
                                ),
                              ),
                            ],
                          ),
                          getSpace(h: 16.0.r),
                          getText('mobile_number'.tr,
                              color: blackTextColor,
                              size: 16.sp,
                              align: TextAlign.center),
                          getSpace(h: 16.0.r),
                          SizedBox(
                            // height: 50.h,
                            child: AppTextField(
                                textController: _mobileController,
                                hint: '',
                                text: '+966',
                                hasSufix: true,
                                textInputType: TextInputType.number,
                                direction: TextDirection.rtl,
                                onSubmitted:
                                GeneralGetxController.to.mobileValidation),
                          ),
                          getSpace(h: 16.0.r),
                          getText(
                            'email'.tr,
                            color: blackTextColor,
                            size: 16.sp,
                            align: TextAlign.center,
                          ),
                          getSpace(h: 16.0.r),
                          SizedBox(
                            // height: 50.h,
                            child: AppTextField(
                                textController: _emailController,
                                hint: '',
                                onSubmitted: GeneralGetxController.to.emailValidation),
                          ),
                          getSpace(h: 18.0.r),
                          Row(
                            children: [
                              Checkbox(
                                value: checkValue,
                                onChanged: (value) {
                                  setState(() {
                                    checkValue = value!;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.r)),
                                activeColor: blackTextColor,
                              ),
                              Text.rich(
                                maxLines: 3,
                                TextSpan(
                                  style: TextStyle(color: btnColor),
                                  children: [
                                    TextSpan(
                                        text: 'm1'.tr),
                                    TextSpan(
                                        text: 'm2'.tr,
                                        style: TextStyle(color: sucndryColor)),
                                    TextSpan(text: 'm3'.tr),
                                  ],
                                ),
                              )
                            ],
                          ),
                          getSpace(h: 16.0.r),
                          BtnApp(
                              title: 'sure_otp'.tr,
                              color: btnColor,
                              prsee: () async {
                                if (GeneralGetxController.to.newUserKey.currentState!
                                    .validate()) {
                                  if(checkValue){
                                    bool result = await controller.createAccount(user: user);
                                    if(result){
                                      Get.to(() => OTPRegisterScreen(),
                                          transition: Transition.downToUp,
                                          duration: const Duration(milliseconds: 300));
                                    }else {
                                      SnackBarMessage.showErrorSnackBar(
                                          message: controller.responseMessage, context: context);
                                    }
                                  }else {
                                    SnackBarMessage.showErrorSnackBar(
                                        message: CHECK_MESSAGE, context: context);
                                  }
                                }
                              }),
                          // getSpace(h: 16.0.r),

                          Align(
                              child: getText('or'.tr,
                                  color: blackTextColor,
                                  size: 18.sp,
                                  align: TextAlign.center)),
                          BtnApp(
                              title: 'login'.tr,
                              color: mainColor,
                              textColor: blackTextColor,
                              prsee: () {
                                Get.to(() => const LoginScreen(),
                                    transition: Transition.downToUp,
                                    duration: const Duration(milliseconds: 500));
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
