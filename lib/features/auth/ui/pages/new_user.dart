import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_widget.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Stack(
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/background_regqstrations.png'),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText('new_user'.tr,
                      color:Colors.white,
                      size: 28.sp,
                    weight: FontWeight.bold
                  ),
                  getSpace(h: 20.0.h),
                  getText('welcome'.tr,
                      color:Colors.white,
                      size: 18.sp,
                      weight: FontWeight.bold
                  ),
                  getSpace(h: 10.0.h),
                  getText('register_sub1'.tr,
                      color:Colors.white,
                      size: 12.sp,
                      weight: FontWeight.normal
                  ),
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
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getSpace(h: 16.0.r),
                    getText('name'.tr,
                        color:blackTextColor,
                        size: 16.sp,
                        align: TextAlign.center
                    ),

                    getSpace(h: 16.0.r),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: AppTextField(
                              textController: _mobileController,
                              hint: '',
                            ),
                          ),
                        ),
                        getSpace(w: 50.w),
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: AppTextField(
                              textController: _mobileController,
                              hint: '',
                            ),
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
                        textController: _mobileController,
                        hint: '',
                      ),
                    ),
                    BtnApp(title: 'sure_otp'.tr, color: btnColor, prsee: () {
                      Get.to(()=>OTPRegisterScreen());
                    }),
                    // getSpace(h: 16.0.r),

                    Align(
                      child: getText('or'.tr,
                          color:blackTextColor,
                          size: 18.sp,
                          align: TextAlign.center
                      )
                    ),
                    BtnApp(
                        title: 'login'.tr,
                        color: mainColor,
                        textColor: blackTextColor,
                        prsee: () {
                          Get.to(()=>LoginScreen());
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
