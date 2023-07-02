import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/widgets/app_button.dart';
import 'package:naz_gem/core/widgets/app_text_field.dart';
import 'package:naz_gem/core/constants/app_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../home/ui/pages/home_screen.dart';
import 'new_user.dart';
import 'otp_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _mobileController;
  bool appearOtp = false;
  @override
  void initState() {
    _mobileController = TextEditingController();
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
                  Text('login'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold)),
                  getSpace(h: 20.0.h),
                  Text('welcome'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                  getSpace(h: 10.0.h),
                  Text('login_sub1'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal)),
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getSpace(h: 16.0.r),
                    Text(
                      'mobile_number'.tr,
                      style: TextStyle(fontSize: 16.sp, color: blackTextColor),
                      textAlign: TextAlign.center,
                    ),
                    getSpace(h: 16.0.r),
                    SizedBox(
                      height: 60.h,
                      child: AppTextField(
                        textController: _mobileController,
                        hint: '',
                        text: '+966',
                      ),
                    ),
                    getSpace(h: 16.0.r),
                    Visibility(
                      visible: appearOtp,
                      child: const OtpContainer(),
                    ),
                    BtnApp(title: appearOtp?'ok'.tr:'sure_otp'.tr, color: btnColor, prsee: () {
                      if(appearOtp){
                        Get.offAll(()=>HomeScreen());
                      }else{
                        setState(() {
                          appearOtp = !appearOtp;
                        });
                      }

                    }),
                    // getSpace(h: 16.0.r),
                    Align(
                      child: Text(
                        'or'.tr,
                        style: TextStyle(fontSize: 18.sp, color: blackTextColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BtnApp(
                        title: 'new_user'.tr,
                        color: mainColor,
                        textColor: blackTextColor,
                        prsee: () {
                          Get.to(()=>NewUser());
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
