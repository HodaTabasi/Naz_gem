import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/core/widgets/app_button.dart';
import 'package:naz_gem/core/widgets/app_text_field.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/auth/ui/get/auth_getx_controller.dart';

import '../../../../core/constants/snackbar_message.dart';
import '../../../../core/get/general_getx_controller.dart';
import '../../../../navigation_bar/bottom_navigation_page.dart';
import '../../../../core/constants/app_colors.dart';
import '../widget/auth_functions.dart';
import 'new_user.dart';
import 'otp_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _mobileController;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  void initState() {
    _mobileController = TextEditingController(text: '05921511052138');
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
      body: GetBuilder<AuthGetxController>(builder: (controller) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
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
                    getText('login'.tr,
                        color: Colors.white,
                        size: 28.sp,
                        weight: FontWeight.bold),
                    getSpace(h: 20.0.h),
                    getText('welcome'.tr,
                        color: Colors.white,
                        size: 18.sp,
                        weight: FontWeight.bold),
                    getSpace(h: 10.0.h),
                    getText('login_sub1'.tr,
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
                decoration: buildBoxDecoration2(),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: loginKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getSpace(h: 16.0.r),
                        getText('mobile_number'.tr,
                            color: blackTextColor,
                            size: 16.sp,
                            align: TextAlign.center),
                        getSpace(h: 16.0.r),
                        SizedBox(
                          // height: 60.h,
                          child: AppTextField(
                            textController: _mobileController,
                            hint: '',
                            textInputType: TextInputType.phone,
                            text: '+966',
                            hasSufix: true,
                            isEnabled: !controller.appearOtp,
                            onSubmitted:
                                GeneralGetxController.to.mobileValidation,
                          ),
                        ),
                        getSpace(h: 16.0.r),
                        Visibility(
                          visible: controller.appearOtp,
                          child: const OtpContainer(),
                        ),
                        getSpace(h: 8.0.r),
                        Visibility(
                          visible: controller.appearOtp,
                          child: getText(
                              'رمز التحقق هو : ${GetStorage().read('otp')}  ',
                              color: redColor,
                              size: 16.sp,
                              align: TextAlign.center),
                        ),
                        BtnApp(
                            title:
                                controller.appearOtp ? 'ok'.tr : 'sure_otp'.tr,
                            color: btnColor,
                            prsee: () async {
                              if (loginKey.currentState!.validate()) {
                                if (controller.appearOtp && controller.checkControllerEmpty()) {
                                  bool isLogin = await controller.login(
                                      phone: _mobileController.text,
                                      otp: controller.makeCode());
                                  print(isLogin);
                                  if (isLogin) {
                                    Get.offAll(
                                        () => const BottomNavigationPage(),
                                        transition: Transition.downToUp,
                                        duration:
                                            const Duration(milliseconds: 300));
                                  } else {
                                    SnackBarMessage.showErrorSnackBar(
                                        message: controller.responseMessage,
                                        context: context);
                                  }
                                } else {
                                  bool sended = await controller.sendOtp(
                                      phone: _mobileController.text);
                                  print("object $sended");
                                  if (!sended) {
                                    SnackBarMessage.showErrorSnackBar(
                                        message: controller.responseMessage,
                                        context: context);
                                  }
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
                            title: 'new_user'.tr,
                            color: mainColor,
                            textColor: blackTextColor,
                            prsee: () {
                              Get.offAll(() => NewUser(),
                                  transition: Transition.downToUp,
                                  duration: const Duration(milliseconds: 300));
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    AuthGetxController.to.despose();
    AuthGetxController.to.appearOtp = false;
    GetStorage().remove("otp");
    _mobileController.dispose();
    super.dispose();
  }
}
