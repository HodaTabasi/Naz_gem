import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/features/auth/ui/get/auth_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_widget.dart';
import '../../../../navigation_bar/bottom_navigation_page.dart';
import 'login.dart';
import 'otp_container.dart';

class OTPRegisterScreen extends StatefulWidget {
  @override
  State<OTPRegisterScreen> createState() => _OTPRegisterScreenState();
}

class _OTPRegisterScreenState extends State<OTPRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
                // height: 100,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getSpace(h: 16.0.r),
                      const OtpContainer(),
                      getSpace(h: 8.0.r),
                      getText('رمز التحقق هو : ${GetStorage().read('otp')}  ',
                          color: redColor, size: 16.sp, align: TextAlign.center),
                      BtnApp(
                          title: 'sure_otp'.tr,
                          color: btnColor,
                          prsee: () async {
                            bool login = await controller.login(
                                phone: controller.phone,
                                otp: GetStorage().read('otp'));
                            if(login){
                              Get.offAll(() => const BottomNavigationPage(),
                                  transition: Transition.downToUp,
                                  duration: const Duration(milliseconds: 300));
                            }else {

                            }

                          }),
                      // getSpace(h: 16.0.r),
                      Align(
                        child: getText('or'.tr,
                            color: blackTextColor,
                            size: 18.sp,
                            align: TextAlign.center),
                      ),
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
            ],
          );
        }
      ),
    );
  }
}
