import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../navigation_bar/bottom_navigation_page.dart';
import '../widgets/subscrbtion_functions.dart';

class PaymentScreen extends StatefulWidget {

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Load a Lottie file from your assets
            Lottie.asset('assets/images/json_images/animation_ll87n8b8.json'),
            // Image.asset('assets/images/done_pay.png'),
            getSpace(h: 8.r),
            getText(
              'hint_meg'.tr,
              color: blackTextColor,
              size: 16.sp,
            ),
            getSpace(h: 16.h),
            Padding(
              padding: EdgeInsets.all(16.0.r),
              child: BtnApp(title: 'connect'.tr,
                  prsee: (){
                whatsapp();
              }, color: btnColor),
            ),
            TextButton(
                onPressed: (){
              Get.offAll(()=>const BottomNavigationPage(),transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 300));
            }, child: getText('back'.tr,size: 16.sp,color: btnColor))
          ],
        ),
      ),
    );
  }

}
